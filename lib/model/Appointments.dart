import 'package:cloud_firestore/cloud_firestore.dart';

class Appointment {
  String specialistName;
  String patientId;
  String illness;
  String status;
  String time;
  String date;

  Appointment(this.specialistName, this.patientId, this.illness, this.status,
      this.time, this.date);
  factory Appointment.fromDoc(DocumentSnapshot doc) {
    return Appointment(
      doc['specialistName'],
      doc['patientId'],
      doc['illness'],
      doc['status'],
      doc['time'],
      doc['date'],
    );
  }
}
