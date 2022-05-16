import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
        child: Text('Profile'),
      ),
    );
  }
}
