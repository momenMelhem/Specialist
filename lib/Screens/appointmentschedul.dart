import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:specialist/Widgets/appointment_list_tile.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/model/Appointments.dart';
import 'package:specialist/services/AuthServices.dart';

class AppointmentSchedule extends StatefulWidget {
  const AppointmentSchedule({Key? key}) : super(key: key);

  @override
  State<AppointmentSchedule> createState() => _State();
}

class _State extends State<AppointmentSchedule> {
  List<Widget> _appointmentsList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: appointmentReference
            .where('status', isEqualTo: 'approved')
            .where('illness', isEqualTo: AuthServices.signedInUser.major)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ));
          }
          _appointmentsList.clear();
          for (var doc in snapshot.data!.docs) {
            _appointmentsList.add(AppointmentListTile(appointmentId: doc.id));
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: const Color(0xff00897b),
              bottomOpacity: 0.0,
              elevation: 0.0,
              title: const Text(
                "المواعيد",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xff00897b), Color(0xff80cbc4)]),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: _appointmentsList,
                  ),
                )),
          );
        },
      ),
    );
  }
}
