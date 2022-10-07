import 'package:flutter/material.dart';

class MyResultsWidget extends StatelessWidget {
  const MyResultsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Image.asset(
      'assets/images/myresult.png',
      width: size.width * .6,
    );
  }
}

class ResultsBar extends StatelessWidget {
  const ResultsBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      width: 110,
      child: Image.asset(
        'assets/images/myresult.png',
        color: Colors.white,
        fit: BoxFit.fill,
      ),
    );
  }
}
