import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'dart:async';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:hslr/main.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/downloaded_videos/video_list.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram_controller.dart';
import 'package:hslr/screen/online_cmeprog/video_player_screen.dart';
import 'package:hslr/screen/videoplayerwidget/videoplayerwidget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

// Future<bool> isStoragePermission() async => Future.value(
//     await Permission.storage.request().isGranted || await getAndroidSdk());

Future<bool> getAndroidSdk() async {
  bool? isSdkAndroid13 = false;
  if (Platform.isAndroid) {
    AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
    isSdkAndroid13 = androidInfo.version.sdkInt >= 33;
  }
  return isSdkAndroid13;
}

class Onlinecmeprogram extends StatefulWidget {
  const Onlinecmeprogram({Key? key}) : super(key: key);

  @override
  State<Onlinecmeprogram> createState() => _OnlinecmeprogramState();
}

class _OnlinecmeprogramState extends State<Onlinecmeprogram> {
  CmeProgramController cmeProgramController = Get.put(CmeProgramController());

  ReceivePort _port = ReceivePort();

  final ScrollController _scrollController = ScrollController();
  List<String> _data = List.generate(10, (index) => 'Item $index');

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  @override
  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = data[1];
      int progress = data[2];
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);

    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      // Reach the end of the list, load more data
      setState(() {
        _data.addAll(
            List.generate(10, (index) => 'Item ${_data.length + index}'));
      });
    }
  }

  void isDownloadVideo(String videoId) {
    if (sessionlog.containsKey(videoId)) {
    } else {
      Get.defaultDialog(
          title: 'Download',
          middleText: 'Do you want to download this video ?',
          middleTextStyle:
              TextStyle(fontFamily: "Nunito", color: Colors.black87),
          titleStyle: TextStyle(fontFamily: "Nunito", color: Colors.black87),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text('Cancel'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                ),
                ElevatedButton(
                  onPressed: () {
                    downloadVideo(
                      'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
                      // name: cmeProgramController
                      //     .allCmeVideos
                      //     .value!
                      //     .videoList![
                      //         index]
                      //     .videoName
                      //     .toString(),
                    );
                  },
                  child: Text('Ok'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                      // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                )
              ],
            )
          ]);
    }
  }

  Future downloadVideo(String url) async {
    var setting = Platform.isAndroid
        ? await getAndroidSdk()
            ? Permission.photos
            : Permission.storage
        : Permission.photos;
    late Timer _timer;
    // var status = await Permission.storage.request();
    if (await Future.value(setting.isGranted)) {
      final directory = await getApplicationDocumentsDirectory();
      await FlutterDownloader.enqueue(
        url: url,
        headers: {}, // optional: header send with url (auth token etc)
        savedDir: directory.path+'/jhghjgbj',
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
      ).whenComplete(() => Get.to(VideoListScreen()));
    } else {
      final status = await setting.request();
      if (!(status == PermissionStatus.granted)) {
        openAppSettings();
      } else if (status == PermissionStatus.denied) {
        openAppSettings();
      } else if (status == PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var data = cmeProgramController.allCmeVideos.value!.videoList;

    print("screen_width:${context.width}");
    // return GetBuilder<CmeProgramController>(
    //   builder: ((_) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white, //Color(0xff63c3fe),
        body: GetBuilder<CmeProgramController>(builder: (_) {
          return SafeArea(
              child: cmeProgramController.allCmeVideos.value!.videoList ==
                          null &&
                      cmeProgramController.specialtyNames.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.black87,
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                    "Online CME Program",
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
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Center(
                          child: Text(
                            'Search',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Nunito",
                                fontWeight: FontWeight.bold
                                // color: Colors.blue.shade700,
                                ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10.0, right: 10, top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Container(
                                  // color: Colors.amber,
                                  decoration: BoxDecoration(
                                      color: Color(
                                          0xffDC3638), // Colors.orange,//E0C152
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),

                                  width: context.width > 410
                                      ? context.width * 0.45
                                      : context.width * 0.4,
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 10),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        // Initial Value
                                        value: cmeProgramController.speciality,
                                        hint: Text(
                                          "Select Speciality",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Nunito",
                                              fontSize: context.width > 410
                                                  ? 15
                                                  : 13),
                                        ),

                                        icon: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 0.0),
                                          child: Image.asset(
                                            'assets/gg.png',
                                            height: 10,
                                          ),
                                        ),

                                        items: cmeProgramController
                                            .specialtyNames
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items,
                                                style: const TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: "Nunito",
                                                  color: Colors.black,
                                                )

                                                //Color(0xff4169e1)),#
                                                ),
                                          );
                                        }).toList(),

                                        onChanged: (String? newValue) {
                                          cmeProgramController.speciality =
                                              newValue;
                                          cmeProgramController.update();
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, right: 0.0),
                                child: Container(
                                  width: context.width > 410
                                      ? context.width * 0.45
                                      : context.width * 0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Color(0xffDC3638), //
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15.0, right: 10),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        // Initial Value
                                        value: cmeProgramController.program,
                                        hint: Text(
                                          "Program Name",
                                          style: TextStyle(
                                              fontFamily: "Nunito",
                                              color: Colors.white,
                                              fontSize: context.width > 410
                                                  ? 15
                                                  : 13),
                                        ),

                                        // Down Arrow Icon
                                        icon: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Image.asset(
                                            'assets/gg.png',
                                            height: 10,
                                          ),
                                        ),

                                        // Array list of items
                                        items: cmeProgramController.programlist
                                            .map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff2D2D2D),
                                                ) //Color(0xff4169e1)),#
                                                ),
                                          );
                                        }).toList(),
                                        // After selecting the desired option,it will
                                        // change button value to selected value
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            cmeProgramController.program =
                                                newValue;
                                            cmeProgramController.update();
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            height: context.height * 0.045,
                            width: context.width * 0.5,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50.0))),
                            child: Center(
                              child: Text(
                                "Show Result",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Nunito",
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        Expanded(
                          // height: context.height * .5,
                          child: ListView.separated(
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  cmeProgramController
                                              .allCmeVideos.value!.videoList ==
                                          null
                                      ? Center(
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2.5,
                                            color: Colors.black87,
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          child: Container(
                                            height: context.height * .65 / 2,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0)),
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, left: 10),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    // mainAxisAlignment:
                                                    // MainAxisAlignment.start,
                                                    children: [
                                                      InkWell(
                                                        onTap: () => Get.to(
                                                            VideoPlayerPage(
                                                          index: index,
                                                        )),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          5))),
                                                          width: context.width *
                                                              .2,
                                                          height:
                                                              context.height *
                                                                  0.1,
                                                          child: Image.network(
                                                              // 'http://www.emed.co.in/Upload/ChnlPart_HdrFtr/Thumbnails/V201501190947507412111197010.jpeg'
                                                              cmeProgramController
                                                                  .allCmeVideos
                                                                  .value!
                                                                  .videoList![
                                                                      index]
                                                                  .videothambnails
                                                                  .toString()
                                                                  .replaceAll(
                                                                      'https',
                                                                      'http')),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(top: 20),
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              cmeProgramController
                                                                  .allCmeVideos
                                                                  .value!
                                                                  .videoList![
                                                                      index]
                                                                  .videoName
                                                                  .toString(),
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Nunito",
                                                              ),
                                                            ),
                                                            // SizedBox(
                                                            //   height: 8,
                                                            // ),
                                                            Text(
                                                              'For all ${cmeProgramController.allCmeVideos.value!.videoList![index].speakerSpecialty} Practitioner',
                                                              overflow:
                                                                  TextOverflow
                                                                      .fade,
                                                              maxLines: 1,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    "Nunito",
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 16,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15),
                                                  child: Center(
                                                    child: Table(
                                                      columnWidths: {
                                                        0: FlexColumnWidth(0.5),
                                                        1: FlexColumnWidth(0.1),
                                                        3: FlexColumnWidth(2)
                                                      },
                                                      children: [
                                                        TableRow(children: [
                                                          Text(
                                                            'Duration',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  "Nunito",
                                                            ),
                                                          ),
                                                          Text(':',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Nunito",
                                                                  color: Colors
                                                                      .black87)),
                                                          Text(
                                                            "${cmeProgramController.allCmeVideos.value!.videoList![index].videoTimingHour} h",
                                                            style: TextStyle(
                                                              // fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Nunito",
                                                              // color: Colors.blue.shade700,
                                                            ),
                                                          ),
                                                        ]),
                                                        TableRow(children: [
                                                          Text(
                                                            'Credit Point ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  "Nunito",
                                                            ),
                                                          ),
                                                          Text(':',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Nunito",
                                                                  color: Colors
                                                                      .black87)),
                                                          Text(
                                                            "${cmeProgramController.allCmeVideos.value!.videoList![index].creditPoint} Credit Point",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  "Nunito",
                                                            ),
                                                          ),
                                                        ]),
                                                        TableRow(children: [
                                                          Text(
                                                            'Speaker ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  "Nunito",
                                                            ),
                                                          ),
                                                          Text(':',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Nunito",
                                                                  color: Colors
                                                                      .black87)),
                                                          Text(
                                                            cmeProgramController
                                                                .allCmeVideos
                                                                .value!
                                                                .videoList![
                                                                    index]
                                                                .speakerName
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              // fontWeight:
                                                              //     FontWeight.bold,
                                                              fontFamily:
                                                                  "Nunito",
                                                            ),
                                                          ),
                                                        ]),
                                                        TableRow(children: [
                                                          Text(
                                                            'Approved by ',
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  "Nunito",
                                                            ),
                                                          ),
                                                          Text(':',
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      "Nunito",
                                                                  color: Colors
                                                                      .black87)),
                                                          Text(
                                                            "Karnataka Medical Council",
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  "Nunito",
                                                            ),
                                                          ),
                                                        ])
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Spacer(),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () async {
                                                        cmeProgramController
                                                            .createOrder(
                                                                amound: cmeProgramController
                                                                    .allCmeVideos
                                                                    .value!
                                                                    .videoList![
                                                                        index]
                                                                    .videoAmount
                                                                    .toString());

                                                        // Get.to(
                                                        //     TestInstructionScreen(
                                                        //   index: index,
                                                        // ));

                                                        // cmeProgramController
                                                        //     .getAllQuestionsData(
                                                        //         cmeProgramController
                                                        //             .allCmeVideos
                                                        //             .value!
                                                        //             .videoList![
                                                        //                 index]
                                                        //             .videoId);
                                                      },
                                                      child: Text(
                                                          '    Buy Now    '),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .black87,
                                                              // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              )),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        isDownloadVideo(
                                                            cmeProgramController
                                                                .allCmeVideos
                                                                .value!
                                                                .videoList![
                                                                    index]
                                                                .videoId
                                                                .toString());
                                                      },
                                                      child: Text(
                                                          'Download Video'),
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors
                                                                      .black87,
                                                              // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              )),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                              separatorBuilder: (context, index) => Container(
                                    height: 20,
                                  ),
                              itemCount: cmeProgramController.allCmeVideos
                                          .value!.videoList!.length <
                                      10
                                  ? cmeProgramController
                                      .allCmeVideos.value!.videoList!.length
                                  : _data.length),
                        ),
                      ],
                    ));
        }),
      ),
    );
    //   }),
    // );
  }
}

