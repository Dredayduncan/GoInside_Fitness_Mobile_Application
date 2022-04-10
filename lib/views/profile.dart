import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/customElevatedButton.dart';
import 'package:go_inside_fitness/common_widgets/customPackageIndicator.dart';
import 'package:go_inside_fitness/common_widgets/customTextField.dart';
import 'package:go_inside_fitness/services/rt_database.dart';
import 'package:path_provider/path_provider.dart';
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
  late String _dropdownValue;
  Widget _currentPage = const CircularProgressIndicator(
    color: Color(0xFFFCF4E1),
  );

  // List of items in our dropdown menu
  final List<String> goals = [
    "None",
    'Weight Gain',
    'Weight Loss',
  ];

  //Create database variable
  final RTDatabase db = RTDatabase();

  // instantiate image picker option
  final ImagePicker _picker = ImagePicker();

  //Instantiate form key
  final _formKey = GlobalKey<FormState>();

  // Create text controllers for the various fields
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  //Create variable for name and email display
  late String _userName;
  late String _userEmail;

  Future<bool> _populateFields() async {
    await db.getUser(userID: widget.auth.currentUser?.uid).then((value) {
      setState(() {
        _name.text = value['fullName'];
        _userName = value['fullName'];
        _userEmail = value['email'];
        _email.text = value['email'];
        _contact.text = value['contact'];
        _height.text = value['height'];
        _weight.text = value['weight'];
        _dropdownValue = value['goal'] != "" ? value['goal'] : "None";
      });

      return true;
    });

    return false;
  }

  void navigationPage() async {
    await _populateFields();

    setState(() {
      _currentPage = _buildProfile();
    });
  }

  @override
  initState() {
    //Initialize the text fields
    navigationPage();
    super.initState();
  }

  //diplay profile picture
  File? _dp = null;

  Future getImage() async {
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null){

      setState(() {
        File file = File(pickedImage.path);
        _dp = file;
      });


    }


    // // getting a directory path for saving
    // final Directory path = await getApplicationDocumentsDirectory();
    //
    // // copy the file to a new path
    // final File newImage = await file.copy('${path.path}/image1.png');


  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _currentPage,
    );
  }

  Widget _buildProfile(){
    return Scaffold(
      backgroundColor: const Color(0xFF2B120D),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
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
                              backgroundImage: _dp != null ? Image.file(
                                _dp!,
                                fit: BoxFit.cover,
                              ) as ImageProvider : const AssetImage("images/profile.jpeg") as ImageProvider,
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
                validator: (_name) {
                  if (_name!.isEmpty){
                    return "Please enter your name";
                  }

                  return null;
                },
                controller: _name,
                value: "",
                labeledText: "Your Name",
                containerWidth: 360.0,
                textFieldWidth: 300.0
              ),

              const SizedBox(height: 10.0,),

              CustomTextField(
                  validator: (_email) {
                    if (_email!.isEmpty){
                      return "Please enter your email";
                    }

                    return null;
                  },
                  controller: _email,
                  value: "",
                  labeledText: "Your Email",
                  containerWidth: 360.0,
                  textFieldWidth: 300.0
              ),

              const SizedBox(height: 10.0,),

              CustomTextField(
                  validator: (_contact) {
                    if (_contact!.isEmpty){
                      return "Please enter your contact";
                    }

                    return null;
                  },
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
                      validator: (_height) {
                        if (_height!.isEmpty){
                          return "Please fill";
                        }

                        return null;
                      },
                      controller: _height,
                      value: "",
                      labeledText: "Height",
                      containerWidth: 150.0,
                      textFieldWidth: 100.0
                  ),

                  const SizedBox(width: 10.0,),

                  CustomTextField(
                      validator: (_weight) {
                        if (_weight!.isEmpty){
                          return "Please fill";
                        }

                        return null;
                      },
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
                          value: _dropdownValue,

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
                                _dropdownValue,
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
                              _dropdownValue = newValue!;
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

                  if (!_formKey.currentState!.validate()){
                    return StatusAlert.show(
                      context,
                      backgroundColor: const Color(0xFFFCF4E1),
                      duration: const Duration(seconds: 1),
                      title: 'Error',
                      subtitle: 'Your profile could not be updated.',
                      configuration: const IconConfiguration(icon: Icons.error_outline),
                    );
                  }
                  else{

                    try{
                      RTDatabase().userProfileUpdate(
                          userID: widget.auth.currentUser?.uid,
                          email: _email.text,
                          fullName: _name.text,
                          contact: _contact.text,
                          goal: _dropdownValue,
                          height: _height.text,
                          weight: _weight.text,
                          picture: ""
                      );

                      setState(() {
                        navigationPage();
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
                  }

                },
                color: const Color(0xFFFCF4E1),
                textColor: const Color(0xFF2B120D),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
