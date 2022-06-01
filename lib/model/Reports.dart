import 'package:cloud_firestore/cloud_firestore.dart';

class Report {
  String specialistName;
  String patientId;
  String content;
  String major;

  Report(this.specialistName, this.patientId, this.content, this.major);
  factory Report.fromDoc(DocumentSnapshot doc) {
    return Report(
        doc['specialistName'], doc['patientId'], doc['content'], doc['major']);
  }
}
