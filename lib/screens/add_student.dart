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
      padding:const  EdgeInsets.all(15),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration:const  InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Name",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            controller: _ageController,
            decoration:const  InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Age",
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  clearDataAlert(context);
                },
                child:const  Text('Clear All'),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    AddButtonClicked();
                  },
                  icon:const  Icon(Icons.add),
                  label:const  Text("Add Student"))
            ],
          )
        ],
      ),
    );
  }

  Future<void> AddButtonClicked() async {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    if (name.isEmpty || age.isEmpty || !isNumericUsing_tryParse(age) ) {
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
        title:const  Text("confirm deletion"),
        content:const  Text('Are you sure want to delete all data'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child:const  Text('No')),
          TextButton(
              onPressed: () {
                clearAllData();
                Navigator.pop(context);
              },
              child:const  Text(
                'Sure',
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
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
