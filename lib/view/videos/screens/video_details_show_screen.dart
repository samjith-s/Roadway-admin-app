import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ShowVideoDetailsScreen extends StatefulWidget {
  final String videoUrl;
  const ShowVideoDetailsScreen({required this.videoUrl, Key? key})
      : super(key: key);

  @override
  State<ShowVideoDetailsScreen> createState() => _ShowVideoDetailsScreenState();
}

class _ShowVideoDetailsScreenState extends State<ShowVideoDetailsScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoUrl);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((value) => _controller.play());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: GestureDetector(
                      onTap: () => _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play(),
                      child: VideoPlayer(_controller)),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
