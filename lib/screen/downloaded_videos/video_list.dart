import 'dart:async';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
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

    task();
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
      final result = downloadsListMaps
          .firstWhere((element) => element['id'] == task.taskId, orElse: () {
        return {};
      });
      print(result);
      if (result.isNotEmpty) {
        downloadsListMaps.remove(result);
      }
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
    // Timer.periodic(Duration(seconds: 5), (timer) {
    //   task();
    // });
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
                child: downloadsListMaps.length == 0
                    ? Center(
                        child: Text(
                        "No Downloads yet",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Nunito",
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ))
                    : ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          Map _map = downloadsListMaps[index];
                          String _filename = _map['filename'] ?? '';
                          int progress = _map['progress'];
                          if (progress != 100) task();
                          DownloadTaskStatus status = _map['status'];
                          String id = _map['id'];
                          String _savedDirectory = _map['savedDirectory'];
                          return Card(
                            elevation: 10,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  isThreeLine: false,
                                  title: Text(_filename),
                                  subtitle: downloadStatusWidget(status),
                                  trailing: SizedBox(
                                    child: buttons(status, id, index),
                                    width: 60,
                                  ),
                                ),
                                status == DownloadTaskStatus.complete
                                    ? Container()
                                    : SizedBox(height: 5),
                                status == DownloadTaskStatus.complete
                                    ? Container()
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text('$progress%'),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child:
                                                        LinearProgressIndicator(
                                                  value: progress / 100,
                                                ))
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                SizedBox(height: 10)
                              ],
                            ),
                          );
                        },
                        itemCount: downloadsListMaps.length,
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

  Widget buttons(DownloadTaskStatus status, String taskId, int index) {
    void changeTaskID(String taskid, String newTaskID) {
      Map task = downloadsListMaps.firstWhere(
        (element) => element['taskId'] == taskId,
        orElse: () => {},
      );
      task['taskId'] = newTaskID;
      setState(() {});
    }

    return status == DownloadTaskStatus.canceled
        ? GestureDetector(
            onTap: () {
              FlutterDownloader.retry(taskId: taskId)
                  .then((newTaskId) => changeTaskID(taskId, newTaskId!));
            },
            child: Icon(Icons.cached, size: 20, color: Colors.green))
        : status == DownloadTaskStatus.failed
            ? GestureDetector(
                onTap: () {
                  FlutterDownloader.retry(taskId: taskId).then((newTaskID) {
                    changeTaskID(taskId, newTaskID!);
                  });
                },
                child: Icon(Icons.cached, size: 20, color: Colors.green))
            : status == DownloadTaskStatus.paused
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          FlutterDownloader.resume(taskId: taskId)
                              .then((newTaskId) {
                            changeTaskID(taskId, newTaskId!);
                          });
                        },
                        child: Icon(Icons.play_arrow,
                            size: 20, color: Colors.blue),
                      ),
                      GestureDetector(
                          onTap: () {
                            FlutterDownloader.cancel(taskId: taskId);
                          },
                          child:
                              Icon(Icons.close, size: 20, color: Colors.red)),
                    ],
                  )
                : status == DownloadTaskStatus.running
                    ? Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            child: Icon(Icons.pause,
                                size: 20, color: Colors.green),
                            onTap: () {
                              FlutterDownloader.pause(taskId: taskId);
                            },
                          ),
                          GestureDetector(
                              onTap: () {
                                FlutterDownloader.cancel(taskId: taskId);
                              },
                              child: Icon(Icons.close,
                                  size: 20, color: Colors.red)),
                        ],
                      )
                    : status == DownloadTaskStatus.complete
                        ? GestureDetector(
                            onTap: () {
                              downloadsListMaps.removeAt(index);
                              FlutterDownloader.remove(
                                  taskId: taskId, shouldDeleteContent: true);
                              setState(() {});
                            },
                            child:
                                Icon(Icons.delete, size: 20, color: Colors.red))
                        : Container();
  }

  Widget downloadStatusWidget(DownloadTaskStatus status) {
    return status == DownloadTaskStatus.canceled
        ? const Text('Download canceled')
        : status == DownloadTaskStatus.complete
            ? const Text('Download Completed')
            : status == DownloadTaskStatus.failed
                ? const Text('Download failed')
                : status == DownloadTaskStatus.paused
                    ? const Text('Download paused')
                    : status == DownloadTaskStatus.running
                        ? const Text('Downloading...')
                        : const Text('Download waiting');
  }
}
