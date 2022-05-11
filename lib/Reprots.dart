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
          child: ToggleSwitch(
            initialLabelIndex: 0,
            totalSwitches: 2,
            labels: ['التقارير', 'التحاليل'],
            fontSize: 16.0,
            onToggle: (index) {
              print('switched to: $index');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Suc()));
            },
          ),
        ),
      ),
    );
  }
}
