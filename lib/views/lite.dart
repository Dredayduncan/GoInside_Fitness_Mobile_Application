import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/customInfoText.dart';
import 'package:go_inside_fitness/common_widgets/payment_buttons.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'dart:io';


class Lite extends StatefulWidget {

  @override
  State<Lite> createState() => _LiteState();
}

class _LiteState extends State<Lite> {

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
    final thisDate = DateTime.now().millisecondsSinceEpoch;
    return 'ChargedFrom${platform}_$thisDate';
  }

  //async method to charge users card and return a response
  chargeCard() async {
    var charge = Charge()
      ..amount = 160 * 100 //the money should be in kobo hence the need to multiply the value by 100
      ..reference = _getReference()
      ..putCustomField('custom_id',
          '846gey6w') //to pass extra parameters to be retrieved on the response from Paystack
      ..email = 'tutorial@email.com'
      ..currency = 'GHS'
    ;

    CheckoutResponse response = await plugin.checkout(
      context,
      method: CheckoutMethod.card,
      charge: charge,
    );

    //check if the response is true or not
    if (response.status == true) {
      //you can send some data from the response to an API or use webhook to record the payment on a database
      _showMessage('Payment was successful!!!');
    } else {
      //the payment wasn't successsful or the user cancelled the payment
      _showMessage('Payment Failed!!!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFFCF4E1),
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
                      color: Color(0xFF2B120D),
                        fontFamily: "OpenSans"
                    ),
                  )
              ),

              Center(
                child: Text("FITNESS",
                  style: TextStyle(letterSpacing: 2.0,
                    fontWeight: FontWeight.bold,
                    fontSize: 29.0,
                      color: Color(0xFF5A5A5A),
                      fontFamily: "OpenSans"
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Center(
                child: Text("Lite",
                  style: TextStyle(letterSpacing: 1.0,
                    fontSize: 15.0,
                    color: Color(0xFF2B120D),
                      fontFamily: "Montserrat"
                  ),
                ),
              ),

              SizedBox(height: 10),

              Expanded(
                child: Center(
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                      children: const <Widget>[
                        CustomInfoText(text: "Fitness routine & instructive videos"),
                        CustomInfoText(text: "Curated Informative YouTube playlists"),
                        CustomInfoText(text: "Workout song playlists"),
                        CustomInfoText(text: "Sample meal plans"),
                        CustomInfoText(text: "Calorie guidance & nutrition tips"),

                      ]


                  ),
                ),
              ),

              Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 45.0),
                  child: PayButton(
                      text: "Purchase",
                    callback: () => chargeCard(),
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
