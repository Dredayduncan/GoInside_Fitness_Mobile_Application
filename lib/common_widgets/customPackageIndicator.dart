import "package:flutter/material.dart";

class CustomPackageIndicator extends StatelessWidget {
  final String value;
  final String package;

  const CustomPackageIndicator({
    Key? key,
    required this.package,
    required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        width: 360,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Color(0xFF5A5A5A)
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, top: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                package,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  color: Color(0xFFFCF4E1),
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        )
    );
  }
}
