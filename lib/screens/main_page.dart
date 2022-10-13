import 'package:flutter/material.dart';
import 'package:result_checker/constants.dart';
import 'package:result_checker/screens/home_screen.dart';
import 'package:result_checker/screens/results_screen.dart';
import 'package:result_checker/widgets/custom_back_buttons.dart';
import 'package:result_checker/widgets/custom_button.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

class MainStudentsScreen extends StatelessWidget {
  const MainStudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: const ResultsBar(),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
              ),
              child: const Icon(
                Icons.menu_rounded,
                color: primaryColor,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              'Welcome',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Student Name',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: primaryColor),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomButton(
                text: 'Your First Semester Result',
                width: 300,
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultsScreen(
                        is1st: true,
                        admin: false,
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 25,
            ),
            CustomButton(
                text: 'Your Second Semester Result',
                width: 300,
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResultsScreen(
                        is1st: false,
                        admin: false,
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 40,
            ),
            CustomBackButton(
                text: 'Logout',
                ontap: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (route) => false,
                  );
                })
          ],
        ),
      ),
    );
  }
}
