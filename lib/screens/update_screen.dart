import 'package:flutter/material.dart';
import 'package:student_data/db/db_functions/db_functions.dart';
import 'package:student_data/db/db_model/student_model.dart';

class UpdateScreen extends StatelessWidget {
  studentModel obj;
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  UpdateScreen({Key? key, required this.obj}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Student Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'New Name'),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'New Age'),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  updateStudentData(context);
                },
                icon: Icon(Icons.update),
                label: Text('Update'))
          ],
        ),
      ),
    );
  }

  Future<void> updateStudentData(BuildContext ctx) async {
    final id = obj.id;
    String name = obj.name;
    String age = obj.age;

    if (_nameController.text.isNotEmpty) {
      name = _nameController.text.trim();
    }
    if (_ageController.text.isNotEmpty) {
      age = _ageController.text.trim();
    }
    final stuobj = studentModel(name: name, age: age, id: id);
    updateStudent(stuobj);
    Navigator.pop(ctx);
  }
}
