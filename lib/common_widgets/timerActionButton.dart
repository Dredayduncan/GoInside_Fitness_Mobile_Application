import 'package:flutter/material.dart';

class TimerActionButton extends StatelessWidget {
  const TimerActionButton({
    Key? key,
    required this.icon,
  }) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
      ),
      child: CircleAvatar(
        backgroundColor: const Color(0xFFFCF4E1),
        radius: 35,
        child: Icon(
          icon,
          size: 50,
          color: const Color(0xFF2B120D),
        ),
      ),
    );
  }
}
