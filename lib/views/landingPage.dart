import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_inside_fitness/services/rt_database.dart';
import 'package:go_inside_fitness/views/TypesOfPackages.dart';
import 'package:go_inside_fitness/views/screenManager.dart';
import 'package:go_inside_fitness/views/welcome_screen.dart';

import '../services/auth.dart';

class LandingPage extends StatelessWidget {
  final Auth auth = Auth();
  final RTDatabase db = RTDatabase();

  LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: auth.authStateChanges(),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.active) {
            final user = snapshot.data;

            //Check if the user has signed in
            if (user == null){

              //Display the signIn page if the user has not logged in
              return const WelcomeScreen();
            }

            //Check if the user has a package that is not expired
            db.isUserClient(userID: user.uid).then((value) {

              if (value == true) {
                //Display the homepage when the user signed in
                return Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ScreenManager(auth: auth))
                );
                // return ScreenManager(auth: auth,);
              }

              return Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TypesOfPackages(auth: auth))
              );
            });


          }

          //Display a loading UI while the data is loading
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
    );
  }

}
