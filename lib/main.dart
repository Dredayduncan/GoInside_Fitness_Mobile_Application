import 'package:flutter/material.dart';
import 'package:go_inside_fitness/services/rt_database.dart';
import 'package:go_inside_fitness/views/screenManager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // RTDatabase().userSignUp(
  //     0,
  //     "Andrew Duncan",
  //     "0206742892",
  //     "dredayduncan@gmail.com",
  //     22,
  //     "Male",
  //     );
  runApp(const ScreenManager());
}

