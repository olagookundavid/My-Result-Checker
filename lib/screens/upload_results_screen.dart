import 'package:flutter/material.dart';
import 'package:result_checker/constants.dart';
import 'package:result_checker/widgets/custom_button.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

class UploadResults extends StatelessWidget {
  UploadResults({super.key});
  final TextEditingController controller = TextEditingController();
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
            const Text('Upload Result',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
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
                DataCell(Text('Com 101')),
                DataCell(Text('Score '), placeholder: true, showEditIcon: true),
              ]),
              DataRow(cells: [
                DataCell(Text('Com 111')),
                DataCell(Text('Score '), placeholder: true, showEditIcon: true),
              ]),
              DataRow(cells: [
                DataCell(Text('Sta 121')),
                DataCell(Text('Score '), placeholder: true, showEditIcon: true),
              ]),
              DataRow(cells: [
                DataCell(Text('Eed 121')),
                DataCell(Text('Score '), placeholder: true, showEditIcon: true),
              ]),
              DataRow(cells: [
                DataCell(Text('Eed 211')),
                DataCell(Text('Score '), placeholder: true, showEditIcon: true),
              ]),
              DataRow(cells: [
                DataCell(Text('Com 211')),
                DataCell(Text('Score '), placeholder: true, showEditIcon: true),
              ]),
              DataRow(cells: [
                DataCell(Text('Com 442')),
                DataCell(Text('Score '), placeholder: true, showEditIcon: true),
              ]),
              DataRow(cells: [
                DataCell(Text('Com 212')),
                DataCell(Text('Score '), placeholder: true, showEditIcon: true),
              ]),
            ]),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(text: 'Upload Results', width: 200, ontap: () {})
          ],
        ),
      ),
    );
  }
}

//  ResultRowTile(
//               text: 'text',
//               widget: CustomTextField(
//                   hinttext: 'enter score', controller: controller)),
class ResultRowTile extends StatelessWidget {
  const ResultRowTile({super.key, required this.text, required this.widget});
  final String text;
  final Widget widget;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(text),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: widget,
          ),
        ),
      ],
    );
  }
}
