import 'package:flutter/material.dart';
class RoundedInput extends StatelessWidget {
  const RoundedInput({Key? key , required this.child, required this.color}) : super(key: key);
  final Widget child;
  final Color color;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: color
      ),

      child: child
    );
  }
}
