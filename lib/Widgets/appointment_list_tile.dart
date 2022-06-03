import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/model/Appointments.dart';
import 'package:specialist/model/Users.dart';

import '../Screens/appointment_details.dart';

class AppointmentListTile extends StatelessWidget {
  const AppointmentListTile({Key? key, required this.appointmentId})
      : super(key: key);
  final String appointmentId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: appointmentReference.doc(appointmentId).get(),
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
              return appointment.status == 'approved'
                  ? Card(
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(patient.firstName + " " + patient.lastName),
                            Text(patient.phoneNO),
                          ],
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(appointment.date),
                        ),
                        leading: CircleAvatar(
                            backgroundImage: patient.profilePicURL.isNotEmpty
                                ? NetworkImage(patient.profilePicURL)
                                    as ImageProvider
                                : AssetImage('assets/images/profile.jpg')),
                        trailing: const Icon(Icons.arrow_forward),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppointmentDetails(
                                appointment: appointment,
                                patient: patient,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : Container();
            });
      },
    );
  }
}
