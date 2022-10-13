import 'package:flutter/material.dart';
import 'package:result_checker/constants.dart';
import 'package:result_checker/services/storage.dart';
import 'package:result_checker/widgets/my_results_widget.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key, required this.isAdmin, required this.is1st});
  final bool isAdmin, is1st;
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
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Column(
            children: [
              Text(isAdmin ? 'All Complains' : 'All Remarks',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600)),
              const SizedBox(
                height: 15,
              ),
              StreamBuilder(
                stream: isAdmin
                    ? StorageService().getComplains(is1st)
                    : StorageService().getRemarks(is1st),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: snapshot.data?.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          final result = snapshot.data?.docs[index];
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.blueAccent.withOpacity(0.6),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10, bottom: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    result?['subject'],
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    result?[isAdmin ? 'complain' : 'remark'],
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
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
            ],
          ),
        ),
      ),
    );
  }
}
