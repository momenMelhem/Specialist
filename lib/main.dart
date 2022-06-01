import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:specialist/home_page_patient.dart';
import 'package:specialist/requset_specialist.dart';
import 'package:specialist/UserTypePage.dart';
import 'package:specialist/SignInPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      home: SignInPage(),
    );
  }
}
