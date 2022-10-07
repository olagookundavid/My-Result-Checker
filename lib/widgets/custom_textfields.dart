import 'package:flutter/material.dart';
import 'package:result_checker/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hinttext,
    required this.controller,
    this.maxlines = 1,
  });
  final TextEditingController controller;
  final String hinttext;
  final int maxlines;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(color: primaryColor, width: 1.0)),
      child: TextField(
        maxLines: maxlines,
        controller: controller,
        decoration: InputDecoration(
          filled: false,
          border: InputBorder.none,
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.normal,
            fontFamily: 'Product_Sans',
          ),
        ),
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontFamily: 'Product_Sans',
        ),
      ),
    );
  }
}
