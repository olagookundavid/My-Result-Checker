import 'package:flutter/material.dart';
import 'package:result_checker/constants.dart';
import 'package:result_checker/screens/home_screen.dart';
import 'package:result_checker/widgets/custom_back_buttons.dart';
import 'package:result_checker/widgets/custom_button.dart';
import 'package:result_checker/widgets/custom_textfields.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

class ComplainScreen extends StatelessWidget {
  ComplainScreen({super.key, this.admin = false});

  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  final TextEditingController controller3 = TextEditingController();
  final bool admin;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          child: Column(
            children: [
              Text(admin ? 'Make A Remark' : 'Make A Complain',
                  style: const TextStyle(
                      fontSize: 23, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hinttext: 'Subject',
                controller: controller,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hinttext: 'Email Address',
                controller: controller2,
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hinttext: 'Message',
                controller: controller3,
                maxlines: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                  text: 'Send Message',
                  width: 200,
                  ontap: () {
                    controller.clear();
                    controller2.clear();
                    controller3.clear();
                  }),
              const SizedBox(
                height: 25,
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
      ),
    );
  }
}
