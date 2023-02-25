import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
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
  // static void downloadCallback(
  //     String id, DownloadTaskStatus status, int progress) {
  //   final SendPort? send =
  //       IsolateNameServer.lookupPortByName('downloader_send_port');
  //   send!.send([id, status, progress]);
  // }

  final videoListController = Get.put(VideoListController());
  late Box<VideoListModel> videoBox;

  List<Map> downloadsListMaps = [];
  ReceivePort port = ReceivePort();

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    videoBox = Hive.box<VideoListModel>('video_list');

    // task();
    // bindBackgroundIsolate();
    // FlutterDownloader.registerCallback(downloadCallback);
  }

  Future task() async {
    List<DownloadTask>? getTasks = await FlutterDownloader.loadTasks();
    getTasks!.forEach((task) {
      Map map = {};
      map['status'] = task.status;
      map['progress'] = task.progress;
      map['id'] = task.taskId;
      map['filename'] = task.filename;
      map['savedDirectory'] = task.savedDir;
      downloadsListMaps.add(map);
    });
    setState(() {});
  }

  void bindBackgroundIsolate() {
    bool isSuccess = IsolateNameServer.registerPortWithName(
        port.sendPort, 'downloader_send_port');
    if (!isSuccess) {
      unbindBackgroundIsolate();
      bindBackgroundIsolate();
      return;
    }
    port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      var task = downloadsListMaps.where((element) => element['id'] == id);
      task.forEach((element) {
        element['progress'] = progress;
        element['status'] = status;
        setState(() {});
      });
    });
  }

  void unbindBackgroundIsolate() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

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
                Get.back();
                // Get.off(Dashboard());
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
            Visibility(
              // visible: false,
              child: SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    title: Text('Heading'),
                  ),
                  itemCount: 3,
                ),
              ),
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
