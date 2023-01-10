import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram_controller.dart';
import 'package:hslr/screen/quiz/question.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  final index;
  const VideoPlayerPage({Key? key, required this.index}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController videoController;
  final cmeController = Get.find<CmeProgramController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playVideo(init: true, index: widget.index);
  }

  @override
  void dispose() {
    videoController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  var a = Duration(seconds: 5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: context.height * .43,
                  child: videoController.value.isInitialized
                      ? Column(
                          children: [
                            SizedBox(
                              height: 50,
                              child: Center(
                                child: Text(
                                  cmeController.allCmeVideos.value!
                                      .videoList![widget.index].videoName
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 200,
                              child: VideoPlayer(videoController),
                            ),
                            // ValueListenableBuilder(valueListenable: videoController, builder: (context,VideoPlayerValue,child)=>Text(
                            //   videoDuration(value.position),
                            // ))
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: SizedBox(
                                // width: context.width,
                                child: ProgressBar(
                                  onSeek: (a) => videoController.seekTo(a),
                                  baseBarColor: Colors.white60,
                                  thumbRadius: 7,
                                  progress: videoController.value.position,
                                  total: videoController.value.duration,
                                  bufferedBarColor: Colors.white,
                                  barHeight: 2,
                                  thumbColor: Colors.white38,
                                  thumbGlowColor: Colors.white,
                                  timeLabelTextStyle: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: IconButton(
                                  onPressed: () {
                                    videoController.value.isPlaying
                                        ? videoController.pause()
                                        : videoController.play();
                                  },
                                  icon: Icon(
                                    videoController.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 35,
                                  )),
                            )
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1.5,
                          ),
                        )),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  Get.offAll(Question(
                    isGoingtoTest: false,
                  ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
                child: Text(
                  "Take Test",
                  style: TextStyle(
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void playVideo({index, bool init = false}) {
    // if (index < 0 || index > videos.length) return;
    videoController = VideoPlayerController.network(cmeController
            .allCmeVideos.value!.videoList![index].videoPath
            .toString()
            .replaceAll('https', 'http')
        // 'https://www.emed.co.in//Upload//ChnlPart_HdrFtr//V201501190947507412111197010.mp4'
        )
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => videoController.play());
  }
}
