import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import '../common_widgets/customElevatedButton.dart';
import 'package:go_inside_fitness/views/login.dart';

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String _name, _email, _phone;

  final emailController = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

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
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
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
                    width: 300.0,
                    decoration: BoxDecoration(
                        color: Colors.grey[500]?.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        //obscureText: true,
                        //controller: nameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Full Name',
                          icon: Icon(Icons.person, color: Colors.white),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          errorStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        validator: (value){
                          if(value!.isEmpty){return "Please enter name";}
                          return null;
                        },
                        onSaved: (name){
                          _name = name!;
                        },
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
                        onSaved: (email){
                          _email = email!;
                        },
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
                        //obscureText: true,
                        //controller: nameController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Phone Number',
                            icon: Icon(Icons.phone, color: Colors.white),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            errorStyle: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        validator: (value){
                          if(value!.isEmpty){return "Please enter phone number";}
                          return null;
                        },
                        onSaved: (phone){
                          _phone = phone!;
                        },
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
                        controller: _password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Enter Password',
                          icon: Icon(Icons.lock, color: Colors.white),
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
                        controller: _confirmpassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          icon: Icon(Icons.lock, color: Colors.white),
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                          errorStyle: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )
                        ),
                        validator: (value){
                          if(value!.isEmpty){return "Please confirm password";}
                          if(_password.text != _confirmpassword.text){return "Passwords do not match";}
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  CustomElevatedButton(
                      text: 'Create My Account',
                      onPressed: () {
                        if(_formkey.currentState!.validate()) {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(
                              builder: (context) => Login())
                          );
                        }
                      },
                      color: Color(0xFFFCF4E1),
                      textColor: Color(0xFF2B120D)
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context, MaterialPageRoute(
                          builder: (context) => Login())
                      );
                    },
                    child: Text(
                        'Already have an account? Log In',
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
