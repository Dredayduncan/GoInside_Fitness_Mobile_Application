import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/mealItem.dart';
import 'package:go_inside_fitness/services/rt_database.dart';

class Meals {

  // Instantiate Databse object
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

  Future<Widget> getMeals(theDate) async {
    return await db.getMeals(
        day: days[theDate]
    ).then((value) {
      if (value.isEmpty){
        return const Center(
          child: Text(
            "There are no meals for today.",
            style: TextStyle(
                color: Color(0xFFFCF4E1)
            ),
          ),
        );
      }
      else{

        return ListView(
          scrollDirection: Axis.vertical,
          children: [
            MealItem(
              label: "Breakfast",
              body: value['breakfast']
            ),
            MealItem(
                label: "First Snack",
                body: value['first snack']
            ),
            MealItem(
                label: "Lunch",
                body: value['lunch']
            ),
            MealItem(
                label: "Second Snack",
                body: value['second snack']
            ),
            MealItem(
                label: "Dinner",
                body: value['dinner']
            )
          ],
        );
      }
    });
  }

}