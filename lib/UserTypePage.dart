import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:specialist/PatientRegistration.dart';
import 'package:specialist/SpecialistRegistration.dart';
import 'package:specialist/SignInPage.dart';

import 'home_page_patient.dart';

class UserTypePage extends StatelessWidget {
  const UserTypePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff00897b), Color(0xff80cbc4)])),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 60.0, vertical: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.white,
                      child: const Text(
                        "Special",
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 55.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff00796b),
                                  Color(0xff000000),
                                ])),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PatientRegistration()));
                            },
                            child: const Text(
                              "التسجيل  كمريض",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ))),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35.0),
                            gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color(0xff00796b),
                                  Color(0xff000000)
                                ])),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SpecialistRegistration()));
                            },
                            child: const Text(
                              "التسجيل  كمختص",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ))),
                    const SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(color: Colors.black, width: 2),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
