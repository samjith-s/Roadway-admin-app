import 'package:admin/core/constants/colors.dart';
import 'package:admin/view/videos/screens/video_details_show_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoGridViewItemGrid extends StatefulWidget {
  const VideoGridViewItemGrid({
    Key? key,
  }) : super(key: key);

  @override
  State<VideoGridViewItemGrid> createState() => _VideoGridViewItemGridState();
}

class _VideoGridViewItemGridState extends State<VideoGridViewItemGrid> {
  late VideoPlayerController _videoPlayerController;
  String _videoUrl = 'lib/core/assets/videos/video1.mp4';
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(
      _videoUrl,
    )
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize().then((value) => setState(() {}));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController.value.isInitialized
        ? GestureDetector(
            onTap: (() {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) =>
                      ShowVideoDetailsScreen(videoUrl: _videoUrl)),
                ),
              );
            }),
            child: Container(
              decoration: const BoxDecoration(
                color: kGreen,
              ),
              child: VideoPlayer(_videoPlayerController),
            ),
          )
        : Container(
            color: kGray,
          );
  }
}
