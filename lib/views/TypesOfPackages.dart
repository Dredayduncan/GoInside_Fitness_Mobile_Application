import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/customPackageCard.dart';
import 'package:go_inside_fitness/services/auth.dart';
import 'package:go_inside_fitness/views/lite.dart';
import 'package:go_inside_fitness/views/premium.dart';

class TypesOfPackages extends StatelessWidget {
  final Auth auth;

  const TypesOfPackages({Key? key, required this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xFF2B120D),

        ),

        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text("GO INSIDE",
                    style: TextStyle(letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 29.0,
                      color: Color(0xFFFCF4E1),
                      fontFamily: "OpenSans"
                    ),
                  )
                ),
                const Center(
                  child: Text("FITNESS",
                    style: TextStyle(letterSpacing: 2.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 29.0,
                      color: Colors.white,
                        fontFamily: "OpenSans"
                    ),
                  ),
                ),
                //SizedBox(height: 20.0),

                const Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                  child: Center(
                    child: Text("The Packages We Offer",
                      style: TextStyle(
                        letterSpacing: 1.0,
                        //fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Color(0xFFFCF4E1),
                          fontFamily: "Montserrat"
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20.0),

                CustomPackageCard(
                    packageName: "Lite",
                    page: Lite(auth: auth),
                    cost: "GHS 160 | \$26",
                    cardColor: const Color(0xFFFCF4E1)
                ),

                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Center(
                    child: Text("Or",
                      style: TextStyle(
                        letterSpacing: 1.0,
                        //fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Color(0xFFFCF4E1),
                          fontFamily: "Montserrat"

                      ),
                    ),
                  ),
                ),

                //SizedBox(height: 20.0),

                CustomPackageCard(
                    page: Premium(auth: auth,),
                    cost: "GHS 250 | \$40",
                    cardColor: const Color(0xFF5A5A5A),
                    packageName: "Premium"
                ),

                
                const Padding(
                  padding: EdgeInsets.fromLTRB(0,40,0,0),
                  child: Center(
                    child: Text("We offer these two packages to "
                        "our clients to allow them to determine "
                        "which schedule best fits them.",
                    style: TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w300,
                      fontSize: 11.0,
                      color: Color(0xFFFCF4E1),
                        fontFamily: "Montserrat"
                    ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )


              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xFF2B120D),
      ),
    );
  }
}
