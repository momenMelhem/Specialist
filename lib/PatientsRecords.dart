import 'package:flutter/material.dart';
import 'package:specialist/Reprot.dart';

class PatientsRecords extends StatefulWidget {
  const PatientsRecords({Key? key}) : super(key: key);
  @override
  _PatientsRecordsState createState() => _PatientsRecordsState();
}

class _PatientsRecordsState extends State<PatientsRecords> {
  List<PatientRecord> patients = [];

  void fillPatients() {
    patients.clear();
    for (int i = 0; i <= 10; i++) {
      patients.add(PatientRecord(
        name: "name$i",
        disease: "disease$i",
      ));
    }
  }

  Widget build(BuildContext context) {
    fillPatients();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal[100],
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
        ),
        body: ListView(
          children: patients,
        ),
      ),
    );
  }
}

class PatientRecord extends StatelessWidget {
  PatientRecord({this.name = "", this.disease = ""});

  String name;
  String disease;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Report(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
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
        ),
      ),
    );
  }
}
