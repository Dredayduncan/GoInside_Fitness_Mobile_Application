import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoItem extends StatelessWidget {
  final String link;
  final String workoutName;

  const VideoItem({Key? key, required this.link, required this.workoutName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: YoutubePlayerController(
              initialVideoId: YoutubePlayer.convertUrlToId(link)!,
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
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            workoutName,
            style: const TextStyle(
                color: Color(0xFFFCF4E1),
                fontFamily: "Montserrat",
                fontSize: 22,
                fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }
}
