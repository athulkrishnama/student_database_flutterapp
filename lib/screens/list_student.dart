import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:student_data/db/db_functions/db_functions.dart';
import 'package:student_data/db/db_model/student_model.dart';
import 'package:student_data/screens/update_screen.dart';

class ListStudent extends StatelessWidget {
  ListStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentModelList,
        builder: (BuildContext ctx, List<studentModel> stuList, Widget? child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final stuData = stuList[index];
              return Padding(
                padding: EdgeInsets.only(left: 5.0, bottom: 2),
                child: ListTile(
                  onLongPress: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => UpdateScreen(obj: stuData),
                    ));
                  },
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(snackbaralert);
                  },
                  title: Text(stuData.name),
                  subtitle: Text(stuData.age),
                  trailing: IconButton(
                    onPressed: () {
                      if (stuData.id != null) {
                        deleteStudent(id: stuData.id!);
                      }
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: stuList.length,
          );
        });
  }

  final snackbaralert = SnackBar(
    content: Text('Longpress to updata data'),
    duration: Duration(milliseconds: 1000),
    margin: EdgeInsets.all(15),
    behavior: SnackBarBehavior.floating,
  );
}
