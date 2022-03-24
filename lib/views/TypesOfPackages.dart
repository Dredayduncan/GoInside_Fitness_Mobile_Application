import 'package:flutter/material.dart';
import 'package:go_inside_fitness/views/lite.dart';
import 'package:go_inside_fitness/views/premium.dart';

class TypesOfPackages extends StatelessWidget {
  const TypesOfPackages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: const Color(0xFF2B120D),

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
              SizedBox(height: 20.0),

              Center(
                child: Text("The Packages We Offer",
                  style: TextStyle(
                    letterSpacing: 1.0,
                    //fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Color(0xFFFCF4E1),
                  ),
                ),
              ),

              SizedBox(height: 20.0),

              Center(
                child: Container(
                  height: 133,
                  width: 271,
                  child:
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color(0xFFFCF4E1),
                    //shape: RoundedRectangleBorder(),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Lite()),
                        );
                      },
                      splashColor: Colors.amber,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[



                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Lite",
                                  style: TextStyle(
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                    color: Colors.grey[500],
                                  ),

                              ),
                            ),
                          ),




                          Text("GHS 160 | \$26",
                            style: TextStyle(
                            letterSpacing: 1.0,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                            color: Color(0xFF2B120D),
                          ),
                          ),





                          Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Preview"),
                              )
                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20.0),

              Center(
                child: Text("Or",
                  style: TextStyle(
                    letterSpacing: 1.0,
                    //fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Color(0xFFFCF4E1),
                  ),
                ),
              ),

              SizedBox(height: 20.0),

              Center(
                child: Container(

                  height: 133,
                  width: 271,
                  child:
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    color: Color(0xFF5A5A5A),
                    //shape: RoundedRectangleBorder(),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Premium()),
                        );
                      },
                      splashColor: Colors.amber,

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Premium",
                                style: TextStyle(
                                  letterSpacing: 1.0,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),


                          Text("GHS 250 | \$40",
                            style: TextStyle(
                              letterSpacing: 1.0,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Color(0xFF2B120D),
                            ),

                          ),


                          Align(
                            alignment: Alignment.topRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Preview"),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50.0),
              
              Center(
                child: Text("We offer these two packages to "
                    "our clients to allow them to determine "
                    "which schedule best fits them.",
                style: TextStyle(
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w300,
                  fontSize: 11.0,
                  color: Color(0xFFFCF4E1),
                ),
                  textAlign: TextAlign.center,
                ),
              )


            ],
          ),
        ),
        backgroundColor: const Color(0xFF2B120D),
      ),
    );
  }
}
