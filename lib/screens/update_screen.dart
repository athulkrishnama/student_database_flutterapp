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
        title: const Text('Update Student Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'New Name'),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'New Age'),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
                onPressed: () {
                  updateStudentData(context);
                },
                icon: const Icon(Icons.update),
                label: const Text('Update'))
          ],
        ),
      ),
    );
  }

  Future<void> updateStudentData(BuildContext ctx) async {
    final id = obj.id;
    String name = obj.name;
    String age = obj.age;
    if (!isNumericUsing_tryParse(_ageController.text.trim())) {
      return;
      
    }
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

  bool isNumericUsing_tryParse(String string) {
    // Null or empty string is not a number
    if (string == null || string.isEmpty) {
      return false;
    }

    final number = num.tryParse(string);

    if (number == null) {
      return false;
    }

    return true;
  }
}
