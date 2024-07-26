import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Define the main widget for the YouTube video player
class YoutubeVideoPlayerFlutter extends StatefulWidget {
  const YoutubeVideoPlayerFlutter({super.key});

  @override
  State<YoutubeVideoPlayerFlutter> createState() =>
      _YoutubeVideoPlayerFlutterState();
}

class _YoutubeVideoPlayerFlutterState extends State<YoutubeVideoPlayerFlutter> {
  //URL of th YouTube Video
  final videoURL = "https://youtu.be/yz2Iryuln2s?si=42oSyTnbno-xCkHO";
  // Controller to manage the Youtube video
  late YoutubePlayerController playerController;
  // Initialize the state
  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoURL);
    // Initialize the youtube player controller with the video id
    playerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
            autoPlay: false) // do not auto-play the video
        );
    super.initState();
  }

// Method to seek forward 10 seconds
  void seekForward() {
    final currentPosition = playerController.value.position;
    final duration = playerController.value.metaData.duration;
    if (currentPosition.inSeconds + 10 < duration.inSeconds) {
      playerController.seekTo(
        currentPosition + const Duration(seconds: 10),
      );
    }
  }

// Method to seek backward 10 seconds
  void seekBackward() {
    final currentPosition = playerController.value.position;
    if (currentPosition.inSeconds - 10 > 0) {
      playerController.seekTo(currentPosition - const Duration(seconds: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Play YouTube Video on Flutter App"),
      ),
      body: Stack(
        children: [
          YoutubePlayer(controller: playerController),
          Positioned(
            top: 100,right: 100,left: 100,bottom: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: seekBackward,
                  icon: const Icon(Icons.replay_10,size: 30,color: Colors.white54,),
                ),
                const SizedBox(width: 30),
                IconButton(
                  onPressed: seekForward,
                  icon: const Icon(Icons.forward_10,size: 30,color: Colors.white54,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
