import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/model/Appointments.dart';
import 'package:specialist/model/Users.dart';
import 'package:specialist/services/AuthServices.dart';

import 'Widgets/rounded_input_email.dart';

class Requests extends StatefulWidget {
  const Requests({Key? key}) : super(key: key);

  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  List<AppointmentRequest> appointmentRequests = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
        stream: appointmentReference
            .where('status', isEqualTo: 'pending')
            .where('illness', isEqualTo: AuthServices.signedInUser.major)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ));
          }
          appointmentRequests.clear();
          for (var doc in snapshot.data!.docs) {
            appointmentRequests.add(AppointmentRequest(appointmentId: doc.id));
          }
          return Scaffold(
            backgroundColor: Colors.teal[100],
            appBar: AppBar(
              title: const Text("الطلبات"),
              backgroundColor: Colors.teal[900],
              centerTitle: true,
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: appointmentRequests,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AppointmentRequest extends StatefulWidget {
  const AppointmentRequest({Key? key, required this.appointmentId})
      : super(key: key);
  final String appointmentId;

  @override
  State<AppointmentRequest> createState() => _AppointmentRequestState();
}

class _AppointmentRequestState extends State<AppointmentRequest> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: appointmentReference.doc(widget.appointmentId).get(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ));
          }
          Appointment appointment = Appointment.fromDoc(snapshot.data);
          return FutureBuilder(
              future: userReference.doc(appointment.patientId).get(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ));
                }
                UserModel patient = UserModel.fromDoc(snapshot.data);
                return Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedEmailInput(
                                icon: Icons.drive_file_rename_outline_rounded,
                                hint:
                                    patient.firstName + " " + patient.lastName,
                                textInputType: TextInputType.name,
                                color: const Color(0Xffe5e5e5)),
                            const SizedBox(height: 10),
                            RoundedEmailInput(
                                icon: Icons.numbers_rounded,
                                hint: (DateTime.now().year -
                                        (int.parse(
                                            patient.dateOB.substring(0, 4))))
                                    .toString(),
                                textInputType: TextInputType.number,
                                color: Color(0Xffe5e5e5)),
                            const SizedBox(height: 10),
                            RoundedEmailInput(
                                icon: Icons.disabled_by_default,
                                hint: appointment.illness,
                                textInputType: TextInputType.emailAddress,
                                color: Color(0Xffe5e5e5)),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: Colors.teal[900]),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: (MediaQuery.of(context).size.height -
                                          520) *
                                      0.29,
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        appointmentReference
                                            .doc(widget.appointmentId)
                                            .update({
                                          'status': 'approved',
                                          'specialistName': AuthServices
                                                  .signedInUser.firstName +
                                              " " +
                                              AuthServices.signedInUser.lastName
                                        });
                                        appointment.status = 'approved';
                                        appointment
                                            .specialistName = AuthServices
                                                .signedInUser.firstName +
                                            " " +
                                            AuthServices.signedInUser.lastName;
                                      });
                                    },
                                    child: const Text(
                                      'قبول',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                    style: TextButton.styleFrom(),
                                  ),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50.0),
                                      color: const Color(0xff004d40)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: (MediaQuery.of(context).size.height -
                                          520) *
                                      0.29,
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        AuthServices
                                            .signedInUser.appointmentsIds
                                            .remove(widget.appointmentId);
                                      });
                                      appointmentReference
                                          .doc(widget.appointmentId)
                                          .delete();
                                      userReference
                                          .doc(AuthServices.signedInUser.ID)
                                          .update({
                                        'appointmentsIds':
                                            FieldValue.arrayRemove(
                                                [widget.appointmentId])
                                      });

                                      userReference
                                          .doc(patient.ID)
                                          .update({'appointmentId': ""});
                                    },
                                    child: Text('رفض',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                        )),
                                    style: TextButton.styleFrom(),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )));
              });
        });
  }
}
