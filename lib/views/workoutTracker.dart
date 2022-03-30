import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/timerActionButton.dart';

class WorkoutTracker extends StatefulWidget {
  const WorkoutTracker({Key? key}) : super(key: key);

  @override
  _WorkoutTrackerState createState() => _WorkoutTrackerState();
}

class _WorkoutTrackerState extends State<WorkoutTracker> with TickerProviderStateMixin{

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
      duration: const Duration(seconds: 60),
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
              const SizedBox(
                width: 300,
                child: Text(
                  "Time your workouts! Tap the time to set your time and Go Inside!",
                  style: TextStyle(
                      color: Color(0xFFFCF4E1),
                      fontFamily: "Quicksand",
                      fontSize: 16,
                      fontWeight: FontWeight.normal
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              _buildTimer(),
              const SizedBox(height: 15.0,),
              _buildButtons(),
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
            child: TimerActionButton(
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
            child: const TimerActionButton(
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


