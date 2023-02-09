import 'dart:isolate';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram_controller.dart';
import 'package:hslr/screen/online_cmeprog/video_player_screen.dart';
import 'package:hslr/screen/videoplayerwidget/videoplayerwidget.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:video_player/video_player.dart';

class Onlinecmeprogram extends StatefulWidget {
  const Onlinecmeprogram({Key? key}) : super(key: key);

  @override
  State<Onlinecmeprogram> createState() => _OnlinecmeprogramState();
}

class _OnlinecmeprogramState extends State<Onlinecmeprogram> {
  CmeProgramController cmeProgramController = Get.put(CmeProgramController());

  ReceivePort _port = ReceivePort();

  @pragma('vm:entry-point')
  static void downloadCallback(
      String id, DownloadTaskStatus status, int progress) 
      {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

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
    super.initState();
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  Future downloadVideo(String url) async {
    var status = Permission.storage.request();
    // if (await status.isGranted) {
    final directory = await getExternalStorageDirectory();
    final taskId = await FlutterDownloader.enqueue(
      url: url,
      headers: {}, // optional: header send with url (auth token etc)
      savedDir: directory!.path,
      showNotification:
          true, // show download progress in status bar (for Android)
      openFileFromNotification:
          true, // click on notification to open downloaded file (for Android)
    );
    // } else {
    //   print('Permission denied');
    // }
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
              child: cmeProgramController.allCmeVideos.value!.videoList == null
                  ? Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.black87,
                      ),
                    )
                  : Center(
                      child: Column(
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
                                          value:
                                              cmeProgramController.speciality,
                                          hint: Text(
                                            "Select Speciality",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Nunito",
                                                fontSize: context.width > 410
                                                    ? 15
                                                    : 13),
                                          ),

                                          // Down Arrow Icon
                                          icon: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 0.0),
                                            child: Image.asset(
                                              'assets/gg.png',
                                              height: 10,
                                            ),
                                          ),

                                          // Array list of items
                                          items: cmeProgramController
                                              .specialitylist
                                              .map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(
                                                          0xff2D2D2D)) //Color(0xff4169e1)),#
                                                  ),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
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
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Image.asset(
                                              'assets/gg.png',
                                              height: 10,
                                            ),
                                          ),

                                          // Array list of items
                                          items: cmeProgramController
                                              .programlist
                                              .map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(
                                                          0xff2D2D2D)) //Color(0xff4169e1)),#
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
                            child: SizedBox(
                              height: context.height,
                              child: ListView.separated(
                                  // physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => Padding(
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
                                                padding: const EdgeInsets.only(
                                                    top: 10, left: 10),
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                        width:
                                                            context.width * .2,
                                                        height: context.height *
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
                                                          const EdgeInsets.only(
                                                              top: 20),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
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
                                                                FontWeight.w500,
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
                                                                FontWeight.bold,
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
                                                                FontWeight.w500,
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
                                                                FontWeight.w500,
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
                                                                FontWeight.w500,
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
                                                              .videoList![index]
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
                                                                FontWeight.w500,
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
                                                                FontWeight.w500,
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
                                                          .getAllQuestionsData(
                                                              cmeProgramController
                                                                  .allCmeVideos
                                                                  .value!
                                                                  .videoList![
                                                                      index]
                                                                  .videoId);
                                                    },
                                                    child: Text(
                                                        '    Take Test    '),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.black87,
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
                                                      Get.defaultDialog(
                                                          title: 'Download',
                                                          middleText:
                                                              'Do you want to download this video ?',
                                                          middleTextStyle:
                                                              TextStyle(
                                                                  fontFamily:
                                                                      "Nunito",
                                                                  color: Colors
                                                                      .black87),
                                                          titleStyle: TextStyle(
                                                              fontFamily:
                                                                  "Nunito",
                                                              color: Colors
                                                                  .black87),
                                                          actions: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceAround,
                                                              children: [
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Get.back();
                                                                  },
                                                                  child: Text(
                                                                      'Cancel'),
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          backgroundColor: Colors
                                                                              .black87,
                                                                          // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                          )),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    // downloadVideo(
                                                                    //   'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
                                                                      // name: cmeProgramController
                                                                      //     .allCmeVideos
                                                                      //     .value!
                                                                      //     .videoList![
                                                                      //         index]
                                                                      //     .videoName
                                                                      //     .toString(),
                                                                    // );
                                                                  },
                                                                  child: Text(
                                                                      'Ok'),
                                                                  style: ElevatedButton
                                                                      .styleFrom(
                                                                          backgroundColor: Colors
                                                                              .black87,
                                                                          // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(15),
                                                                          )),
                                                                )
                                                              ],
                                                            )
                                                          ]);
                                                      // cmeProgramController.requestDownload(
                                                      //     name:
                                                      //         cmeProgramController
                                                      //             .allCmeVideos
                                                      //             .value!
                                                      //             .videoList![
                                                      //                 index]
                                                      //             .videoName
                                                      //             .toString(),
                                                      //     url:
                                                      //         cmeProgramController
                                                      //             .allCmeVideos
                                                      //             .value!
                                                      //             .videoList![
                                                      //                 index]
                                                      //             .videoPath
                                                      //             .toString()
                                                      //             .replaceAll(
                                                      //                 'https',
                                                      //                 'http'));
                                                      // cmeProgramController
                                                      //             .allCmeVideos
                                                      //             .value!
                                                      //             .videoList![
                                                      //                 index]
                                                      //             .isDownloading ??
                                                      //         false
                                                      //     ? cancelDownload(
                                                      //         index)
                                                      //     : cmeProgramController
                                                      //         .getPermission(
                                                      //             index);
                                                    },
                                                    child:
                                                        //  cmeProgramController
                                                        //             .allCmeVideos
                                                        //             .value!
                                                        //             .videoList![
                                                        //                 index]
                                                        //             .isDownloading ??
                                                        //         false
                                                        //     ? Center(
                                                        //         child: Text(
                                                        //             progressString)
                                                        //         //  CircularProgressIndicator(
                                                        //         //     strokeWidth: 2,
                                                        //         //     color: Colors
                                                        //         //   .white,
                                                        //         //   ),
                                                        //         )
                                                        //     :
                                                        Text('Download Video'),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            backgroundColor:
                                                                Colors.black87,
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
                                              Positioned(
                                                bottom: 3,
                                                left: 10,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                      height: 1.5,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        height: 20,
                                      ),
                                  itemCount: cmeProgramController
                                      .allCmeVideos.value!.videoList!.length),
                            ),
                          ),

                          SizedBox(
                            height: 0,
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // SizedBox(
                              //   width: 180,
                              // ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.keyboard_double_arrow_left_rounded,
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.keyboard_arrow_left_rounded,
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xffDC3638),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.keyboard_double_arrow_right_rounded,
                                  color: Colors.white,
                                )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  'Showing 1 of 1 Entries',
                                  style: TextStyle(
                                      fontSize: 14, fontFamily: "Nunito"
                                      // color: Colors.blue.shade700,
                                      ),
                                ),
                                Spacer(),

                                // Padding(
                                //   padding: const EdgeInsets.only(left: 8.0),
                                //   child: Image.asset(
                                //     'assets/hj.png',
                                //     height: 25,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(10.0),
                          //   child: Text(
                          //     'Showing 3 of 3 Entries',
                          //     style: TextStyle(
                          //       fontSize: 18,
                          //       fontFamily: "Nunito",
                          //       // color: Colors.blue.shade700,
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ));
        }),
      ),
    );
    //   }),
    // );
  }

  

