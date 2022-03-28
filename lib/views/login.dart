import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_inside_fitness/views/forgot_password.dart';
import 'package:go_inside_fitness/views/screenManager.dart';
import 'package:go_inside_fitness/views/signup.dart';
import '../common_widgets/customElevatedButton.dart';
import '../services/auth.dart';

class Login extends StatefulWidget {

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController = TextEditingController();
  TextEditingController _password = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  final Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(
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
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Center(
            child: Form(
              key: _formkey,
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
                  const SizedBox(height: 5.0),
                  const Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[500]?.withOpacity(0.5),
                        borderRadius: const BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autofillHints: [AutofillHints.email],
                        controller: emailController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Email',
                          icon: const Icon(Icons.email, color: Colors.white),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          errorStyle: const TextStyle(
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
                  const SizedBox(height: 15.0),
                  Container(
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[500]?.withOpacity(0.5),
                        borderRadius: const BorderRadius.all(const Radius.circular(50.0))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        controller: _password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Password',
                          icon: const Icon(Icons.key, color: Colors.white),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          errorStyle: const TextStyle(
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
                      child: const Text(
                          "Forgot Password?",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Colors.white
                          )
                      ),
                    )
                  ),
                  const SizedBox(height: 10.0),
                  CustomElevatedButton(
                      text: 'Log In',
                      onPressed: () {
                        if(_formkey.currentState!.validate()) {
                          FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: emailController.text,
                              password: _password.text).
                          then((value) {
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context) => ScreenManager(auth: auth))
                            );
                          });
                        }
                      },
                      color: const Color(0xFFFCF4E1),
                      textColor: const Color(0xFF2B120D)
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => SignUp())
                      );
                    },
                    child: const Text(
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
