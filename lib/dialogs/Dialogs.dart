import 'package:flutter/material.dart';

class WarningDialog extends StatelessWidget {
  WarningDialog(
      {this.title = '',
      this.text = '',
      this.buttontext = '',
      required this.action});
  String title, text, buttontext;
  final action;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Color(0x00ffffff),
      elevation: 0,
      content: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.teal.shade900),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: action,
                    child: Text(
                      buttontext,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ErrorDialog extends StatelessWidget {
  ErrorDialog({this.title = '', this.text = ''});
  String title, text;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Color(0x00ffffff),
      elevation: 0,
      content: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.teal.shade900),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class WaitingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      backgroundColor: Color(0x00ffffff),
      elevation: 0,
      content: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            color: Colors.teal.shade900),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Please wait',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0, top: 12),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
