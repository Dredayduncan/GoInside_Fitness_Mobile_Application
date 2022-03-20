import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_inside_fitness/views/forgot_password.dart';
import 'package:go_inside_fitness/views/signup.dart';
import '../common_widgets/customElevatedButton.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        //backgroundColor: Colors.grey[900],
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fitness.png"),
                fit: BoxFit.cover),
          ),
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Center(
            child: Form(
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
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[500]?.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: [AutofillHints.email],
                        //obscureText: true,
                        //controller: nameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Email',
                          icon: Icon(Icons.email, color: Colors.white),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          errorStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        validator: (email) => email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[500]?.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        obscureText: true,
                        style: TextStyle(color: Colors.white),
                        //controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Password',
                          icon: Icon(Icons.key, color: Colors.white),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          errorStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        validator: (value){
                          if(value!.isEmpty){return "Please enter password";}
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 250.0,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => ForgotPassword())
                        );
                      },
                      child: Text(
                          "Forgot Password?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white
                          )
                      ),
                    )
                  ),
                  SizedBox(height: 10.0),
                  CustomElevatedButton(
                      text: 'Log In',
                      onPressed: () {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context) => Login())
                        );
                      },
                      color: Color(0xFFFCF4E1),
                      textColor: Color(0xFF2B120D)
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => SignUp())
                      );
                    },
                    child: Text(
                      "Don't have an account yet? Sign Up",
                      style: TextStyle(
                        color: Color(0xFFFCF4E1),
                        fontWeight: FontWeight.bold
                      )
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  }
}
