import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:result_checker/firebase_options.dart';
import 'package:result_checker/screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
