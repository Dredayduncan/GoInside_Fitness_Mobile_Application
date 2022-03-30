import 'package:flutter/material.dart';


class CustomInfoText extends StatelessWidget {
  final String text;

  const CustomInfoText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      child: ListTile(
        minLeadingWidth: 0,
          title: Transform.translate(
            offset: Offset(-8, -8),
            child: Text(text,
              style: const TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w900
              ),
            ),
          ),
          leading: const Icon(
            Icons.brightness_1,
            size: 6,
          ),
          textColor: const Color(0xFF2B120D),
          iconColor: const Color(0xFF2B120D),
      ),
    );
  }
}
