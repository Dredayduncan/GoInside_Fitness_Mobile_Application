import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/fitness.png"),
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
                Container(
                    width: 250.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
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
                Container(
                    width: 250.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        color: Colors.yellow[100],
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Center(
                      child: Text(
                        'Create a New Account',
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.brown,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
