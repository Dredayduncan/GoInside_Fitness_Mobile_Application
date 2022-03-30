import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_inside_fitness/views/welcome_screen.dart';
import 'package:go_inside_fitness/services/auth.dart';
import 'package:go_inside_fitness/views/landingPage.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if (Firebase.apps.isNotEmpty){
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
  else {
    Firebase.app();
  }

  runApp(MaterialApp(home: WelcomeScreen()));
}
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Auth auth = Auth();
  runApp(MaterialApp(home: LandingPage(auth: auth,)));
}
