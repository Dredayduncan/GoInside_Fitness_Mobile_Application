import 'package:flutter/material.dart';

class timerActionButton extends StatelessWidget {
  const timerActionButton({
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
        radius: 25,
        child: Icon(
          icon,
          size: 30,
          color: const Color(0xFF2B120D),
        ),
      ),
    );
  }
}
