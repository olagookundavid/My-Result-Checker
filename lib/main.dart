import 'package:flutter/material.dart';
import 'package:result_checker/screens/splash_screen.dart';
import 'package:result_checker/screens/upload_results_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Result Checker',
      home: SplashScreen(),
    );
  }
}
