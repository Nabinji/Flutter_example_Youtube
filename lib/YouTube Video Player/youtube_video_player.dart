import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeVideoPlayerFlutter extends StatefulWidget {
  const YoutubeVideoPlayerFlutter({super.key});

  @override
  State<YoutubeVideoPlayerFlutter> createState() =>
      _YoutubeVideoPlayerFlutterState();
}

// Define the state for the main widget
class _YoutubeVideoPlayerFlutterState extends State<YoutubeVideoPlayerFlutter> {
  // URL of the YouTube video
  final videoLink = "https://youtu.be/9Frle6pMcug";
  // Controller to manage the YouTube player
  late YoutubePlayerController playerController;

  // Initialize the state
  @override
  void initState() {
    // Extract the video ID from the YouTube URL
    final videoId = YoutubePlayer.convertUrlToId(videoLink);
    // Initialize the YouTube player controller with the video ID
    playerController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
          autoPlay: false), // Do not auto-play the video
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
            "Play YouTube Video on Flutter App"), 
      ),
      body: ListView(
        children: [
          // YouTube player widget
          YoutubePlayer(
            controller: playerController,
            // Uncomment the following lines to show the video progress indicator and other controls
            // showVideoProgressIndicator: true, // Show progress indicator
            // bottomActions: [
            //   CurrentPosition(), // Show the current position of the video
            //   ProgressBar(
            //     isExpanded: true,
            //     colors: const ProgressBarColors(
            //       playedColor: Colors.red, // Color of the played portion of the video
            //       handleColor: Colors.amber, // Color of the handle on the progress bar
            //     ),
            //   ),
            //   const PlaybackSpeedButton() // Button to change playback speed
            // ],
          )
        ],
      ),
    );
  }
}
