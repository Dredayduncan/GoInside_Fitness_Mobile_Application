import 'package:flutter/material.dart';

class CustomPackageCard extends StatelessWidget {
  final Widget page;
  final String cost;
  final Color cardColor;
  final String packageName;

  const CustomPackageCard({
    Key? key,
    required this.page,
    required this.cost,
    required this.cardColor,
    required this.packageName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 133,
        width: 271,
        child:
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          color: cardColor,
          //shape: RoundedRectangleBorder(),
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => page),
              );
            },
            splashColor: Colors.white70,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15,8,0,8),
                    child: Text(
                      packageName,
                      style: TextStyle(
                        //letterSpacing: 1.0,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.grey[500],
                          fontFamily: "Montserrat"
                      ),
                    ),
                  ),
                ),
                Text(cost,
                  style: const TextStyle(
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      color: Color(0xFF2B120D),
                      fontFamily: "Montserrat"
                  ),
                ),
                const Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0,12,8,0),
                      child: Text(
                        "Preview",
                        style: TextStyle(
                            fontFamily: "Montserrat"
                      ),),
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
