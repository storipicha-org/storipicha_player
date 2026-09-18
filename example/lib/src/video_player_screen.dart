import 'package:flutter/material.dart';
import 'package:storipicha_player/storipicha_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final StoripichaPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = StoripichaPlayerController(
      viewType: PlayerViewType.texture, // 🎨 Or PlayerViewType.surface
    );
    _initializeAndPlay();
  }

  Future<void> _initializeAndPlay() async {
    // 1️⃣ Initialize player instance
    await _controller.initialize();

    // 2️⃣ Load media stream
    await _controller.setMediaItem(
      MediaItem(
        url:
            'https://devstreaming-cdn.apple.com/videos/streaming/examples/img_bipbop_adv_example_fmp4/master.m3u8',
        type: MediaSourceType.hls,
        // title: 'Big Buck Bunny Test',
        id: '${DateTime.now().millisecondsSinceEpoch}',
        //url: '',
      ),
    );

    //[https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4](https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4)

    // 3️⃣ Start playback
    await _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('StoriPicha Player Example 🎬')),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: StoriPichaPlayer(controller: _controller),
          ),
          const SizedBox(height: 20),

          // 🎛️ Listen to controller state updates
          ValueListenableBuilder<PlayerStateSnapshot>(
            valueListenable: _controller,
            builder: (context, snapshot, child) {
              return Row(
                spacing: 10,
                children: [
                  // Play / Pause Icon Button
                  IconButton(
                    icon: Icon(
                      snapshot.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                    onPressed: () {
                      snapshot.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    },
                  ),
                  // Progress Slider
                  Expanded(
                    child: Slider(
                      value: snapshot.position.inMilliseconds.toDouble(),
                      max: snapshot.duration.inMilliseconds.toDouble(),
                      onChanged: (value) {
                        _controller.seekTo(
                          Duration(milliseconds: value.toInt()),
                        );
                      },
                    ),
                  ),

                  Text(
                    '${snapshot.position.inSeconds} / ${snapshot.duration.inSeconds}',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
