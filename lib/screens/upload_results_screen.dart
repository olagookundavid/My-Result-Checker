import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:result_checker/constants.dart';
import 'package:result_checker/justdey/storage.dart';
import 'package:result_checker/justdey/utils/dialog.dart';
import 'package:result_checker/widgets/custom_button.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

class UploadResults extends StatelessWidget {
  UploadResults({super.key, required this.is1st, required this.studentNo});
  final TextEditingController controller = TextEditingController();
  final db = FirebaseFirestore.instance;
  final bool is1st;
  final String studentNo;
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
            Column(
              children: [
                Text(
                  is1st ? '1st Semester Results' : '2nd Semester Results',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(studentNo,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w800)),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .55,
                  child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                    stream: StorageService().getResultsDetailsStreams(is1st),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            final result = snapshot.data?.docs[index];
                            return snapshot.data!.docs.isEmpty
                                ? Center(
                                    child: Text('add a score for this student'
                                        .toUpperCase()),
                                  )
                                : Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 5),
                                    margin: const EdgeInsets.only(bottom: 5),
                                    decoration: BoxDecoration(
                                        // color: Colors.lightBlueAccent[600],
                                        border: Border.all(
                                            color: primaryColor, width: 2)),
                                    child: ClipRRect(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text('Subject: ${result?['subject']}',
                                              style: const TextStyle(
                                                  fontSize: 15)),
                                          Text('Score: ${result?['score']}',
                                              style: const TextStyle(
                                                  fontSize: 15)),
                                        ],
                                      ),
                                    ));
                          },
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.lightBlueAccent,
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text('An Error Occured\n  No Data'),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: 'Upload Result',
                width: 200,
                ontap: () {
                  addNewDialog(context, is1st);
                })
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