//   Future downloadVideo(index) async {

//     cmeProgramController.allCmeVideos.value!.videoList![index].isDownloading =
//         true;

//     var url = cmeProgramController
//         .allCmeVideos.value!.videoList![index].videoPath
//         .toString()
//         .replaceAll('https', 'http');
//     var name =cmeProgramController
//         .allCmeVideos.value!.videoList![index].videoName.toString() ;

//     final dir = await getApplicationDocumentsDirectory();
// //From path_provider package
//     var localPath = dir.path + name;
//     final savedDir = Directory(localPath);
//     await savedDir.create(recursive: true).then((value) async {
//       final taskid = await FlutterDownloader.enqueue(
//         url: 'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
//         fileName: name,
//         savedDir: localPath,
//         showNotification: true,
//         openFileFromNotification: true,
//       );
//       print(taskid);
//     });
//     void listenToProgress() async {
//   FlutterDownloader.registerCallback((id, status, progress) {
//     // Update the progress of the download
//   });
// }

  // Dio dio = Dio();

  // try {
  //   var dir = await getApplicationDocumentsDirectory();
  //   print("path ${dir.path}");
  //   var path = "${dir.path}/$url.mp4";
  //   await dio.download(
  //     url,
  //     path,
  //     cancelToken: cancelToken,
  //     onReceiveProgress: (rec, total) {
  //       print("Rec: $rec , Total: $total");
  //       setState(() {
  //         downloading = true;
  //         progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
  //       });
  //     },
  //   );
  // } catch (e) {
  //   cmeProgramController.allCmeVideos.value!.videoList![index].isDownloading =
  //       false;
  //   print(e);
  // }
  // setState(() {
  //   downloading = false;
  //   progressString = "Completed";
  //   cmeProgramController.allCmeVideos.value!.videoList![index].isDownloading =
  //       false;

  // });
  // print("Download completed");
  // }
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
