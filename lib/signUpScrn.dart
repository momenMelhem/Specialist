import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';

class Suc extends StatelessWidget {
  const Suc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff00897b), const Color(0xff80cbc4)])),
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
                Padding(
                  padding: const EdgeInsets.only(
                      right: 30.0, left: 30.0, bottom: 50.0, top: 10.0),
                  child: Container(
                    height: 600.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 2)),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.0,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: " البريدالكتروني/ رقم الهاتف",
                                hintStyle: TextStyle(
                                    color: Colors.grey[900],
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 50.0,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              hintText: " كلمة السر",
                              hintStyle: TextStyle(
                                  color: Colors.grey[900],
                                  fontWeight: FontWeight.bold),
                              prefixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.grey[900],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 150.0,
                          ),
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        const Color(0xff004d40),
                                        const Color(0xff00897b)
                                      ])),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            MyStatefulWidget(),
                                      ));
                                },
                                child: Text(
                                  "تسجيل الدخول ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                          SizedBox(
                            height: 50.0,
                          ),
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        const Color(0xff004d40),
                                        const Color(0xff00897b)
                                      ])),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "انشاء حساب ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                        ],
                      ),
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
}
