import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_inside_fitness/widget_generators/workouts_and_tutorials.dart';

class Workouts extends StatelessWidget {
  final DateTime theDate;
  final String goal;
  late WorkoutsAndTutorials tabViewer;

  Workouts({Key? key, required this.goal, required this.theDate}) : super(key: key){
    tabViewer = WorkoutsAndTutorials(goal: goal, theDate: theDate.weekday);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFF2B120D),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFF2B120D),
          bottom: const TabBar(
            indicatorColor: Color(0xFFFCF4E1),
            tabs: [
              Tab(
                text: "Workouts",
              ),
              Tab(
                text: "Video Tutorials",
              ),
            ],
          ),
          title: Text(DateFormat("dd/MM/yyyy").format(theDate)),
        ),
        body: TabBarView(
          children: [
            FutureBuilder(
              future: tabViewer.viewWorkouts(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData){
                  return snapshot.data;
                }
                else {
                  return
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(
                          child: CircularProgressIndicator(
                            color: Color(0xFFFCF4E1),
                          ),
                          width: 60,
                          height: 60,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text(
                            'Awaiting result...',
                            style: TextStyle(
                              color: Color(0xFFFCF4E1)
                            ),
                          ),
                        )
                      ],
                    );
                }
              }
            ),
            tabViewer.viewTutorials()
          ],
        ),
      ),
    );
  }
}
