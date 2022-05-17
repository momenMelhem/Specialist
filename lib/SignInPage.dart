import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:specialist/appointments.dart';
import 'package:specialist/SpecialistRegistration.dart';
import 'package:specialist/UserTypePage.dart';
import 'package:specialist/dialogs/Dialogs.dart';
import 'package:specialist/services/AuthServices.dart';

import 'PatientHomePage.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _passwordVisible = true;
  String _email = "", _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.teal[900],
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff00897b), const Color(0xff80cbc4)])),
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
                              Padding(
                                padding: const EdgeInsets.only(top: 50.0),
                                child: Text(
                                  "Special",
                                  style: TextStyle(
                                      fontFamily: 'SourceSansPro',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0,
                                      color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 50.0,
                              ),
                              TextFormField(
                                onChanged: (val) {
                                  _email = val;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  prefixIcon: Icon(Icons.email_outlined),
                                  labelText: 'البريد الإلكتروني',
                                  labelStyle: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey[900],
                                    //fontWeight: FontWeight.bold,
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                onChanged: (val) {
                                  _password = val;
                                },
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                  ),
                                  labelText: 'كلمة السر',
                                  border: OutlineInputBorder(),
                                  labelStyle: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey[900],
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.grey[900],
                                    ),
                                    onPressed: () {
                                      _togglePasswordView();
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        const Color(0xff004d40),
                                        const Color(0xff00897b),
                                      ],
                                    ),
                                  ),
                                  child: Container(
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
                                              builder: (context) =>
                                                  //todo navigate to the right page
                                                  PatientHomePage(),
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
                                      child: Text(
                                        "تسجيل الدخول ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            // fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                height: 20.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                UserTypePage(),
                                          ));
                                    },
                                    child: Text(
                                      'إنشاء حساب',
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
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
