import 'package:flutter/material.dart';
class CancelButton extends StatelessWidget {
  const CancelButton(
      {Key? key,
      required this.isLogin,
      required this.animationDuration,
      required this.animationController,
      required this.size,
      required this.tabEvent}) : super(key: key);

  final bool isLogin;
  final Duration animationDuration;
  final AnimationController animationController;
  final Size size;
  final VoidCallback? tabEvent;
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isLogin ? 0.0 : 1.0,
      duration: animationDuration,
      child: Align(
          alignment: Alignment.topCenter,
          child: Container(
              width: size.width,
              height: size.height * 0.1,
              alignment: Alignment.bottomCenter,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: tabEvent,
                color: const Color(0Xff6a62b7),
              )
          )
      ),
    );
  }
}
