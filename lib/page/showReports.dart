import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/model/Reports.dart';
import 'package:specialist/services/AuthServices.dart';

class ShowReports extends StatefulWidget {
  const ShowReports({Key? key}) : super(key: key);

  @override
  State<ShowReports> createState() => _ShowReportsState();
}

List<Widget> _reports = [];

class _ShowReportsState extends State<ShowReports> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: userReference.doc(AuthServices.signedInUser.ID).get(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            ));
          }
          List reportsIds = snapshot.data['reportsIds'];
          _reports.clear();
          for (String reportId in reportsIds) {
            _reports.add(ReportWidget(reportId: reportId));
          }
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal[600],
              centerTitle: true,
              bottomOpacity: 0.0,
              elevation: 0.0,
              title: const Text(
                'التقارير',
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.white,
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
                      colors: [Color(0xff00897b), Color(0xff80cbc4)])),
              child: SingleChildScrollView(
                child: Column(
                  children: _reports,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ReportWidget extends StatelessWidget {
  const ReportWidget({
    required this.reportId,
    Key? key,
  }) : super(key: key);
  final String reportId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: reportReference.doc(reportId).get(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(Colors.white),
          ));
        }
        Report report = Report.fromDoc(snapshot.data);
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            color: const Color(0xffe5e5e5),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            _reports.remove(ReportWidget(reportId: reportId));
                            userReference.doc(report.patientId).update({
                              'reportsIds': FieldValue.arrayRemove([reportId])
                            });
                            reportReference.doc(reportId).delete();
                            AuthServices.signedInUser.reportsIds
                                .remove(reportId);
                          },
                          icon: Icon(Icons.clear)),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(report.specialistName,
                            style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(report.major, style: TextStyle(fontSize: 15)),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                    child: Text(
                      report.content,
                      style: TextStyle(fontSize: 17),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
