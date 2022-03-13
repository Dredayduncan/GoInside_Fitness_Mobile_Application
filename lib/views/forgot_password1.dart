import 'package:flutter/material.dart';
import '../common_widgets/customElevatedButton.dart';
import 'forgot_password.dart';

class ForgotPassword1 extends StatelessWidget {
  const ForgotPassword1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      //backgroundColor: Colors.grey[900],
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/fitness.png"),
              fit: BoxFit.cover),
        ),
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'GO INSIDE',
                style: TextStyle(
                  color: Colors.yellow[100],
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'FITNESS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                'A code has been sent to your email',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                width: 300.0,
                decoration: BoxDecoration(
                    color: Colors.grey[500]?.withOpacity(0.5),
                    borderRadius: BorderRadius.all(Radius.circular(50.0))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: TextField(
                    //obscureText: true,
                    //controller: nameController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Code',
                      icon: Icon(Icons.email, color: Colors.white),
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              CustomElevatedButton(
                  text: 'Verify Code',
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context) => ForgotPassword())
                    );
                  },
                  color: Color(0xFFFCF4E1),
                  textColor: Color(0xFF2B120D)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
