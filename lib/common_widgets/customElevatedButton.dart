import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback? onPressed;
  final double height;

  const CustomElevatedButton({
    Key? key,
    required this.child,
    required this.onPressed,
    this.borderRadius = 16.0,
    this.height = 50.0,
    required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
          child: child,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              primary: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  )))),
    );
  }
}