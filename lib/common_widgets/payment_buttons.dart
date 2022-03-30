import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class PayButton extends StatelessWidget {

  final VoidCallback callback;
  final String text;
  final Color color;
  final double borderRadius;
  //final VoidCallback? onPressed;
  final double height;
  final Color textColor;

  const PayButton({
    Key? key,
    required this.callback,
    required this.text,
    //required this.onPressed,
    this.borderRadius = 50.0,
    this.height = 50.0,
    required this.color,
    required this.textColor
  })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: callback,
          child: Text(
            text,
            style: TextStyle(
                color: textColor,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.bold,
                fontSize: 18.0
            ),
          ),
          //onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              fixedSize: const Size(300, 10),
              primary: color,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(borderRadius),
                  )))),
    );
  }
}