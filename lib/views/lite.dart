import 'package:flutter/material.dart';

class Lite extends StatelessWidget {
  const Lite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF2B120D),
          title: Center(child: Text('Go Inside Fitness Lite')),
        ),
      ),
    );
  }
}
