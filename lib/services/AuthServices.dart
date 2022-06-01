import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/dialogs/Dialogs.dart';
import 'package:specialist/model/Users.dart';

class AuthServices {
  static final _auth = FirebaseAuth.instance;
  static UserModel signedInUser = UserModel();
  static Future<bool> signUp(
      String firstName,
      String lastName,
      String email,
      String password,
      String phoneNO,
      String major,
      String birthDate,
      String gender,
      String userType,
      context) async {
    try {
      UserCredential authresult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? signedIn = authresult.user;
      if (signedIn != null) {
        userReference.doc(signedIn.uid).set({
          'type': userType,
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'password': password,
          'phoneNO': phoneNO,
          'major': major,
          'dateOB': birthDate,
          'gender': gender,
          'profilePicURL': '',
          'appointmentId': '',
          'appointmentsIds': [],
          'reportsIds': [],
        });
        return true;
      }
      return false;
    } catch (e) {
      Navigator.pop(context);
      showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (context) => ErrorDialog(
                title: 'ERROR',
                text: e.toString(),
              ));
      return false;
    }
  }

  static Future<bool> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      signedInUser = UserModel.fromDoc(
          await userReference.doc(await _auth.currentUser!.uid).get());
      return true;
    } catch (e) {
      return false;
    }
  }
}
