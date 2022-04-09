import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../common_widgets/customElevatedButton.dart';
import 'package:go_inside_fitness/views/login.dart';

import '../services/auth.dart';

class SignUp extends StatefulWidget {

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  late String _name, _phone;

  String gender = "Male";

  // List of items in our dropdown menu
  final List<String> genders = [
    'Male',
    'Female',
  ];


  final emailController = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();

  //Get authentication
  Auth auth = Auth();

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
            child: SingleChildScrollView(
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
                      'Create a new account',
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
                          controller: _nameController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter Full Name',
                            icon: const Icon(Icons.person, color: Colors.white),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            errorStyle: const TextStyle(
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
                    const SizedBox(height: 15.0),
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
                          /*onSaved: (email){
                            _email = email!;
                          },*/
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      width: 300.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[500]?.withOpacity(0.5),
                          borderRadius: const BorderRadius.all(Radius.circular(50.0))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: TextFormField(
                          controller: _phoneController,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter Phone Number',
                              icon: const Icon(Icons.phone, color: Colors.white),
                              hintStyle: TextStyle(
                                color: Colors.grey[400],
                              ),
                              errorStyle: const TextStyle(
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
                    const SizedBox(height: 15.0,),
                    Container(
                      width: 300.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[500]?.withOpacity(0.5),
                          borderRadius: const BorderRadius.all(Radius.circular(50.0))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: DropdownButton(
                          isExpanded: true,

                          style: const TextStyle(
                              color: Color(0xFF2B120D)
                          ),

                          // Initial Value
                          value: gender,

                          // Down Arrow Icon
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFFFCF4E1),
                          ),

                          // Array list of items
                          items: genders.map((String item) {
                            return DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  color: Color(0xFF2B120D),
                                ),
                              ),
                            );
                          }).toList(),

                          selectedItemBuilder: (BuildContext context) {
                            return genders.map((String value) {
                              return Text(
                                gender,
                                style: const TextStyle(
                                  color: Color(0xFFFCF4E1),
                                ),
                              );
                            }).toList();
                          },

                          // After selecting the desired option,it will
                          // change button value to selected value
                          onChanged: (String? newValue) {
                            setState(() {
                              gender = newValue!;
                            });
                          },
                        ),
                      )
                    ),
                    const SizedBox(height: 15.0),
                    Container(
                      width: 300.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[500]?.withOpacity(0.5),
                          borderRadius: const BorderRadius.all(Radius.circular(50.0))
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
                            icon: const Icon(Icons.lock, color: Colors.white),
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
                    const SizedBox(height: 15.0),
                    Container(
                      width: 300.0,
                      decoration: BoxDecoration(
                          color: Colors.grey[500]?.withOpacity(0.5),
                          borderRadius: const BorderRadius.all(Radius.circular(50.0))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: TextFormField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          controller: _confirmpassword,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password',
                            icon: const Icon(Icons.lock, color: Colors.white),
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                            ),
                            errorStyle: const TextStyle(
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
                    const SizedBox(height: 40.0),
                    CustomElevatedButton(
                        text: 'Create My Account',
                        onPressed: () {
                          if(_formkey.currentState!.validate()) {
                            auth.createUserWithEmailAndPassword(
                              email: emailController.text,
                              password: _password.text,
                              name: _nameController.text,
                              gender: "",
                              contact: _phoneController.text,
                            ).
                            then((value) {
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(
                                  builder: (context) => Login(user: value!))
                              );
                            });
                          }
                        },
                        color: const Color(0xFFFCF4E1),
                        textColor: const Color(0xFF2B120D)
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context, MaterialPageRoute(
                          builder: (context) => const Login())
                        );
                      },
                      child: const Text(
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
        ),
      );
  }
}
