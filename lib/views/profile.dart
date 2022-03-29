import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/customElevatedButton.dart';
import 'package:go_inside_fitness/common_widgets/customPackageIndicator.dart';
import 'package:go_inside_fitness/common_widgets/customTextField.dart';
import 'package:go_inside_fitness/services/rt_database.dart';
import 'package:status_alert/status_alert.dart';
import '../services/auth.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  final Auth auth;

  const Profile({Key? key, required this.auth}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Initial Selected Value
  late String dropdownValue;

  // List of items in our dropdown menu
  var goals = [
    'None',
    'Weight Gain',
    'Weight Loss',
  ];

  //Create database variable
  final RTDatabase db = RTDatabase();

  // Create text controllers for the various fields
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  //Create variable for name and email display
  late String _userName;
  late String _userEmail;

  void populateFields() async {
    await db.getUser(userID: widget.auth.currentUser?.uid).then((value) {
      setState(() {
        _name.text = value['fullName'];
        _userName = value['fullName'];
        _userEmail = value['email'];
        _email.text = value['email'];
        _contact.text = value['contact'];
        _height.text = value['height'];
        _weight.text = value['weight'];
        dropdownValue = value['goal'];
      });
    });
  }

  @override
  initState() {
    //Initialize the text fields
    dropdownValue = "None";
    _userName = "None";
    _userEmail = "None";
    populateFields();
    super.initState();
  }

  // instantiate image picker option
  final ImagePicker _picker = ImagePicker();

  //diplay profile picture
  String _dp = "images/profile.jpeg";

  final picker = ImagePicker();

  Future getImage() async {
    final File pickedImage = (await picker.pickImage(source: ImageSource.gallery)) as File;


    File tmpFile = File(pickedImage.path);
    tmpFile = await tmpFile.copy("images/$tmpFile.path");
    print("This is the path, ${tmpFile.path}");

    setState(() {
      _dp = tmpFile.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B120D),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Color(0xFF5A5A5A)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(_dp),
                            minRadius: 50.0,
                          ),
                          Positioned(
                            bottom: 5,
                            right: 0,
                            child: Container(
                              height: 35.0,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFFCF4E1),
                              ),
                              child: IconButton(
                                  iconSize: 20.0,
                                  onPressed: () {
                                    getImage();

                                  },
                                  icon: const Icon(Icons.camera_alt_rounded)),
                            )
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _userName,
                              style: const TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFCF4E1)
                              ),
                            ),
                            Text(_userEmail,
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 14,
                                  color: Color(0xFFFCF4E1)
                              )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            CustomTextField(
              controller: _name,
              value: "",
              labeledText: "Your Name",
              containerWidth: 360.0,
              textFieldWidth: 300.0
            ),

            const SizedBox(height: 10.0,),

            CustomTextField(
              controller: _email,
              value: "",
              labeledText: "Your Email",
              containerWidth: 360.0,
              textFieldWidth: 300.0
            ),

            const SizedBox(height: 10.0,),

            CustomTextField(
              controller: _contact,
              value: "",
              labeledText: "Contact",
              containerWidth: 360.0,
              textFieldWidth: 300.0
            ),

            const SizedBox(height: 10.0,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextField(
                  controller: _height,
                  value: "",
                  labeledText: "Height",
                  containerWidth: 150.0,
                  textFieldWidth: 100.0
                ),

                const SizedBox(width: 10.0,),

                CustomTextField(
                  controller: _weight,
                  value: "",
                  labeledText: "Weight",
                  containerWidth: 150.0,
                  textFieldWidth: 100.0
                ),
              ],
            ),

            const SizedBox(height: 10.0,),

            const CustomPackageIndicator(
                package: "GO INSIDE PACKAGE",
                value: "LITE"
            ),

            const SizedBox(height: 10.0,),

            Container(
                height: 60,
                width: 360,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    color: Color(0xFF5A5A5A)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0, top: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "GOAL",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300
                        ),
                      ),
                      SizedBox(
                        height: 32,
                        width: 300,
                        child: DropdownButton(
                          isExpanded: true,

                          style: const TextStyle(
                            color: Color(0xFF2B120D)
                          ),

                          // Initial Value
                          value: dropdownValue,

                          // Down Arrow Icon
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFFFCF4E1),
                          ),

                          // Array list of items
                          items: goals.map((String item) {
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
                            return goals.map((String value) {
                              return Text(
                                dropdownValue,
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
                              dropdownValue = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            ),


            const SizedBox(height: 10.0,),
            CustomElevatedButton(
              text: "Save Profile",
              onPressed: () {
                try{
                  RTDatabase().userProfileUpdate(
                      userID: widget.auth.currentUser?.uid,
                      email: _email.text,
                      fullName: _name.text,
                      contact: _contact.text,
                      goal: dropdownValue,
                      height: _height.text,
                      weight: _weight.text,
                      picture: ""
                  );

                  setState(() {
                    populateFields();
                  });

                  return StatusAlert.show(
                    context,
                    backgroundColor: const Color(0xFFFCF4E1),
                    duration: const Duration(seconds: 2),
                    title: 'Success',
                    subtitle: 'Your profile has been successfully updated.',
                    configuration: const IconConfiguration(icon: Icons.done),
                  );
                } catch (e){
                  return StatusAlert.show(
                    context,
                    backgroundColor: const Color(0xFFFCF4E1),
                    duration: const Duration(seconds: 2),
                    title: 'Error',
                    subtitle: 'Your profile could not be updated.',
                    configuration: const IconConfiguration(icon: Icons.error_outline),
                  );
                }

              },
              color: const Color(0xFFFCF4E1),
              textColor: const Color(0xFF2B120D),
            ),
          ],
        ),
      ),
    );
  }
}
