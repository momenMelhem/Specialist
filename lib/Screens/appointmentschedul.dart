import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:specialist/Screens/appointment_details.dart';
import 'package:specialist/Widgets/appointment_list_tile.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/model/Appointments.dart';
import 'package:specialist/model/Users.dart';
import 'package:specialist/services/AuthServices.dart';

class AppointmentSchedule extends StatefulWidget {
  const AppointmentSchedule({Key? key}) : super(key: key);

  @override
  State<AppointmentSchedule> createState() => _State();
}

class _State extends State<AppointmentSchedule> {
  final List<Widget> _appointmentsList = [];

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
              actions: [
                IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: CustomSearch());
                    },
                    icon: const Icon(
                      Icons.search,
                      size: 28,
                    ))
              ],
              centerTitle: true,
              backgroundColor: const Color(0xff00897b),
              bottomOpacity: 0.0,
              elevation: 0.0,
              title: const Text(
                "سجل المرضى",
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

Map<Appointment, UserModel> appointmentPatientMap = {};

class CustomSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Map machQuery = {};
    List<Widget> patients = [];
    appointmentPatientMap.forEach((key, value) {
      if ((value.firstName + " " + value.lastName)
          .toLowerCase()
          .contains(query.toLowerCase())) {
        machQuery[key] = value;
      }
    });
    machQuery.forEach((key, value) {
      patients.add(GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppointmentDetails(
                appointment: key,
                patient: value,
              ),
            ),
          );
        },
        child: Card(
          child: ListTile(
            title: Text(value.firstName + " " + value.lastName),
            leading: CircleAvatar(
                backgroundImage: value.profilePicURL.isNotEmpty
                    ? NetworkImage(value.profilePicURL) as ImageProvider
                    : const AssetImage('assets/images/profile.jpg')),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmentDetails(
                    appointment: key,
                    patient: value,
                  ),
                ),
              );
            },
          ),
        ),
      ));
    });
    return Column(
      children: patients,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    Map machQuery = {};
    List<Widget> patients = [];
    appointmentPatientMap.forEach((key, value) {
      if ((value.firstName + " " + value.lastName)
          .toLowerCase()
          .contains(query.toLowerCase())) {
        machQuery[key] = value;
      }
    });
    machQuery.forEach((key, value) {
      patients.add(GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppointmentDetails(
                appointment: key,
                patient: value,
              ),
            ),
          );
        },
        child: Card(
          child: ListTile(
            title: Text(value.firstName + " " + value.lastName),
            leading: CircleAvatar(
                backgroundImage: value.profilePicURL.isNotEmpty
                    ? NetworkImage(value.profilePicURL) as ImageProvider
                    : const AssetImage('assets/images/profile.jpg')),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AppointmentDetails(
                    appointment: key,
                    patient: value,
                  ),
                ),
              );
            },
          ),
        ),
      ));
    });
    return Column(
      children: patients,
    );
  }
}
