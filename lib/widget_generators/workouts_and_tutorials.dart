import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_inside_fitness/common_widgets/videoItems.dart';
import 'package:go_inside_fitness/common_widgets/workoutItem.dart';
import 'package:go_inside_fitness/services/rt_database.dart';

class WorkoutsAndTutorials {
  final int theDate;
  final String goal;
  // Create workout and description variables
  late List dailyWorkouts;
  late String description;
  final RTDatabase db = RTDatabase();

  final Map days = {
    1: "Monday",
    2: "Tuesday",
    3: "Wednesday",
    4: "Thursday",
    5: "Friday",
    6: "Saturday",
    7: "Sunday"
  };

  WorkoutsAndTutorials({
    required this.goal,
    required this.theDate,
  });

  Future<Widget> viewWorkouts() async {

    return await db.getWorkouts(
      day: days[theDate],
      goal: goal
    ).then((value) {
      if (value.isEmpty){
        return const Center(
          child: Text(
            "There are no workouts for today.",
            style: TextStyle(
              color: Color(0xFFFCF4E1)
            ),
          ),
        );
      }
      else{
        var desc = value['description'] != "" ? value['description'] : "There is no extra info on today's workouts.";
        List dailyWorkouts = value['workouts'];

        final children = <Widget>[];
        children.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.info,
                  color: Color(0xFFFCF4E1),
                  size: 40,
                ),
                const SizedBox(width: 10),
                SizedBox(
                width: 300,
                child: Text(
                  desc,
                  style: const TextStyle(
                    color: Color(0xFFFCF4E1),
                    fontSize: 16
                  ),
                ),
              ),
            ]
            ),
          )
        );

        for (var i = 0; i < dailyWorkouts.length; i++) {
          children.add(
              WorkoutItem(
              label: dailyWorkouts[i]['name'],
              body: dailyWorkouts[i]['repNumber'].toString()
             )
          );
        }

        return Scrollbar(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: children,
          )
        );
      }
    });
  }

  Future<Widget> viewTutorials() async {
    return await db.getWorkouts(
        day: days[theDate],
        goal: goal
    ).then((value) {
      if (value.isEmpty){
        return const Center(
          child: Text(
            "There are no tutorials for today.",
            style: TextStyle(
                color: Color(0xFFFCF4E1)
            ),
          ),
        );
      }
      else{
        // Get the workouts for that day
        List dailyWorkouts = value['workouts'];

        //Initialize the list of tutorials
        final children = <Widget>[];

        for (var i = 0; i < dailyWorkouts.length; i++) {
          if (dailyWorkouts[i]['link'] != ""){
            children.add(
                VideoItem(
                  workoutName: dailyWorkouts[i]['name'],
                  link: dailyWorkouts[i]['link'],
                )
            );
          }

        }

        if (children.isEmpty){
          return const Center(
            child: Text(
              "There are no tutorials for today.",
              style: TextStyle(
                  color: Color(0xFFFCF4E1)
              ),
            ),
          );
        }

        return Scrollbar(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: children,
            )
        );
      }
    });
  }
}