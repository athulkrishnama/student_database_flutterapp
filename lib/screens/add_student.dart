import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:student_data/db/db_functions/db_functions.dart';
import 'package:student_data/db/db_model/student_model.dart';

class AddStudent extends StatelessWidget {
  AddStudent({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Name",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Age",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  clearDataAlert(context);
                },
                child: Text('Clear All'),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    AddButtonClicked();
                  },
                  icon: Icon(Icons.add),
                  label: Text("Add Student"))
            ],
          )
        ],
      ),
    );
  }

  Future<void> AddButtonClicked() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    if (name.isEmpty || age.isEmpty) {
      return;
    }
    final stuModelObj = studentModel(name: name, age: age);
    addStudent(stuModelObj);
    _nameController.text = '';
    _ageController.text = '';
  }

  clearDataAlert(BuildContext ctx) {
    return showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        title: Text("confirm deletion"),
        content: Text('Are you sure want to delete all data'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('No')),
          TextButton(
              onPressed: () {
                clearAllData();
                Navigator.pop(context);
              },
              child: Text(
                'Sure',
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }
}
