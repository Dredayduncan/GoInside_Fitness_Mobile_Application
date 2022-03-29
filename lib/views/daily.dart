import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/customElevatedButton.dart';
import 'package:go_inside_fitness/views/workouts.dart';
import 'package:go_inside_fitness/widget_generators/meals.dart';
import 'package:table_calendar/table_calendar.dart';

class Daily extends StatefulWidget {
  const Daily({Key? key}) : super(key: key);

  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  late Meals _meals;
  late Future<Widget> _getMeals;

  @override
  void initState() {
    _meals = Meals();
    _getMeals = _meals.getMeals(_selectedDay.weekday);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B120D),
      body: Column(
        children: [
          Container(
            color: const Color(0xFFFCF4E1),
            child: TableCalendar(
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Color(0xFF5A5A5A),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Color(0xFF2B120D),
                  shape: BoxShape.circle,
                )
              ),
              firstDay: DateTime.utc(2010, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                // Use `selectedDayPredicate` to determine which day is currently selected.
                // If this returns true, then `day` will be marked as selected.

                // Using `isSameDay` is recommended to disregard
                // the time-part of compared DateTime objects.
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDay, selectedDay)) {
                  // Call `setState()` when updating the selected day
                  setState(() {
                    _selectedDay = selectedDay;
                    _getMeals = _meals.getMeals(selectedDay.weekday);
                    // _focusedDay = focusedDay;
                  });
                }
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
            ),
          ),
          const SizedBox(height: 10.0,),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2.0, color: Color(0xFFFCF4E1))
              )
            ),
            child: const Center(
              child: Text(
                "Meals",
                style: TextStyle(
                  color: Color(0xFFFCF4E1),
                  fontSize: 22.0,
                  fontFamily: "Quicksand"
                ),
              ),
            )
          ),
          const SizedBox(height: 2.0,),
          Expanded(
            child: Scrollbar(
              child: FutureBuilder(
                  future: _getMeals,
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
            )
          ),
          const SizedBox(height: 2.0,),
          CustomElevatedButton(
            text: "View Today's Workouts",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Workouts(goal: "Weight Loss", theDate: _selectedDay,)),
              );
            },
            color: const Color(0xFFFCF4E1),
            textColor: const Color(0xFF2B120D),
          ),
        ],
      )
    );
  }
}
