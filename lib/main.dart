import 'package:flutter/material.dart';
import 'package:student_data/screens/home.dart';
import 'package:student_data/screens/splash_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: SplashScreen(),
    );
  }
}


