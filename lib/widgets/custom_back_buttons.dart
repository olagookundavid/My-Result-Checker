import 'package:flutter/material.dart';
import 'package:result_checker/widgets/custom_button.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.text, required this.ontap});
  final String text;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomButton(text: '<', width: 40, ontap: ontap),
        const SizedBox(
          width: 3,
        ),
        Text(text)
      ],
    );
  }
}
