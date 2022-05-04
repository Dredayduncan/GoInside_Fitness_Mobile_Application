import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:status_alert/status_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class PhoneCall extends StatelessWidget {
  const PhoneCall({Key? key}) : super(key: key);

  Future<bool?> _callNumber(String number) async{
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B120D),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFFCF4E1),
                  radius: 55,
                  child: IconButton(
                    iconSize: 75,
                    onPressed: () {
                      // Call Nathaniel
                      _callNumber("0596058725").then((value) {
                        if (value == false){
                          return StatusAlert.show(
                            context,
                            backgroundColor: const Color(0xFFFCF4E1),
                            duration: const Duration(seconds: 2),
                            title: 'Error',
                            subtitle: 'There was a problem contacting Nathaniel.',
                            configuration: const IconConfiguration(icon: Icons.error_outline),
                          );
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.call,
                      color: Color(0xFF2B120D),
                    )
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  "Call Nathaniel",
                  style: TextStyle(
                    color: Color(0xFFFCF4E1),
                    fontSize: 18
                  ),
                )
              ],
            ),
            const SizedBox(width: 20,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFF5A5A5A),
                  radius: 55,
                  child: IconButton(
                      iconSize: 75,
                      onPressed: () {
                        _callNumber("0508581062").then((value) {
                          if (value == false){
                            return StatusAlert.show(
                              context,
                              backgroundColor: const Color(0xFFFCF4E1),
                              duration: const Duration(seconds: 2),
                              title: 'Error',
                              subtitle: 'There was a problem contacting Padi.',
                              configuration: const IconConfiguration(icon: Icons.error_outline),
                            );
                          }
                        });
                      },
                      icon: const Icon(
                        Icons.call,
                        color: Color(0xFFFCF4E1),
                      )
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(
                  "Call Padi",
                  style: TextStyle(
                      color: Color(0xFFFCF4E1),
                      fontSize: 18
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
