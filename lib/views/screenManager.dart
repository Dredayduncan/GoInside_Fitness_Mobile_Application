import 'package:flutter/material.dart';
import 'profile.dart';
import 'daily.dart';
import 'workoutTracker.dart';

class ScreenManager extends StatefulWidget {

  const ScreenManager({Key? key}) : super(key: key);

  @override
  State<ScreenManager> createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  late int _selectedIndex = 0;
  String _title = "";
  Icon _icon = Icon(Icons.cancel);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setTitleInfo(String title, Icon icon) {
    setState(() {
      _title = title;
      _icon = icon;
    });
  }

  Widget _getPage(int index){
    switch (index) {
      case 0:
        _setTitleInfo("Workout Tracker", Icon(Icons.fitness_center));
        return const WorkoutTracker();
         // return the daily page as a widget
      case 1:
        _setTitleInfo("Daily", Icon(Icons.calendar_today));
        return const Daily();// return the profile page as a widget
      case 2:
        _setTitleInfo("Profile", Icon(Icons.person));
        return const Profile(); // return the workout tracker page as a widget
    }

    _setTitleInfo("Page Not Found", Icon(Icons.cancel));
    return const Center(child: Text("There is no page builder for this index."),);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:  Scaffold(
            body: _getPage(_selectedIndex),
            appBar: AppBar(
              backgroundColor: const Color(0xFF2B120D),
              // centerTitle: true,
              elevation: 0,
              // leading: const Icon(Icons.person),
              // title: Text(_title),
              title:Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _icon,
                    SizedBox(width: 5.0),
                    Container(
                      child: Text(_title),
                    )

                  ],
                ),
              ),
            ),
            backgroundColor: const Color(0xFF2B120D),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: const Color(0xFF2B120D),
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.timer),
                  label: "Workout Tracker"
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today),
                  label: "Daily"
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Profile"
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: const Color(0xFFFCF4E1),
              unselectedItemColor: const Color(0xFF2B2B2B),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: _onItemTapped,
            )
        )
    );
  }
}
