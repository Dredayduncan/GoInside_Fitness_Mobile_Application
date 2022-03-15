import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/customElevatedButton.dart';

class Lite extends StatelessWidget {
  const Lite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFCF4E1),
          elevation: 0,
        ),


        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text("GO INSIDE",
                    style: TextStyle(letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 29.0,
                      color: Color(0xFF2B120D),
                    ),
                  )
              ),
              Center(
                child: Text("FITNESS",
                  style: TextStyle(letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 29.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text("Lite",
                  style: TextStyle(letterSpacing: 1.0,
                    fontSize: 15.0,
                    color: Color(0xFF2B120D),
                  ),
                ),
              ),

              SizedBox(height: 10),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      ListTile( title: Text("Fitness routine & instructive videos"), leading: Icon(Icons.brightness_1, size: 17, ),
                      textColor: Color(0xFF2B120D), iconColor: Color(0xFF2B120D)),

                      ListTile( title: Text("Curated Informative YouTube playlists"), leading: Icon(Icons.brightness_1, size: 17,  ),
                          textColor: Color(0xFF2B120D), iconColor: Color(0xFF2B120D)),

                      ListTile( title: Text("Workout song playlists"), leading: Icon(Icons.brightness_1, size: 17,  ),
                          textColor: Color(0xFF2B120D), iconColor: Color(0xFF2B120D)),

                      ListTile( title: Text("Sample meal plans"), leading: Icon(Icons.brightness_1, size: 17,  ),
                          textColor: Color(0xFF2B120D), iconColor: Color(0xFF2B120D)),

                      ListTile( title: Text("Calorie guidance & nutrition tips"), leading: Icon(Icons.brightness_1, size: 17,  ),
                          textColor: Color(0xFF2B120D), iconColor: Color(0xFF2B120D)),
                    ]


                ),
              ),
              
              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 45.0),
                  child: CustomElevatedButton(
                      text: "Purchase",
                      onPressed: (){},
                      color: Color(0xFF2B120D),
                      textColor: Color(0xFFFCF4E1),
                  ),
                ),
              )


            ],
          ),
        ),

        backgroundColor: const Color(0xFFFCF4E1),
    );
  }
}
