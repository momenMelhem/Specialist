import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:specialist/dialogs/Dialogs.dart';

class AuthServices {
  static final _auth = FirebaseAuth.instance;
//todo sign up for spec
  static Future<bool> signUp(
      String firstName,
      String secondName,
      String email,
      String password,
      String phoneNO,
      String birthDate,
      String gender,
      String userType,
      context) async {
    try {
      UserCredential authresult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? signedIn = authresult.user;
      if (signedIn != null) {
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
      return true;
    } catch (e) {
      return false;
    }
  }
}
