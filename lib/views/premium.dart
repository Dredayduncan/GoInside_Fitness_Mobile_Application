import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/customElevatedButton.dart';


class Premium extends StatelessWidget {
  const Premium({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF2B120D),
          elevation: 0,
        ),

        body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                  child: Text("GO INSIDE",
                    style: TextStyle(letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 29.0,
                      color: Color(0xFFFCF4E1),
                        fontFamily: "OpenSans"
                    ),
                  )
              ),
              Center(
                child: Text("FITNESS",
                  style: TextStyle(letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 29.0,
                    color: Colors.white,
                      fontFamily: "OpenSans"
                  ),
                ),
              ),

              SizedBox(height: 10.0),
              Center(
                child: Text("Premium",
                  style: TextStyle(letterSpacing: 1.0,
                    fontSize: 15.0,
                    color: Color(0xFFFCF4E1),
                      fontFamily: "Montserrat"
                  ),
                ),
              ),

              SizedBox(height: 10),

              Expanded(
                child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: <Widget>[
                      ListTile( title: Text("Fitness routine & instructive videos", style: TextStyle(fontFamily: "Montserrat"),), leading: Icon(Icons.brightness_1, size: 6, ),
                          textColor: Color(0xFFFCF4E1), iconColor: Color(0xFFFCF4E1)),

                      ListTile( title: Text("Curated Informative YouTube playlists", style: TextStyle(fontFamily: "Montserrat"),), leading: Icon(Icons.brightness_1, size: 6,  ),
                          textColor: Color(0xFFFCF4E1), iconColor: Color(0xFFFCF4E1)),

                      ListTile( title: Text("Workout song playlists", style: TextStyle(fontFamily: "Montserrat"),), leading: Icon(Icons.brightness_1, size: 6,  ),
                          textColor: Color(0xFFFCF4E1), iconColor: Color(0xFFFCF4E1)),

                      ListTile( title: Text("Sample meal plans", style: TextStyle(fontFamily: "Montserrat"),), leading: Icon(Icons.brightness_1, size: 6,  ),
                          textColor: Color(0xFFFCF4E1), iconColor: Color(0xFFFCF4E1)),

                      ListTile( title: Text("Calorie guidance & nutrition tips", style: TextStyle(fontFamily: "Montserrat"),), leading: Icon(Icons.brightness_1, size: 6,  ),
                          textColor: Color(0xFFFCF4E1), iconColor: Color(0xFFFCF4E1)),

                      ListTile( title: Text("Accountability group", style: TextStyle(fontFamily: "Montserrat"),), leading: Icon(Icons.brightness_1, size: 6,  ),
                          textColor: Color(0xFFFCF4E1), iconColor: Color(0xFFFCF4E1)),

                    ]


                ),
              ),

              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 45.0),
                  child: CustomElevatedButton(
                    text: "Purchase",
                    onPressed: (){},
                    color: Color(0xFFFCF4E1),
                    textColor: Color(0xFF2B120D),
                  ),
                ),
              )



            ],
          ),
        ),

        backgroundColor: const Color(0xFF2B120D),

      );

  }
}
