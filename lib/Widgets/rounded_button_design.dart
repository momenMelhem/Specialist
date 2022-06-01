import 'package:flutter/material.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  final Function onPressed;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60),
          color: const Color(0xff004d40)),
      width: size.width * 0.4,
      height: (size.height - 520) * 0.29,
      child: TextButton(
        onPressed: () {
          widget.onPressed();
        },
        child: Text(widget.title,
            style: const TextStyle(color: Colors.white, fontSize: 18.0)),
        style: TextButton.styleFrom(
          primary: const Color(0xff004d40),
        ),
      ),
    );
  }
}
//0Xff6a62b7
