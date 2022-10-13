import 'package:flutter/material.dart';
import 'package:result_checker/justdey/storage.dart';
import 'package:result_checker/justdey/utils/snackbar.dart';
import 'package:result_checker/widgets/custom_button.dart';

TextEditingController course = TextEditingController();
TextEditingController unit = TextEditingController();
TextEditingController score = TextEditingController();

//dialogue to add new drone data

addNewDialog(context, bool is1st) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      scrollable: true,
      title: const Text('Add New Course'),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller(course, hintText: 'Course'),
              controller(unit, hintText: 'Unit'),
              controller(score, hintText: 'Score'),
            ],
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomButton(
              width: 80,
              ontap: () {
                if (course.text.isEmpty ||
                    unit.text.isEmpty ||
                    score.text.isEmpty) {
                  return;
                } else {
                  is1st
                      ? StorageService()
                          .add1st(course.text, unit.text, score.text)
                      : StorageService()
                          .add2nd(course.text, unit.text, score.text);
                  course.clear();
                  score.clear();
                  unit.clear();
                  Navigator.pop(context);
                  showSnackBar(context, 'Successfully added a Course Score');
                }
              },
              text: 'Add Course',
            ),
            CustomButton(
              width: 80,
              ontap: () {
                course.clear();
                score.clear();
                unit.clear();
                Navigator.pop(context);
              },
              text: 'Back',
            ),
          ],
        ),
      ],
    ),
  );
}

// router dialogue to upload result screen
addSemesterRouteDialog(context, Function() first, Function() second) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
      scrollable: true,
      title: const Text('Choose Semester'),
      content: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 30),
            CustomButton(text: '1st Semester', width: 200, ontap: first),
            const SizedBox(height: 30),
            CustomButton(text: '2nd Semester', width: 200, ontap: second)
          ],
        ),
      ),
    ),
  );
}

//a resuable function that returns a textfield
TextField controller(TextEditingController controller,
    {String? hintText, Widget? suffix}) {
  return TextField(
    controller: controller,
    decoration:
        InputDecoration(suffixIcon: suffix, filled: true, hintText: hintText),
  );
}
