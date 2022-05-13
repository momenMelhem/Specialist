import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:specialist/signUpScrn.dart';

class Scrn1 extends StatelessWidget {
  const Scrn1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff00897b), Color(0xff80cbc4)])),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 150.0),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            child: const Text(
                              "Special",
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 60.0,
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
                                  onPressed: () {},
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
                                            builder: (context) => const Suc()));
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
                    width: double.infinity,
                    height: 600.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
