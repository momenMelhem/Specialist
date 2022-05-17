import 'package:flutter/material.dart';

class ShowReports extends StatefulWidget {
  const ShowReports({Key? key}) : super(key: key);

  @override
  State<ShowReports> createState() => _ShowReportsState();
}

class _ShowReportsState extends State<ShowReports> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          title: Text(
            'التقارير',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [const Color(0xff00897b), const Color(0xff80cbc4)])),
        ),
      ),
    );
  }
}
