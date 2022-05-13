import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:specialist/signUpScrn.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
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
              ToggleSwitch(
                initialLabelIndex: 0,
                totalSwitches: 2,
                minWidth: 100.0,
                minHeight: 85.0,
                cornerRadius: 16.0,
                activeBgColor: [Colors.green],
                activeFgColor: Colors.white,
                inactiveBgColor: Colors.red,
                inactiveFgColor: Colors.white,
                labels: ['التقارير', 'التحاليل'],
                customTextStyles: [
                  TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ],
                onToggle: (index) {
                  print('switched to: $index');
                },
              ),
              const SizedBox(
                width: 20.0,
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