class AssetPlayerWidget extends StatefulWidget {
  const AssetPlayerWidget({Key? key}) : super(key: key);

  @override
  State<AssetPlayerWidget> createState() => _AssetPlayerWidgetState();
}

class _AssetPlayerWidgetState extends State<AssetPlayerWidget> {
  final asset = 'assets/1.mp4';
  final asset1 = 'assets/2.mp4';
  final asset2 = 'assets/3.mp4';

  VideoPlayerController? controller;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: controller);
  }
}

class AssetPlayerWidget1 extends StatefulWidget {
  const AssetPlayerWidget1({Key? key}) : super(key: key);

  @override
  State<AssetPlayerWidget1> createState() => _AssetPlayerWidget1State();
}

class _AssetPlayerWidget1State extends State<AssetPlayerWidget1> {
  // final asset = 'assets/1.mp4';
  final asset = 'assets/2.mp4';
  // final asset2 = 'assets/3.mp4';

  VideoPlayerController? controller;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: controller);
  }
}

class AssetPlayerWidget2 extends StatefulWidget {
  const AssetPlayerWidget2({Key? key}) : super(key: key);

  @override
  State<AssetPlayerWidget2> createState() => _AssetPlayerWidget2State();
}

class _AssetPlayerWidget2State extends State<AssetPlayerWidget2> {
  // final asset = 'assets/1.mp4';
  // final asset1 = 'assets/2.mp4';
  final asset = 'assets/3.mp4';

  VideoPlayerController? controller;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayerWidget(controller: controller);
  }
}
