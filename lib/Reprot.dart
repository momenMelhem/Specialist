import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Report extends StatefulWidget {
  const Report({Key? key}) : super(key: key);

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int i = 0;
  List<bool> isSelected = [true, false];
  bool show = true;
  @override
  Widget build(BuildContext context) {
    Widget textArea() {
      return Flexible(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: TextField(
            keyboardType: TextInputType.multiline,
            textDirection: TextDirection.rtl,
            textInputAction: TextInputAction.newline,
            textAlign: TextAlign.start,
            minLines: null,
            maxLines: null,
            expands: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ),
      );
    }

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
              Container(
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.9),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: ToggleButtons(
                  renderBorder: false,
                  isSelected: isSelected,
                  selectedColor: Colors.white,
                  color: Colors.black,
                  borderWidth: 2,
                  fillColor: Colors.green,
                  selectedBorderColor: Colors.black,
                  highlightColor: Colors.brown,
                  borderRadius: BorderRadius.circular(20.0),
                  constraints: BoxConstraints(
                    maxHeight: 90.0,
                    minWidth: 120.0,
                  ),
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'التحاليل',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: Text(
                        'التقارير',
                        style: TextStyle(
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
              if (show) textArea(),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 110.0,
                  vertical: 20,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.teal[900],
                    borderRadius: BorderRadius.circular(21.0),
                  ),
                  child: MaterialButton(
                    child: Text(
                      'اضافة',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
