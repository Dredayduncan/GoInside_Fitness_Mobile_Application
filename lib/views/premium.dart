import 'package:flutter/material.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:go_inside_fitness/views/screenManager.dart';
import 'dart:io';

import '../common_widgets/customStatusAlert.dart';
import '../common_widgets/payment_buttons.dart';
import '../services/auth.dart';
import '../services/rt_database.dart';


class Premium extends StatefulWidget {
  final Auth auth;

  const Premium({Key? key, required this.auth}) : super(key: key);

  @override
  State<Premium> createState() => _PremiumState();
}

class _PremiumState extends State<Premium> {

  //pass in the public test key obtained from paystack dashboard here
  String publicKeyTest =
      'pk_test_3c8f00971bc23d4fa34fafe4a8cf1a629524b261';

  final plugin = PaystackPlugin();


  @override
  void initState() {
    //initialize the publicKey
    plugin.initialize(publicKey: publicKeyTest);
    super.initState();
  }

  //a method to show the message
  void _showMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  //used to generate a unique reference for payment
  String _getReference() {
    var platform = (Platform.isIOS) ? 'iOS' : 'Android';
    //var platform = (Platform.isIOS) ? 'iOS' : 'Android';
    final thisDate = DateTime.now().millisecondsSinceEpoch;
    return 'ChargedFrom${platform}_$thisDate';
  }

  //async method to charge users card and return a response
  chargeCard() async {
    var charge = Charge()
      ..amount = 250 * 100 //the money should be in kobo hence the need to multiply the value by 100
      ..reference = _getReference()
      ..putCustomField('custom_id',
          '846gey6w') //to pass extra parameters to be retrieved on the response from Paystack
      ..email = widget.auth.currentUser?.email
      ..currency = "GHS";

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    //check if the response is true or not
    if (response.status == true) {
      //you can send some data from the response to an API or use webhook to record the payment on a database

      // Update the database with the payment info
      RTDatabase().userPackageUpdate(
        userID: widget.auth.currentUser?.uid,
        package: "Premium",
      );

      // Redirect to home screen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScreenManager(auth: widget.auth)),
      );
    } else {
      //the payment wasn't successful or the user cancelled the payment
      return CustomStatusAlert().show(
          context: context,
          title: "Error",
          subtitle: "Payment was unsuccessful",
          icon: Icons.error_outline,
          backgroundColor: const Color(0xFFFCF4E1),
          color: const Color(0xFF2B120D)
      );
    }
  }


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
                  child: PayButton(
                    text: "Purchase",
                    callback: () => chargeCard(),
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
