import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioPlayerApp extends StatefulWidget {
  const AudioPlayerApp({super.key});

  @override
  State<AudioPlayerApp> createState() => _AudioPlayerAppState();
}

class _AudioPlayerAppState extends State<AudioPlayerApp> {
  late AudioPlayer audioPlayer;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer(); // Initiaizes tha audioplayer
    // Listens for  duration changes and updates the state
    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    // Listens for  position changes and updates the state
    audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
    // Listens for  when the audio finished playing  and resets the state
    audioPlayer.onPlayerComplete.listen((events) {
      setState(() {
        isPlaying = false;
        duration = Duration.zero;
      });
    });
  }

  void despose() {
    audioPlayer.dispose(); // Dispose tha audioPlayer to free resource
    super.dispose();
  }

  // Toggle play and pause of the audio
  void playPause() async {
    if (isPlaying) {
      await audioPlayer.pause(); // Pause tha audio if it is playing
    } else {
      await audioPlayer.play(
          // audio from assets
          // AssetSource("audio/audio1.mp3"),
          // audio from network
          UrlSource(
              "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"));
    }
    setState(() {
      isPlaying = !isPlaying; // updates the playing state
    });
  }

// Formats the duration to a string with munutes and seconds
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Audip Player"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 180,
              backgroundColor: Colors.blue[300],
              child: const Icon(
                Icons.music_note,
                size: 200,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  formatDuration(
                      position), // show the current position of the audion
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  onPressed: playPause,
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 30,
                  ),
                ),
                if (duration > Duration.zero)
                  Expanded(
                    child: Slider(
                      value: position.inSeconds
                          .clamp(0, duration.inSeconds)
                          .toDouble(), // current position of the slider
                      max: duration.inSeconds
                          .toDouble(), // maximum value of the  slider
                      label: formatDuration(
                          position), // label showing the current postition
                      onChanged: (value) async {
                        final newPosition = Duration(seconds: value.toInt());
                        await audioPlayer.seek(
                            newPosition); // seeks to the new position int the audio
                        setState(() {
                          position =
                              newPosition; // updates the current position
                        });
                      },
                    ),
                  ),
                Text(
                  formatDuration(
                      duration), // show the current position of the audion
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 150),
          ],
        ),
      ),
    );
  }
}
