import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram_controller.dart';
import 'package:hslr/screen/online_cmeprog/video_player_screen.dart';

class SampleDart extends StatefulWidget {
  const SampleDart({Key? key}) : super(key: key);

  @override
  State<SampleDart> createState() => _SampleDartState();
}

class _SampleDartState extends State<SampleDart> {
  CmeProgramController cmeProgramController = Get.put(CmeProgramController());

  @override
  void initState() {}

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
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
                            child: ListView.separated(
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
                                                          fontFamily: "Nunito",
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
                                                          fontFamily: "Nunito",
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
                                                          fontFamily: "Nunito",
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
                                                          fontFamily: "Nunito",
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
                                                          fontFamily: "Nunito",
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
                                                          fontFamily: "Nunito",
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
                                                          fontFamily: "Nunito",
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
                                                          fontFamily: "Nunito",
                                                        ),
                                                      ),
                                                    ])
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.center,
                                            //   children: [
                                            //     ElevatedButton(
                                            //       onPressed: () async {
                                            //         cmeProgramController
                                            //             .getAllQuestionsData(
                                            //                 cmeProgramController
                                            //                     .allCmeVideos
                                            //                     .value!
                                            //                     .videoList![
                                            //                         index]
                                            //                     .videoId);
                                            //       },
                                            //       child:
                                            //           Text('    Take Test    '),
                                            //       style:
                                            //           ElevatedButton.styleFrom(
                                            //               backgroundColor:
                                            //                   Colors.black87,
                                            //               // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                                            //               shape:
                                            //                   RoundedRectangleBorder(
                                            //                 borderRadius:
                                            //                     BorderRadius
                                            //                         .circular(
                                            //                             15),
                                            //               )),
                                            //     ),
                                            //     SizedBox(
                                            //       width: 10,
                                            //     ),
                                            //     ElevatedButton(
                                            //       onPressed: () {
                                            //         Get.defaultDialog(
                                            //             title: 'Download',
                                            //             middleText:
                                            //                 'Do you want to download this video ?',
                                            //             middleTextStyle:
                                            //                 TextStyle(
                                            //                     fontFamily:
                                            //                         "Nunito",
                                            //                     color: Colors
                                            //                         .black87),
                                            //             titleStyle: TextStyle(
                                            //                 fontFamily:
                                            //                     "Nunito",
                                            //                 color:
                                            //                     Colors.black87),
                                            //             actions: [
                                            //               Row(
                                            //                 mainAxisAlignment:
                                            //                     MainAxisAlignment
                                            //                         .spaceAround,
                                            //                 children: [
                                            //                   ElevatedButton(
                                            //                     onPressed: () {
                                            //                       Get.back();
                                            //                     },
                                            //                     child: Text(
                                            //                         'Cancel'),
                                            //                     style: ElevatedButton
                                            //                         .styleFrom(
                                            //                             backgroundColor:
                                            //                                 Colors
                                            //                                     .black87,
                                            //                             // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                                            //                             shape:
                                            //                                 RoundedRectangleBorder(
                                            //                               borderRadius:
                                            //                                   BorderRadius.circular(15),
                                            //                             )),
                                            //                   ),
                                            //                   ElevatedButton(
                                            //                     onPressed:
                                            //                         () {},
                                            //                     child:
                                            //                         Text('Ok'),
                                            //                     style: ElevatedButton
                                            //                         .styleFrom(
                                            //                             backgroundColor:
                                            //                                 Colors
                                            //                                     .black87,
                                            //                             // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                                            //                             shape:
                                            //                                 RoundedRectangleBorder(
                                            //                               borderRadius:
                                            //                                   BorderRadius.circular(15),
                                            //                             )),
                                            //                   )
                                            //                 ],
                                            //               )
                                            //             ]);
                                            //       },
                                            //       child: Text('Download Video'),
                                            //       style:
                                            //           ElevatedButton.styleFrom(
                                            //               backgroundColor:
                                            //                   Colors.black87,
                                            //               // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                                            //               shape:
                                            //                   RoundedRectangleBorder(
                                            //                 borderRadius:
                                            //                     BorderRadius
                                            //                         .circular(
                                            //                             15),
                                            //               )),
                                            //     ),
                                            //   ],
                                            // ),
                                            // Positioned(
                                            //   bottom: 3,
                                            //   left: 10,
                                            //   child: Column(
                                            //     children: [
                                            //       SizedBox(
                                            //         height: 1.5,
                                            //       ),
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                separatorBuilder: (context, index) => Container(
                                      height: 20,
                                    ),
                                itemCount: cmeProgramController
                                    .allCmeVideos.value!.videoList!.length),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ));
        }),
      ),
    );
    //   }),
    // );
  }

//
}
