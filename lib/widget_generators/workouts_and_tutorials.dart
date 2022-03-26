import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/videoItems.dart';
import 'package:go_inside_fitness/common_widgets/workoutItem.dart';

class WorkoutsAndTutorials {
  final DateTime theDate;

  WorkoutsAndTutorials({
    required this.theDate
  });

  Widget viewWorkouts(){
    return Scrollbar(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          WorkoutItem(
              label: "Workout Name",
              body: "Number of reps | Number of sets"
          ),
          SizedBox(height: 5.0,),
          WorkoutItem(
              label: "Workout Name",
              body: "Number of reps | Number of sets"
          ),
          SizedBox(height: 5.0,),
          WorkoutItem(
              label: "Workout Name",
              body: "Number of reps | Number of sets"
          ),
          SizedBox(height: 5.0,),
          WorkoutItem(
              label: "Workout Name",
              body: "Number of reps | Number of sets"
          ),
          SizedBox(height: 5.0,),
          WorkoutItem(
              label: "Workout Name",
              body: "Number of reps | Number of sets"
          ),
          SizedBox(height:5.0,),
          WorkoutItem(
              label: "Workout Name",
              body: "Number of reps | Number of sets"
          ),
          SizedBox(height: 5.0,),
          WorkoutItem(
              label: "Workout Name",
              body: "Number of reps | Number of sets"
          ),
          SizedBox(height: 5.0,),
          WorkoutItem(
              label: "Workout Name",
              body: "Number of reps | Number of sets"
          ),
        ],
      ),
    );
  }

  Widget viewTutorials(){
    return Scrollbar(
      child: ListView(
        scrollDirection: Axis.vertical,
        children: const [
          VideoItem(
              link: "https://www.youtube.com/watch?v=sSIccj82Dyg&list=PLCRdosAfKRzD7lmesClKc_OIgF2n3OFt9&index=1",
              workoutName: "Push Ups"),
          VideoItem(
              link: "https://www.youtube.com/watch?v=sSIccj82Dyg&list=PLCRdosAfKRzD7lmesClKc_OIgF2n3OFt9&index=1",
              workoutName: "Push Ups"),
          VideoItem(
              link: "https://www.youtube.com/watch?v=sSIccj82Dyg&list=PLCRdosAfKRzD7lmesClKc_OIgF2n3OFt9&index=1",
              workoutName: "Push Ups"),
          VideoItem(
              link: "https://www.youtube.com/watch?v=sSIccj82Dyg&list=PLCRdosAfKRzD7lmesClKc_OIgF2n3OFt9&index=1",
              workoutName: "Push Ups"),
        ],
      ),
    );
  }
}