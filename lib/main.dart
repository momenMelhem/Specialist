import 'package:flutter/material.dart';
import 'package:specialist/home_page_patient.dart';
import 'package:specialist/requset_specialist.dart';
import 'package:specialist/scrn1.dart';
import 'package:specialist/signUpScrn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePatient(),
    );
  }
}
