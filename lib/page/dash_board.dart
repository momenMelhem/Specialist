import 'package:flutter/material.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/model/Appointments.dart';
import 'package:specialist/services/AuthServices.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Appointment appointment = Appointment('', '', '', '', '', '');

  @override
  void initState() {
    super.initState();
    createAppointment();
  }

  void createAppointment() async {
    appointment = Appointment.fromDoc(await appointmentReference
        .doc(AuthServices.signedInUser.appointmentId)
        .get());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[600],
          centerTitle: true,
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: const Text(
            'Special',
            style: TextStyle(
              fontSize: 21.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color(0xff00897b),
                Color(0xff80cbc4),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          appointment.status.isNotEmpty
                              ? appointment.status
                              : "لا يوجد طلب",
                        ),
                        content: Text(appointment.status == 'pending'
                            ? 'الرجاء الإنتظار لحين موافقه مختص'
                            : appointment.status == 'approved'
                                ? 'تم قبول طلبك من قبل : ${appointment.specialistName}'
                                : ''),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'موافق');
                            },
                            child: const Text(
                              'موافق',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.blueAccent),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: const Center(
                      child: Text(
                    'الطلبات',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white),
                  )),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.teal.shade900),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ))),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                height: 100,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text(
                          'المواعيد',
                        ),
                        content: Text(appointment.status == 'approved' &&
                                appointment.date.isNotEmpty
                            ? 'تم تحديد موعدك في : ${appointment.date} - ${appointment.time}'
                            : 'لم يتم تحديد موعد '),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context, 'موافق');
                            },
                            child: const Text(
                              'موافق',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.blueAccent),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  child: const Center(
                      child: Text(
                    'المواعيد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  )),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.teal.shade900),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
