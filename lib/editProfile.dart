import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:specialist/SignInPage.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/dialogs/Dialogs.dart';
import 'package:specialist/home_page_patient.dart';
import 'package:specialist/services/AuthServices.dart';
import 'package:specialist/services/StorageServices.dart';
import 'package:specialist/specialistHomePage.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;
  String _firstName = '',
      _lastName = '',
      _password = '',
      _email = '',
      _phoneNO = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: const Text("تعديل المعلومات الشخصية"),
          centerTitle: true,
          elevation: 0.0,
          bottomOpacity: 0.0,
        ),
        body: Container(
          width: double.infinity,
          color: Colors.teal[50],
          padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () async {
                    final PickedFile? image = await ImagePicker()
                        .getImage(source: ImageSource.gallery);
                    File img = File(image!.path);
                    String url = await StorageService.uploadProfilePicture(
                        AuthServices.signedInUser.profilePicURL, img);
                    setState(
                      () {
                        userReference
                            .doc(AuthServices.signedInUser.ID)
                            .update({'profilePicURL': url});
                        AuthServices.signedInUser.profilePicURL = url;
                      },
                    );
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: const Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AuthServices
                                        .signedInUser.profilePicURL.isNotEmpty
                                    ? NetworkImage(AuthServices.signedInUser
                                        .profilePicURL) as ImageProvider
                                    : const AssetImage(
                                        'assets/images/profile.jpg')),
                          ),
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 4,
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                ),
                                color: Colors.teal[900],
                              ),
                              child: Icon(
                                Icons.edit,
                                color: Colors.teal[50],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                buildTextField("الاسم الأول", "", false, (val) {
                  _firstName = val;
                }),
                buildTextField("اسم العائلة", "", false, (val) {
                  _lastName = val;
                }),
                buildTextField("كلمة السر", "", true, (val) {
                  _password = val;
                }),
                buildTextField("البريد الالكتروني", "", false, (val) {
                  _email = val;
                }),
                buildTextField("رقم الهاتف", "", false, (val) {
                  _phoneNO = val;
                }),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 75, vertical: 50),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_firstName.isNotEmpty) {
                        AuthServices.signedInUser.firstName = _firstName;
                        await userReference
                            .doc(AuthServices.signedInUser.ID)
                            .update({'firstName': _firstName});
                      }
                      if (_lastName.isNotEmpty) {
                        AuthServices.signedInUser.lastName = _lastName;
                        await userReference
                            .doc(AuthServices.signedInUser.ID)
                            .update({'lastName': _lastName});
                      }
                      if (_password.isNotEmpty) {
                        _changePassword(_password);
                      }
                      if (_email.isNotEmpty) {
                        _changeEmail(_email);
                      }
                      if (_phoneNO.isNotEmpty) {
                        AuthServices.signedInUser.phoneNO = _phoneNO;
                        await userReference
                            .doc(AuthServices.signedInUser.ID)
                            .update({'phoneNO': _phoneNO});
                      }
                      if (_email.isEmpty && _password.isEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AuthServices.signedInUser.type == "patient"
                                        ? const HomePatient()
                                        : const SpecialistHomePage()));
                      }
                    },
                    color: Colors.teal[900],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(19)),
                    child: const Text(
                      "حفظ",
                      style: TextStyle(fontSize: 17, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _changeEmail(String newEmail) async {
    final user = FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: AuthServices.signedInUser.email,
        password: AuthServices.signedInUser.password);

    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => WaitingDialog());
    await user!.reauthenticateWithCredential(cred).then(
      (value) {
        user.updateEmail(newEmail).then(
          (_) {
            userReference
                .doc(AuthServices.signedInUser.ID)
                .update({'email': newEmail});
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SafeArea(
                    child: SignInPage(),
                  );
                },
              ),
            );
            return true;
          },
        ).catchError(
          (error) {
            Navigator.pop(context);
            showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (context) => ErrorDialog(
                      title: "ERROR",
                      text: error.toString(),
                    ));
            return false;
          },
        );
      },
    ).catchError(
      (err) {
        Navigator.pop(context);
        showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) => ErrorDialog(
                  title: "ERROR",
                  text: err.toString(),
                ));
        return false;
      },
    );
    return true;
  }

  Future<bool> _changePassword(String newPassword) async {
    final user = FirebaseAuth.instance.currentUser;
    String email = AuthServices.signedInUser.email;
    String password = AuthServices.signedInUser.password;
    final cred = EmailAuthProvider.credential(email: email, password: password);

    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (context) => WaitingDialog());
    await user!.reauthenticateWithCredential(cred).then(
      (value) {
        user.updatePassword(newPassword).then(
          (_) {
            userReference.doc(AuthServices.signedInUser.ID).update(
              {'password': newPassword},
            );
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const SafeArea(
                    child: SignInPage(),
                  );
                },
              ),
            );
            return true; //Success, do something
          },
        ).catchError(
          (error) {
            Navigator.pop(context);
            showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (context) => ErrorDialog(
                      title: "ERROR",
                      text: error.toString(),
                    ));
            return false;
          },
        );
      },
    ).catchError(
      (err) {
        Navigator.pop(context);
        showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (context) => ErrorDialog(
                  title: "ERROR",
                  text: err.toString(),
                ));
        return false;
      },
    );
    return true;
  }

  Widget buildTextField(String labelText, String placeholder,
      bool isPasswordTextField, Function onChanged) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        onChanged: (val) {
          onChanged(val);
        },
        textDirection: TextDirection.rtl,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
