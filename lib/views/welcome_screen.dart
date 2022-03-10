import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/customElevatedButton.dart';
import 'package:go_inside_fitness/views/signup.dart';

import 'login.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //backgroundColor: Colors.grey[900],
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fitness.png"),
                fit: BoxFit.cover),
          ),
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
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
                Text(
                  'FITNESS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.0),
                CustomElevatedButton(
                  text: 'Sign In',
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => Login())
                    );
                  },
                  color: Color(0xFFFCF4E1),
                  textColor: Color(0xFF2B120D)
                ),
                SizedBox(height: 15.0),
                Text(
                  'or',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  )
                ),
                SizedBox(height: 15.0),
                CustomElevatedButton(
                  text: 'Create a New Account',
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => SignUp())
                    );
                  },
                  color: Color(0xFFFCF4E1),
                  textColor: Color(0xFF2B120D)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
