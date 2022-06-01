import 'package:flutter/material.dart';
import 'package:specialist/UserTypePage.dart';
import 'package:specialist/dialogs/Dialogs.dart';
import 'package:specialist/home_page_patient.dart';
import 'package:specialist/services/AuthServices.dart';

import 'specialistHomePage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _passwordVisible = false;
  String _email = "", _password = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff00897b), Color(0xff80cbc4)])),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 45.0, left: 45.0, bottom: 40.0, top: 10.0),
                    child: Container(
                      height: 520.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 12.0, left: 12.0, bottom: 40.0, top: 20.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 50.0),
                                child: Text(
                                  "Special",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                height: 50.0,
                              ),
                              TextFormField(
                                onChanged: (val) {
                                  _email = val;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  prefixIcon: const Icon(Icons.email_outlined),
                                  labelText: 'البريد الإلكتروني',
                                  labelStyle: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey[900],
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              const SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                onChanged: (val) {
                                  _password = val;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !_passwordVisible,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                  ),
                                  labelText: 'كلمة السر',
                                  border: const OutlineInputBorder(),
                                  labelStyle: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey[900],
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _togglePasswordView();
                                    },
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey[900],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xff004d40),
                                        Color(0xff00897b),
                                      ],
                                    ),
                                  ),
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: MaterialButton(
                                      onPressed: () async {
                                        showDialog<void>(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) =>
                                                WaitingDialog());
                                        bool isValid =
                                            await AuthServices.signIn(
                                                _email, _password);
                                        if (isValid) {
                                          Navigator.pop(context);
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => AuthServices
                                                          .signedInUser.type ==
                                                      "patient"
                                                  ? const HomePatient()
                                                  : const SpecialistHomePage(),
                                            ),
                                          );
                                        } else {
                                          Navigator.pop(context);
                                          showDialog<void>(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (context) => ErrorDialog(
                                              title: 'Wrong Input',
                                              text:
                                                  'This email or password is wrong.\nPlease try again.',
                                            ),
                                          );
                                        }
                                      },
                                      child: const Text(
                                        "تسجيل الدخول ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                  )),
                              const SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const UserTypePage(),
                                          ));
                                    },
                                    child: Text(
                                      'إنشاء حساب',
                                      style: TextStyle(
                                        color: Colors.teal[900],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  const Text(
                                    'ليس لديك حساب ؟',
                                    style: TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15.0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }
}
