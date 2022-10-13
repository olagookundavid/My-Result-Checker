import 'dart:async';

import 'package:flutter/material.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: const Center(
        child: MyResultsWidget(),
      ),
    );
  }
}
