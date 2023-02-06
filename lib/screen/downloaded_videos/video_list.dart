import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/downloaded_videos/video_list_controller.dart';
import '../online_cmeprog/local_database/video_list_model.dart';

class VideoListScreen extends StatefulWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  State<VideoListScreen> createState() => _VideoListScreenState();
}

class _VideoListScreenState extends State<VideoListScreen> {
  final videoListController = Get.put(VideoListController());
  late Box<VideoListModel> videoBox;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    videoBox = Hive.box<VideoListModel>('video_list');
    // FlutterDownloader.registerCallback(downloadCallback, step: 1);
    // videoListController.prepare();
  }

  @pragma('vm:entry-point')
  // static void downloadCallback(
  //   String id,
  //   // DownloadTaskStatus status,
  //   int progress,
  // ) {
  //   print(
  //     'Callback on background isolate: '
  //     'task ($id) is in status ($status) and process ($progress)',
  //   );

  //   print(status.toString());

  //   IsolateNameServer.lookupPortByName('downloader_send_port')
  //       ?.send([id, status, progress]);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Container(
              height: 2,
              color: Colors.black,
            ),
            InkWell(
              onTap: () {
                Get.off(Dashboard());
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/R.png',
                        height: 15,
                        width: 20,
                        fit: BoxFit.cover,
                      ),
                      // Spacer(),
                      const SizedBox(
                        width: 25,
                      ),
                      const Text(
                        "Your Videos",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Nunito",
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 2,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              builder: (BuildContext context, Box<VideoListModel> item, _) {
                List<int> keys = item.keys.cast<int>().toList();
                return videoBox.isEmpty
                    ? Center(
                        child: Text(
                          'You dont have any videos ',
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Nunito",
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final key = keys[index];

                          final VideoListModel? _item = item.get(key);

                          return Container(
                            child: Text('video Container'),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: keys.length);
              },
              valueListenable: videoBox.listenable(),
            )
          ],
        ),
      )),
    );
  }
}
