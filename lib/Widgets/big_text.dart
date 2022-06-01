import 'package:flutter/material.dart';
import 'package:specialist/Widgets/RoundedInput.dart';

class BigTextInput extends StatelessWidget {
  const BigTextInput(
      {Key? key,
      required this.onChanged,
      required this.icon,
      required this.hint,
      required this.textInputType,
      required this.color})
      : super(key: key);
  final Function onChanged;
  final IconData icon;
  final String hint;
  final TextInputType textInputType;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return RoundedInput(
      child: TextFormField(
        onChanged: (val) {
          onChanged(val);
        },
        maxLines: null,
        minLines: 10,
        textAlign: TextAlign.center,
        cursorColor: const Color(0Xff6a62b7),
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
