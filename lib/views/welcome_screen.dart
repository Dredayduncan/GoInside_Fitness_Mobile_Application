import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/customElevatedButton.dart';
import 'package:go_inside_fitness/services/auth.dart';
import 'package:go_inside_fitness/views/signup.dart';
import 'package:go_inside_fitness/views/login.dart';

class WelcomeScreen extends StatelessWidget {

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fitness.png"),
                fit: BoxFit.cover),
          ),
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'GO INSIDE',
                  style: TextStyle(
                    color: Colors.yellow[100],
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'FITNESS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15.0),
                CustomElevatedButton(
                  text: 'Sign In',
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => const Login())
                    );
                  },
                  color: const Color(0xFFFCF4E1),
                  textColor: const Color(0xFF2B120D)
                ),
                const SizedBox(height: 15.0),
                const Text(
                  'or',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )
                ),
                const SizedBox(height: 15.0),
                CustomElevatedButton(
                  text: 'Create a New Account',
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => SignUp())
                    );
                  },
                  color: const Color(0xFFFCF4E1),
                  textColor: const Color(0xFF2B120D)
                ),
              ],
            ),
          ),
        ),
      );
  }
}
