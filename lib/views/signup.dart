import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

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
                SizedBox(height: 5.0),
                Text(
                  'Create a new account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  width: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[500]?.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                  ),
                  child: TextField(
                    //obscureText: true,
                    //controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Full Name',
                      icon: Icon(Icons.person, color: Colors.white),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  width: 250.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[500]?.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))
                  ),
                  child: TextField(
                    //obscureText: true,
                    //controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Email',
                      icon: Icon(Icons.email, color: Colors.white),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  width: 250.0,
                  decoration: BoxDecoration(
                      color: Colors.grey[500]?.withOpacity(0.5),
                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                  ),
                  child: TextField(
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    //controller: nameController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                      icon: Icon(Icons.key, color: Colors.white),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.0),
                Container(
                  width: 250.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.yellow[100],
                      borderRadius: BorderRadius.all(Radius.circular(50.0))
                  ),
                  child: Center(
                    child: Text(
                      'Create My Account',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.brown,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
