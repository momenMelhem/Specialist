import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:specialist/Widgets/big_text.dart';
import 'package:specialist/constants/Constants.dart';
import 'package:specialist/model/Appointments.dart';
import 'package:specialist/model/Users.dart';
import 'package:specialist/services/AuthServices.dart';
import '../Widgets/rounded_button_design.dart';

class AppointmentDetails extends StatefulWidget {
  const AppointmentDetails(
      {Key? key, required this.appointment, required this.patient})
      : super(key: key);
  final Appointment appointment;
  final UserModel patient;
  @override
  State<AppointmentDetails> createState() => _AppointmentDetailsState();
}

class _AppointmentDetailsState extends State<AppointmentDetails> {
  int i = 0;
  List<bool> isSelected = [false, true];
  bool show = true;
  final format = DateFormat("yyyy-MM-dd HH:mm");
  String reportContent = '';

  Widget addAppointment() {
    String _date = '', _time = '';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 40),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: DateTimeField(
            format: format,
            onShowPicker: (context, currentValue) async {
              final date = await showDatePicker(
                  context: context,
                  fieldHintText: "تاريخ الموعد",
                  fieldLabelText: 'تاريخ',
                  firstDate: DateTime(1900),
                  initialDate: currentValue ?? DateTime.now(),
                  lastDate: DateTime(2100));
              if (date != null) {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                );
                _date =
                    DateTimeField.combine(date, time).toString().split(' ')[0];
                _time = DateTimeField.combine(date, time)
                    .toString()
                    .split(' ')[1]
                    .substring(0, 5);
                return DateTimeField.combine(date, time);
              } else {
                return currentValue;
              }
            },
          ),
        ),
        const SizedBox(height: 10),
        RoundedButton(
          title: "اضافة موعد",
          onPressed: () {
            appointmentReference
                .doc(widget.appointment.patientId +
                    '-' +
                    widget.appointment.illness)
                .update({
              "date": _date,
              "time": _time,
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.teal[600],
            bottomOpacity: 0.0,
            elevation: 0.0,
            title:
                Text(widget.patient.firstName + " " + widget.patient.lastName),
          ),
          body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff00897b), Color(0xff80cbc4)])),
            child: Column(
              children: [
                const SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                Container(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(20.0)),
                  ),
                  child: ToggleButtons(
                    renderBorder: false,
                    isSelected: isSelected,
                    selectedColor: Colors.white,
                    color: Colors.black,
                    borderWidth: 2,
                    fillColor: Colors.teal[900],
                    selectedBorderColor: Colors.black,
                    highlightColor: Colors.brown,
                    borderRadius: BorderRadius.circular(20.0),
                    constraints: const BoxConstraints(
                      maxHeight: 90.0,
                      minWidth: 120.0,
                    ),
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: const Text(
                          'الموعد',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                          'التقارير',
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onPressed: (int newIndex) {
                      setState(() {
                        for (i = 0; i < isSelected.length; i++) {
                          if (i == newIndex) {
                            isSelected[i] = true;
                            show = true;
                          } else {
                            isSelected[i] = false;
                            show = false;
                          }
                        }
                      });
                    },
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                  height: 20.0,
                ),
                show
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 40),
                          BigTextInput(
                              onChanged: (val) {
                                reportContent = val;
                              },
                              icon: Icons.note,
                              hint: "تقرير الطبي",
                              textInputType: TextInputType.multiline,
                              color: const Color(0xffe5e5e5)),
                          const SizedBox(height: 10),
                          RoundedButton(
                            title: "اضافة تقرير",
                            onPressed: () {
                              String id = DateTime.now()
                                      .toString()
                                      .split(" ")[1]
                                      .substring(0, 8) +
                                  "-" +
                                  AuthServices.signedInUser.major;
                              if (reportContent.isNotEmpty) {
                                reportReference.doc(id).set({
                                  'specialistName':
                                      AuthServices.signedInUser.firstName +
                                          " " +
                                          AuthServices.signedInUser.lastName,
                                  'patientId': widget.patient.ID,
                                  'major': AuthServices.signedInUser.major,
                                  'content': reportContent
                                });
                                userReference.doc(widget.patient.ID).update({
                                  'reportsIds': FieldValue.arrayUnion([id])
                                });
                                Navigator.pop(context);
                              }
                            },
                          )
                        ],
                      )
                    : addAppointment(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.patient.firstName + " " + widget.patient.lastName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 17.0, fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.appointment.date,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 17.0, fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
