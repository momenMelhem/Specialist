import 'package:flutter/material.dart';
import 'package:specialist/profilespecialist.dart';
import 'package:specialist/scrn1.dart';

import 'main_page.dart';

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
      home: Scrn1(),
    );
  }
}
