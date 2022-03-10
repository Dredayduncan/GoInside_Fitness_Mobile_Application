import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/customElevatedButton.dart';
import 'package:go_inside_fitness/common_widgets/customTextField.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B120D),
      body: Column(
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
                        const CircleAvatar(
                          backgroundImage: AssetImage("images/profile.jpeg"),
                          minRadius: 60.0,
                        ),
                        Positioned(
                          bottom: 5,
                          right: 0,
                          child: Container(
                            height: 37.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFFFCF4E1),
                            ),
                            child: IconButton(
                                iconSize: 20.0,
                                onPressed: () {},
                                icon: const Icon(Icons.camera_alt_rounded)),
                          )
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "John Doe",
                            style: TextStyle(
                              fontFamily: "Montserrat",
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFCF4E1)
                            ),
                          ),
                          Text("theperson@gmail.com",
                            style: TextStyle(
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
          const CustomTextField(
            value: "",
            labeledText: "Your Name",
            containerWidth: 360.0,
            textFieldWidth: 300.0
          ),

          const SizedBox(height: 10.0,),

          const CustomTextField(
              value: "",
              labeledText: "Your Email",
              containerWidth: 360.0,
              textFieldWidth: 300.0
          ),

          const SizedBox(height: 10.0,),

          const CustomTextField(
              value: "",
              labeledText: "Password",
              containerWidth: 360.0,
              textFieldWidth: 300.0
          ),

          const SizedBox(height: 10.0,),

          const CustomTextField(
              value: "",
              labeledText: "Confirm Password",
              containerWidth: 360.0,
              textFieldWidth: 300.0
          ),

          const SizedBox(height: 10.0,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomTextField(
                  value: "",
                  labeledText: "Height",
                  containerWidth: 150.0,
                  textFieldWidth: 100.0
              ),

              SizedBox(width: 10.0,),

              CustomTextField(
                  value: "",
                  labeledText: "Weight",
                  containerWidth: 150.0,
                  textFieldWidth: 100.0
              ),
            ],
          ),
          Container(
            height: 60,
            width: 360,
            decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Color(0xFF5A5A5A)
            ),
            child: Column(
              children: const [
                Text(
                  "GO INSIDE PACKAGE",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                Text(
                  "LITE",
                  style: TextStyle(
                    color: Color(0xFFFCF4E1)
                  ),
                )
              ],
            )
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomElevatedButton(
              text: "Save Profile",
              onPressed: () {},
              color: const Color(0xFFFCF4E1),
              textColor: const Color(0xFF2B120D),
            ),
          )
        ],
      ),
    );
  }
}
