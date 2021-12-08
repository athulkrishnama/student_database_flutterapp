import 'package:flutter/material.dart';
import 'package:student_data/screens/add_student.dart';
import 'package:student_data/screens/list_student.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AddStudent(),
            Expanded(child: ListStudent())
          ],
        ),
      ),
    );
  }
}