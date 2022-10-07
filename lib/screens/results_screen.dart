import 'package:flutter/material.dart';
import 'package:result_checker/constants.dart';
import 'package:result_checker/screens/complain_screen.dart';
import 'package:result_checker/widgets/custom_button.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.text, this.admin = false});
  final String text;
  final bool admin;
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(text,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
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
            DataTable(columns: const [
              DataColumn(label: Text('Course Title')),
              DataColumn(label: Text('Grade'))
            ], rows: const [
              DataRow(cells: [
                DataCell(Text('com 121')),
                DataCell(Text('70 A')),
              ]),
              DataRow(cells: [
                DataCell(Text('com 121')),
                DataCell(Text('70 A')),
              ]),
              DataRow(cells: [
                DataCell(Text('com 121')),
                DataCell(Text('70 A')),
              ]),
              DataRow(cells: [
                DataCell(Text('com 121')),
                DataCell(Text('70 A')),
              ]),
              DataRow(cells: [
                DataCell(Text('com 121')),
                DataCell(Text('70 A')),
              ]),
              DataRow(cells: [
                DataCell(Text('com 121')),
                DataCell(Text('70 A')),
              ]),
              DataRow(cells: [
                DataCell(Text('com 121')),
                DataCell(Text('70 A')),
              ]),
              DataRow(cells: [
                DataCell(Text('com 121')),
                DataCell(Text('70 A')),
              ]),
            ]),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'TGP = 70.5   CGPA = 70',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: admin ? 'Make Remarks ' : 'Make Compliant',
                width: 250,
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ComplainScreen(
                              admin: admin,
                            )),
                  );
                })
          ],
        ),
      ),
    );
  }
}
