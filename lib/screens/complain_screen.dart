import 'package:flutter/material.dart';
import 'package:result_checker/constants.dart';
import 'package:result_checker/screens/home_screen.dart';
import 'package:result_checker/services/storage.dart';
import 'package:result_checker/widgets/custom_back_buttons.dart';
import 'package:result_checker/widgets/custom_button.dart';
import 'package:result_checker/widgets/custom_textfields.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

class ComplainScreen extends StatelessWidget {
  ComplainScreen({super.key, this.admin = false, required this.is1st});

  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  final TextEditingController controller3 = TextEditingController();
  final bool admin, is1st;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        title: const ResultsBar(),
        centerTitle: false,
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
                    is1st
                        ? (admin
                            ? StorageService()
                                .add1stRemark(controller.text, controller3.text)
                            : StorageService().add1stComplain(
                                controller.text, controller3.text))
                        : (admin
                            ? StorageService()
                                .add2ndRemark(controller.text, controller3.text)
                            : StorageService().add2ndComplain(
                                controller.text, controller3.text));
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
