import 'package:flutter/material.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'special',
          style: TextStyle(
              fontSize: 10.0,
              color: Colors.white
          ),
        ),
      ),
      body: Container(
        child: Text('DashBoarrd'),
      ),
    );
  }
}

