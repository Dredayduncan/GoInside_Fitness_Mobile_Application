import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_inside_fitness/common_widgets/musicItem.dart';
import 'package:go_inside_fitness/common_widgets/timerActionButton.dart';
import 'package:go_inside_fitness/views/landingPage.dart';

class WorkoutTracker extends StatefulWidget {
  const WorkoutTracker({Key? key}) : super(key: key);

  @override
  _WorkoutTrackerState createState() => _WorkoutTrackerState();
}

class _WorkoutTrackerState extends State<WorkoutTracker> with TickerProviderStateMixin{

  List<Widget> spotifyPlaylists = [
    const MusicItem(
        label: "Go Inside Afrobeat 1",
        link: "https://open.spotify.com/playlist/6GsEs5D9VGVCaThoyLL7vS?si=b2bc5ee6ec594f60"
    ),
    const MusicItem(
        label: "Go Inside Fitness Rap 1",
        link: "https://open.spotify.com/playlist/6TpNxHPcnOudItQZDcHw6X?si=e65e009ce8474025"
    ),
    const MusicItem(
        label: "Go Inside Afrobeat 2",
        link: "https://open.spotify.com/playlist/14a10G2Psq0oeKPWOtaph?si=U58sXi7HQJ-tcpRcIbGgXQ"
    ),
  ];

  late AnimationController controller;

  // Instantiate the notification object
  late FlutterLocalNotificationsPlugin _notifications;

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
      _showNotification(
          title: "Time's Up",
          body: "You have successfully completed your workout"
      );
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

    // set up notifications
    _notifications = FlutterLocalNotificationsPlugin();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = IOSInitializationSettings();

    const settings = InitializationSettings(
        android: android,
        iOS: iOS
    );

    _notifications.initialize(
        settings,
        onSelectNotification: (payload) async {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LandingPage())
          );
        }
    );
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
              const SizedBox(height: 5.0,),
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
              const SizedBox(height: 10.0,),
              _buildTimer(),
              const SizedBox(height: 10.0,),
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
                      "Playlists",
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
                    child:  ListView(
                  scrollDirection: Axis.vertical,
                    children: spotifyPlaylists,
                  )
                )
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

  // The function responsible for sending push notifications
  Future _showNotification({
    int id = 0,
    String? title,
    String? body,
  }) async => _notifications.show(
    id,
    title,
    body,
    await _notificationDetails(), //Await because this is an async function
  );

  Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'Local Notification',
        channelDescription: "Channel Description",
        importance: Importance.high,
      ),
      iOS: IOSNotificationDetails(),
    );
  }
}




