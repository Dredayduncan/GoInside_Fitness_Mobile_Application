import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labeledText;
  final double containerWidth;
  final double textFieldWidth;
  final String value;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  CustomTextField({
    Key? key,
    this.validator,
    required this.labeledText,
    required this.containerWidth,
    required this.textFieldWidth,
    required this.value,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: containerWidth,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Color(0xFF5A5A5A)
      ),
      child: Center(
          child: SizedBox(
            width: textFieldWidth,
            child: TextFormField(
              validator: validator,
              controller: controller,
              style: const TextStyle(
                  color: Color(0xFFFCF4E1)
              ),
              decoration: InputDecoration(
                labelText: labeledText,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 15,
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFFCF4E1)),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          )
      ),
    );
  }
}
