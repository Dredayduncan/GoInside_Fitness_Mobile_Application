import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/timerActionButton.dart';
// import 'package:flutter_countdown_timer/countdown.dart';
// import 'package:flutter_countdown_timer/countdown_controller.dart';
// import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
// import 'package:flutter_countdown_timer/current_remaining_time.dart';
// import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class WorkoutTracker extends StatefulWidget {
  const WorkoutTracker({Key? key}) : super(key: key);

  @override
  _WorkoutTrackerState createState() => _WorkoutTrackerState();
}

class _WorkoutTrackerState extends State<WorkoutTracker> with TickerProviderStateMixin{

  // int endTime = DateTime
  //     .now()
  //     .millisecondsSinceEpoch + 1000 * 30;
  // CountdownTimerController countdownTimerController = CountdownTimerController(
  //     endTime: DateTime.now().millisecondsSinceEpoch + 1000 * 30, onEnd: () => print('onEnd'),
  // );
  //
  // CountdownController countdownController = CountdownController(
  //     duration: Duration(minutes: 1),
  // );
  // // countdownTimerController =
  //
  // void dispose() {
  //   countdownTimerController.dispose();
  //   super.dispose();
  // }
  //
  // // void initState() {
  // //   super.initState();
  // //   countdownTimerController = CountdownTimerController(endTime: endTime, onEnd: onEnd);
  // // }
  //
  // void onEnd() {
  //   print('onEnd');
  // }
  late AnimationController controller;

  bool isPlaying = false;

  String get countText {
    Duration count = controller.duration! * controller.value;
    return controller.isDismissed
        ? '${controller.duration!.inHours}:${(controller.duration!.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration!.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '0:00:00') {
      // FlutterRingtonePlayer.playNotification();
      print("Ended");
    }
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B120D),
      body: Center(
        child: Column(
            children: [
              const SizedBox(height: 15.0,),
              const Text(
                "Workout Name",
                style: TextStyle(
                    color: Color(0xFFFCF4E1),
                    fontFamily: "Quicksand",
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 15.0,),
              _buildTimer(),
              const SizedBox(height: 15.0,),
              _buildButtons(),
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
                      "Workouts",
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
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      height: 70,
                      color: const Color(0xFFFCF4E1),
                      child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Color(0xFF2B120D)),)),
                    ),
                    Container(
                      height: 70,
                      color: const Color(0xFFFCF4E1),
                      child: const Center(child: Text('Item 2', style: TextStyle(fontSize: 18, color: Color(0xFF2B120D)),)),
                    ),
                    Container(
                      height: 70,
                      color: const Color(0xFFFCF4E1),
                      child: const Center(child: Text('Item 3', style: TextStyle(fontSize: 18, color: Color(0xFF2B120D)),)),
                    ),
                    Container(
                      height: 70,
                      color: const Color(0xFFFCF4E1),
                      child: const Center(child: Text('Item 4', style: TextStyle(fontSize: 18, color: Color(0xFF2B120D)),)),
                    ),
                  ],
                ),
              ),
            ]
        ),
      ),
    );
  }

 Widget _buildButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
          GestureDetector(
            onTap: () {
              if (controller.isAnimating) {
                controller.stop();
                setState(() {
                  isPlaying = false;
                });
              } else {
                controller.reverse(
                    from: controller.value == 0 ? 1.0 : controller.value);
                setState(() {
                  isPlaying = true;
                });
              }
            },
            child: timerActionButton(
              icon: isPlaying == true ? Icons.pause : Icons.play_arrow,
            )
          ),
          GestureDetector(
            onTap: () {
              controller.reset();
              setState(() {
                isPlaying = false;
              });
            },
            child: const timerActionButton(
              icon: Icons.stop,
            )
          ),

      ]
    );
 }

 Widget _buildTimer() {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 250,
            height: 250,
            child: CircularProgressIndicator(
              color: const Color(0xFFFCF4E1),
              backgroundColor: const Color(0xFF5A5A5A),
              value: progress,
              strokeWidth: 10,
            ),
          ),
          GestureDetector(
            onTap: () {
              if (controller.isDismissed) {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    height: 300,
                    child: CupertinoTimerPicker(
                      initialTimerDuration: controller.duration!,
                      onTimerDurationChanged: (time) {
                        setState(() {
                          controller.duration = time;
                        });
                      },
                    ),
                  ),
                );
              }
            },
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Text(
                countText,
                style: const TextStyle(
                  color: Color(0xFFFCF4E1),
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
 }
}


