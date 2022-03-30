import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_inside_fitness/views/login.dart';
import '../common_widgets/customElevatedButton.dart';
//import 'forgot_password1.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatelessWidget {

  TextEditingController email = TextEditingController();

  final User user;

  ForgotPassword({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
                  'Forgot Password',
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
                      controller: email,
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
                const SizedBox(height: 40.0),
                CustomElevatedButton(
                    text: 'Send Code',
                    onPressed: () async{
                      await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text).then((value) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login(user: user)));
                      });
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
