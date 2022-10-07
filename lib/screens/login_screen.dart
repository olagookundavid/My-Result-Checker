import 'package:flutter/material.dart';
import 'package:result_checker/screens/admin_screen.dart';
import 'package:result_checker/screens/main_page.dart';
import 'package:result_checker/widgets/custom_back_buttons.dart';
import 'package:result_checker/widgets/custom_button.dart';
import 'package:result_checker/widgets/custom_textfields.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

class CustomLogin extends StatelessWidget {
  CustomLogin({super.key, required this.role});
  final String role;
  final TextEditingController controller = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const MyResultsWidget(),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Welcome $role',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(hinttext: 'Matric Number', controller: controller),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(hinttext: 'Password', controller: controller2),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              text: 'Login',
              width: 150,
              ontap: () {
                controller.clear();
                controller2.clear();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => role.toLowerCase() == 'student'
                        ? const MainScreen()
                        : AdminScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 50,
            ),
            CustomBackButton(
                text: 'Home',
                ontap: () {
                  Navigator.pop(context);
                })
          ],
        ),
      )),
    );
  }
}
