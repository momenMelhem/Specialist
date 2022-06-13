import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:specialist/services/AddAppointmentServices.dart';
import '../services/AuthServices.dart';
import '../home_page_patient.dart';

class HearingDisability extends StatelessWidget {
  const HearingDisability({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[900],
          centerTitle: true,
          title: const Text(
            'إعاقة سمعية',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21.0,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xff00897b), Color(0xff80cbc4)])),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60.0, vertical: 50.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: const Text(
                              'نوفر فريقا من المتخصصین المؤهلين لتعليم لغة الإشارة لمن يعانون من الإعاقة السمعية لكي بستطيعوا أن يتعاملوا مع المجتمع المحيط بهم',
                              textAlign: TextAlign.center,
                              textDirection: TextDirection.rtl,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff00796b),
                                      Color(0xff000000),
                                    ])),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(35.0),
                                gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff00796b),
                                      Color(0xff000000)
                                    ])),
                          ),
                          const SizedBox(
                            height: 20.0,
                          )
                        ],
                      ),
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      border: Border.all(color: Colors.black, width: 2),
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100.0,
                    vertical: 20,
                  ),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.teal[900],
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: MaterialButton(
                      child: const Text(
                        'طلب خدمة',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      onPressed: () async {
                        bool successfullySent =
                            await AddAppointmentServices.addAppointment(
                                AuthServices.signedInUser.ID, 'إعاقة سمعية');
                        if (successfullySent) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'تم إرسال طلبك',
                              ),
                              content: const Text(
                                  'الرجاء الإنتظار لحين موافقه مختص'),
                              actions: [
                                TextButton(
                                  child: const Text(
                                    'موافق',
                                    style: const TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.blueAccent),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePatient(),
                                        ));
                                  },
                                )
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
