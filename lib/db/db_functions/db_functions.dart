import 'package:flutter/foundation.dart';
import 'package:student_data/db/db_model/student_model.dart';

ValueNotifier<List<studentModel>> studentModelList = ValueNotifier([]);

Future<void> addStudent(studentModel stumodobj) async {
  studentModelList.value.add(stumodobj);
  studentModelList.notifyListeners();
}
