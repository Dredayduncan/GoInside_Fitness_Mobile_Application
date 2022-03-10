import 'package:flutter/material.dart';

class PackagesTypes extends StatelessWidget {
  const PackagesTypes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF2B120D),
            title: Center(child: Text('Go Inside Fitness')),
          ),

          body: Container(
            padding: EdgeInsets.all(30.0),
            child: GridView.count(
              crossAxisCount: 1,
              children: <Widget>[
                //Text("The packages we offer"),
                Card(
                  shape: RoundedRectangleBorder(),
                  child: InkWell(
                    onTap: (){},
                    splashColor: Colors.amber,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Lite"),
                        Text("GHS 160 | \$26"),
                        Text("Preview ->"),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: InkWell(
                    onTap: (){},
                    splashColor: Colors.amber,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Lite"),
                        Text("GHS 250 | \$40"),
                        Text("Preview ->"),
                      ],
                    ),
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
