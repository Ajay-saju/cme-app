import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController? controller;
  const VideoPlayerWidget({Key? key, @required this.controller})
      : super(key: key);

  Widget buildVideo() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        controller!.value.isPlaying ? controller!.pause() : controller!.play();
      },
      child: Stack(children: [
        buildVideoPlayer(),
        controller!.value.isPlaying
            ? Container()
            : Container(
                alignment: Alignment.center,
                child: const Icon(Icons.play_arrow,
                    color: Colors.white, size: 80)),
        Positioned(
            child: VideoProgressIndicator(
          controller!,
          allowScrubbing: true,
        ))
      ]),
    );
  }

  Widget buildVideoPlayer() => AspectRatio(
      aspectRatio: controller!.value.aspectRatio,
      child: VideoPlayer(controller!));

  @override
  Widget build(BuildContext context) {
    return controller != null && controller!.value.isInitialized
        ? Container(
            alignment: Alignment.topCenter,
            child: buildVideo(),
          )
        : Container(
            height: 200,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
