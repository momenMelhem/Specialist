import 'package:flutter/material.dart';
import 'package:specialist/Widgets/RoundedInput.dart';
class RoundedPassword extends StatelessWidget {
  const RoundedPassword(
      {Key? key,
        required this.icon,
        required this.hint,
        required this.showPassword,
        required this.passwordVisible,
        required this.color}) : super(key: key);
  final IconData icon;
  final String hint;
  final Function showPassword;
  final bool passwordVisible;
  final Color color;
  @override
  Widget build(BuildContext context) {

    return RoundedInput(
      child: TextFormField(
        textAlign: TextAlign.center,
        cursorColor: const Color(0Xff6a62b7),
        obscureText: passwordVisible,
        decoration: InputDecoration(
            border: InputBorder.none,
            icon:  Icon(icon, color:const Color(0Xff6a62b7)),
            hintText: hint,
            suffixIcon: IconButton(icon:Icon(!passwordVisible
                ? Icons.visibility : Icons.visibility_off),onPressed: () { showPassword();})
        )
      ),
      color: color,
    );
  }
}

