import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String ID;
  String type;
  String firstName;
  String lastName;
  String email;
  String password;
  String phoneNO;
  String major;
  String dateOB;
  String gender;
  String profilePicURL;
  String appointmentId;
  List appointmentsIds;
  List reportsIds;

  UserModel({
    this.ID = '',
    this.type = '',
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.password = '',
    this.phoneNO = '',
    this.major = '',
    this.dateOB = '',
    this.gender = '',
    this.profilePicURL = '',
    this.appointmentId = '',
    this.appointmentsIds = const [],
    this.reportsIds = const [],
  });

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    return UserModel(
        ID: doc.id,
        type: doc['type'],
        firstName: doc['firstName'],
        lastName: doc['lastName'],
        email: doc['email'],
        password: doc['password'],
        phoneNO: doc['phoneNO'],
        major: doc['major'],
        dateOB: doc['dateOB'],
        gender: doc['gender'],
        profilePicURL: doc['profilePicURL'],
        appointmentId: doc['appointmentId'],
        appointmentsIds: doc['appointmentsIds'],
        reportsIds: doc['reportsIds']);
  }
}
