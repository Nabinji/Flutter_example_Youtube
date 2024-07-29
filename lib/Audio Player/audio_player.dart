import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  const AudioPlayerWidget({super.key});

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  Duration duration = Duration.zero; // Total duration of the audio
  Duration position = Duration.zero; // Current position of the audio playback

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer(); // Initializes the AudioPlayer

    // Listens for duration changes and updates the state
    _audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    // Listens for position changes and updates the state
    _audioPlayer.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    // Listens for when the audio finishes playing and resets the state
    _audioPlayer.onPlayerComplete.listen((event) {
      setState(() {
        isPlaying = false;
        position = Duration.zero;
      });
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); // Disposes the AudioPlayer to free resources
    super.dispose();
  }

  // Toggles play and pause of the audio
  void _playPause() async {
    if (isPlaying) {
      await _audioPlayer.pause(); // Pauses the audio if it is playing
    } else {
      await _audioPlayer.play(
        // audio from network
        UrlSource("https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"),
        // audio from ntwork
        // AssetSource("audio/audio1.mp3"),
      ); // Plays the audio from assets if it is paused
    }
    setState(() {
      isPlaying = !isPlaying; // Updates the playing state
    });
  }

  // Formats the duration to a string with minutes and seconds
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue[300],
              radius: 180,
              child: const Icon(
                Icons.music_note,
                color: Colors.pink,
                size: 200,
              ),
            ), // Displays a music note icon inside a circle avatar
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _formatDuration(
                      position), // Shows the current position of the audio
                  style: const TextStyle(fontSize: 18),
                ),
                IconButton(
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    size: 30,
                  ),
                  onPressed:
                      _playPause, // Plays or pauses the audio when pressed
                ),
                if (duration > Duration.zero)
                  Expanded(
                    child: Slider(
                      value: position.inSeconds
                          .clamp(0, duration.inSeconds)
                          .toDouble(), // Current position of the slider
                      max: duration.inSeconds
                          .toDouble(), // Maximum value of the slider
                      label: _formatDuration(
                          position), // Label showing the current position
                      onChanged: (value) async {
                        final newPosition = Duration(seconds: value.toInt());
                        await _audioPlayer.seek(
                            newPosition); // Seeks to the new position in the audio
                        setState(() {
                          position =
                              newPosition; // Updates the current position
                        });
                      },
                    ),
                  ),
                Text(
                  _formatDuration(
                      duration), // Shows the total duration of the audio
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(height: 200),
          ],
        ),
      ),
    );
  }
}
