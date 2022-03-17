import 'package:flutter/material.dart';
import 'package:go_inside_fitness/widget_generators/workouts_and_tutorials.dart';

class Workouts extends StatelessWidget {
  final tabViewer = WorkoutsAndTutorials(date: DateTime.now());

  Workouts({Key? key}) : super(key: key);

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
          title: const Text("28/02/2022"),
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
