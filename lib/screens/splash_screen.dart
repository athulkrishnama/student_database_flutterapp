import 'package:flutter/material.dart';
import 'package:student_data/screens/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    routescreen(context);
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Image(image: AssetImage('assets/images/splash.png')),
        ),
      ),
    );
  }

  Future<void> routescreen(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) =>const  HomeScreen()));
  }
}
