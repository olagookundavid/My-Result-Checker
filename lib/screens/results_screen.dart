import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:result_checker/constants.dart';
import 'package:result_checker/justdey/storage.dart';
import 'package:result_checker/screens/complain_screen.dart';
import 'package:result_checker/screens/view_display_screen.dart';
import 'package:result_checker/widgets/custom_button.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.is1st,
      this.admin = false,
      this.studentNo = ''});
  final bool is1st;
  final bool admin;
  final String studentNo;
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
            Text(is1st ? '1st Semester Results' : '2nd Semester Results',
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            const SizedBox(
              height: 10,
            ),
            Text(studentNo,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
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
                        return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 5),
                            margin: const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: primaryColor, width: 2)),
                            child: ClipRRect(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Course: ${result?['subject']}',
                                      style: const TextStyle(fontSize: 15)),
                                  Text('Score: ${result?['score']}',
                                      style: const TextStyle(fontSize: 15)),
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
            const SizedBox(
              height: 10,
            ),
            // const Text(
            //   'TGP = 70.5   CGPA = 70',
            //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            CustomButton(
                text: admin ? 'View Complains ' : 'View Remarks ',
                width: 250,
                ontap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DisplayScreen(
                              is1st: is1st,
                              isAdmin: admin,
                            )),
                  );
                }),
            const SizedBox(
              height: 15,
            ),
            CustomButton(
              text: admin ? 'Make Remarks ' : 'Make Complain',
              width: 250,
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ComplainScreen(
                            is1st: is1st,
                            admin: admin,
                          )),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
