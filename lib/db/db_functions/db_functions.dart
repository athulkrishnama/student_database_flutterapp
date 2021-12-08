import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_data/db/db_model/student_model.dart';

ValueNotifier<List<studentModel>> studentModelList = ValueNotifier([]);
late Database studb;
Future<void> opendb() async {
  studb = await openDatabase(
    'Stu.db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE student(id INTEGER PRIMARY KEY,name TEXT,age TEXT)');
    },
  );
  getAllStudents();
}

Future<void> addStudent(studentModel stumodobj) async {
  studb.rawInsert('INSERT INTO student(name,age) VALUES(?,?)',
      [stumodobj.name, stumodobj.age]);
  getAllStudents();
}

Future<void> getAllStudents() async {
  studentModelList.value.clear();
  final studata = await studb.rawQuery('SELECT * FROM student');
  studata.forEach((element) {
    final stuobj = studentModel.toStuModObj(element);
    studentModelList.value.add(stuobj);
  });
  studentModelList.notifyListeners();
}

Future<void> deleteStudent({required int id}) async {
  await studb.rawDelete('DELETE FROM student WHERE id=?', [id]);
  getAllStudents();
}

Future<void> clearAllData() async {
  await studb.rawQuery('DELETE FROM student');
  getAllStudents();
}

Future<void> updateStudent(studentModel obj) async {
  studb.rawUpdate("UPDATE student SET name = ?, age = ? WHERE id =?",
      [obj.name, obj.age, obj.id]);
  getAllStudents();
}
