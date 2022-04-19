import 'package:flutter/material.dart';

class PatientRecords extends StatefulWidget {
  const PatientRecords({Key? key}) : super(key: key);

  @override
  _PatientRecordsState createState() => _PatientRecordsState();
}

class _PatientRecordsState extends State<PatientRecords> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
        ),
        body: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
            patient('name', 'disease'),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget patient(String name, String disease) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 250,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 1),
                left: BorderSide(color: Colors.black, width: 1),
                right: BorderSide(color: Colors.black, width: 1),
                top: BorderSide(color: Colors.black, width: 1),
              )),
          child: Center(
            child: Text(
              name + ' - ' + disease,
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          width: 13,
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.indigo,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
        )
      ],
    );
  }
}
