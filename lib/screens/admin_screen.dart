import 'package:flutter/material.dart';
import 'package:result_checker/constants.dart';
import 'package:result_checker/screens/results_screen.dart';
import 'package:result_checker/screens/upload_results_screen.dart';
import 'package:result_checker/utils/dialog.dart';
import 'package:result_checker/utils/error_dialog.dart';
import 'package:result_checker/widgets/custom_button.dart';
import 'package:result_checker/widgets/custom_textfields.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({super.key});
  final TextEditingController controller = TextEditingController();
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
          padding: const EdgeInsets.symmetric(vertical: 80),
          child: Column(
            children: [
              const Text(
                'Welcome Admin',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 65),
                child: Divider(
                  thickness: .5,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Choose Student To Upload Results',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextField(
                hinttext: 'Input Matric Number ',
                controller: controller,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                      text: 'Upload Result',
                      width: 120,
                      ontap: () {
                        (controller.text.toLowerCase() ==
                                'COM/HND/20/00697'.toLowerCase())
                            ? addSemesterRouteDialog(
                                context,
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UploadResults(
                                              studentNo: controller.text,
                                              is1st: true,
                                            )),
                                  );
                                },
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UploadResults(
                                              studentNo: controller.text,
                                              is1st: false,
                                            )),
                                  );
                                },
                              )
                            : showErrorDialog(
                                context: context,
                                title: 'Error',
                                content:
                                    'Matric Number doesn\'t match that of a student.',
                                defaultActionText: 'Cancel');
                      }),
                  const SizedBox(
                    width: 10,
                  ),
                  CustomButton(
                      text: 'Check Result',
                      width: 120,
                      ontap: () {
                        (controller.text.toLowerCase() ==
                                'COM/HND/20/00697'.toLowerCase())
                            ? addSemesterRouteDialog(
                                context,
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultsScreen(
                                              studentNo: controller.text,
                                              is1st: true,
                                              admin: true,
                                            )),
                                  );
                                },
                                () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ResultsScreen(
                                              studentNo: controller.text,
                                              is1st: false,
                                              admin: true,
                                            )),
                                  );
                                },
                              )
                            : showErrorDialog(
                                context: context,
                                title: 'Error',
                                content: 'Check the UserName or Password.',
                                defaultActionText: 'ok');
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
