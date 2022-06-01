import 'package:flutter/material.dart';
import 'package:specialist/Widgets/RoundedInput.dart';

class RoundedEmailInput extends StatelessWidget {
  const RoundedEmailInput(
      {Key? key,
      required this.icon,
      required this.hint,
      required this.textInputType,
      required this.color})
      : super(key: key);
  final IconData icon;
  final String hint;
  final TextInputType textInputType;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RoundedInput(
      child: TextFormField(
        textAlign: TextAlign.center,
        cursorColor: Colors.teal,
        decoration: InputDecoration(
          icon: Icon(icon, color: Colors.teal),
          hintText: hint,
          border: InputBorder.none,
        ),
        keyboardType: textInputType,
      ),
      color: color,
    );
  }
}
