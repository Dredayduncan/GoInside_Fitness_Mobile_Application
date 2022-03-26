import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_inside_fitness/views/welcome_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: WelcomeScreen()));
}