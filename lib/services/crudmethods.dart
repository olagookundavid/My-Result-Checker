import 'package:cloud_firestore/cloud_firestore.dart';

//Class connecting with firebase
class CrudMethods {
  final _firestore = FirebaseFirestore.instance;

  Future<void> add1stRemark(subject, remark) async {
    await _firestore
        .collection('student')
        .doc('1stsemester')
        .collection('remarks')
        .add({
      'subject': subject,
      'remark': remark,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> add2ndRemark(subject, remark) async {
    await _firestore
        .collection('student')
        .doc('2ndsemester')
        .collection('remarks')
        .add({
      'subject': subject,
      'remark': remark,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> add1stComplaint(subject, complain) async {
    await _firestore
        .collection('student')
        .doc('1stsemester')
        .collection('complains')
        .add({
      'subject': subject,
      'complain': complain,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> add2ndComplaint(subject, complain) async {
    await _firestore
        .collection('student')
        .doc('2ndsemester')
        .collection('complains')
        .add({
      'subject': subject,
      'complain': complain,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> add1stSemesterResults(
    sub,
    unit,
    score,
  ) async {
    await _firestore
        .collection('student')
        .doc('1stsemester')
        .collection('results')
        .add({
      'subject': sub,
      'unit': unit,
      'score': score,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Future<void> add2ndSemesterResults(
    sub,
    unit,
    score,
  ) async {
    await _firestore
        .collection('student')
        .doc('2ndsemester')
        .collection('results')
        .add({
      'subject': sub,
      'unit': unit,
      'score': score,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get1stRemarks() {
    return _firestore
        .collection('student')
        .doc('1stsemester')
        .collection('remarks')
        .orderBy(
          'timestamp',
          descending: false,
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get2ndRemarks() {
    return _firestore
        .collection('student')
        .doc('2ndsemester')
        .collection('remarks')
        .orderBy(
          'timestamp',
          descending: false,
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get1stComplains() {
    return _firestore
        .collection('student')
        .doc('1stsemester')
        .collection('complains')
        .orderBy(
          'timestamp',
          descending: false,
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get2ndComplains() {
    return _firestore
        .collection('student')
        .doc('2ndsemester')
        .collection('complains')
        .orderBy(
          'timestamp',
          descending: false,
        )
        .snapshots();
  }

//function for the data stream
  Stream<QuerySnapshot<Map<String, dynamic>>> get1stSemesterResultsStreams() {
    return _firestore
        .collection('student')
        .doc('1stsemester')
        .collection('results')
        .orderBy(
          'timestamp',
          descending: false,
        )
        .snapshots();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get2ndSemesterResultsStreams() {
    return _firestore
        .collection('student')
        .doc('2ndsemester')
        .collection('results')
        .orderBy(
          'timestamp',
          descending: false,
        )
        .snapshots();
  }
}
