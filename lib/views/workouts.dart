import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_inside_fitness/widget_generators/workouts_and_tutorials.dart';

class Workouts extends StatelessWidget {
  final DateTime theDate;
  late WorkoutsAndTutorials tabViewer;

  Workouts({Key? key, required this.theDate}) : super(key: key){
    tabViewer = WorkoutsAndTutorials(theDate: theDate);
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
            tabViewer.viewWorkouts(),
            tabViewer.viewTutorials()
          ],
        ),
      ),
    );
  }
}
