import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_data/db/db_model/student_model.dart';

ValueNotifier<List<studentModel>> studentModelList = ValueNotifier([]);
late Database studb;
Future<void> opendb() async {
  studb = await openDatabase(
    'Studb',
    version: 1,
    onCreate: (db, version) async {
      db.execute(
          'CREATE TABLE student(id INTEGER PRIMARY KEY,name TEXT,age TEXT)');
    },
  );
}

Future<void> addStudent(studentModel stumodobj) async {
  studentModelList.value.add(stumodobj);
  studentModelList.notifyListeners();
  studb.rawInsert('INSERT INTO student(name,age) VALUES(?,?)',
      [stumodobj.name, stumodobj.age]);
}

Future<void> getAllStudents() async {
  studentModelList.value.clear();
  final studata = await studb.rawQuery('SELECT * FROM student');
  studata.forEach((element) {
    final stuobj = studentModel.toStuModObj(element);
    studentModelList.value.add(stuobj);
  }
  );
  studentModelList.notifyListeners();
}
