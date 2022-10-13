import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:result_checker/justdey/crudmethods.dart';

//Repository to create an abstract layer
class StorageService {
  CrudMethods crudMethods = CrudMethods();
  Future<void> add1st(
    sub,
    unit,
    score,
  ) async {
    await crudMethods.add1stSemesterResults(
      sub,
      unit,
      score,
    );
  }

  Future<void> add2nd(
    sub,
    unit,
    score,
  ) async {
    await crudMethods.add2ndSemesterResults(
      sub,
      unit,
      score,
    );
  }

  Future<void> add1stComplain(String subject, String complain) async {
    await crudMethods.add1stComplaint(subject, complain);
  }

  Future<void> add2ndComplain(String subject, String complain) async {
    await crudMethods.add2ndComplaint(subject, complain);
  }

  Future<void> add1stRemark(String subject, String remark) async {
    await crudMethods.add1stRemark(subject, remark);
  }

  Future<void> add2ndRemark(String subject, String remark) async {
    await crudMethods.add2ndRemark(subject, remark);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getRemarks(bool is1st) {
    return is1st ? crudMethods.get1stRemarks() : crudMethods.get2ndRemarks();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getComplains(bool is1st) {
    return is1st
        ? crudMethods.get1stComplains()
        : crudMethods.get2ndComplains();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getResultsDetailsStreams(
      bool is1st) {
    return is1st
        ? crudMethods.get1stSemesterResultsStreams()
        : crudMethods.get2ndSemesterResultsStreams();
  }
}
