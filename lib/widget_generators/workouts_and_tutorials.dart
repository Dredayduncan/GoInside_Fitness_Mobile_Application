import 'package:flutter/material.dart';
import 'package:go_inside_fitness/common_widgets/videoItems.dart';
import 'package:go_inside_fitness/common_widgets/workoutItem.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WorkoutsAndTutorials {
  final DateTime date;

  WorkoutsAndTutorials({
    required this.date
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
        children: [
          YoutubePlayerBuilder(
            player: YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=sSIccj82Dyg&list=PLCRdosAfKRzD7lmesClKc_OIgF2n3OFt9&index=1")!,
                  flags: const YoutubePlayerFlags(
                    hideControls: false,
                    controlsVisibleAtStart: true,
                    autoPlay: false,
                    mute: false
                  ),
                ),
              showVideoProgressIndicator: true,
              progressIndicatorColor: const Color(0xFFFCF4E1),
            ),
            builder: (context, player) {
              return Column(
                children: [
                  player
                ],
              );
            },
          )
          // VideoItems(
          //   videoPlayerController: VideoPlayerController.network(
          //       'https://www.youtube.com/watch?v=sSIccj82Dyg&list=PLCRdosAfKRzD7lmesClKc_OIgF2n3OFt9&index=1'
          //   ),
          //   looping: false,
          //   autoplay: true,
          // ),
        ],
      ),
    );
  }
}