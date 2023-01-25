import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram_controller.dart';
import 'package:hslr/screen/online_cmeprog/video_player_screen.dart';
import 'package:hslr/screen/videoplayerwidget/videoplayerwidget.dart';
import 'package:video_player/video_player.dart';

class Onlinecmeprogram extends StatefulWidget {
  const Onlinecmeprogram({Key? key}) : super(key: key);

  @override
  State<Onlinecmeprogram> createState() => _OnlinecmeprogramState();
}

class _OnlinecmeprogramState extends State<Onlinecmeprogram> {
  CmeProgramController cmeProgramController = Get.put(CmeProgramController());

  final asset = 'assets/1.mp4';
  final asset1 = 'assets/2.mp4';
  final asset2 = 'assets/3.mp4';

  VideoPlayerController? controller;
  VideoPlayerController? controller1;
  VideoPlayerController? controller2;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    //  cmeProgramController.allCmeVideos();
    // controller = VideoPlayerController.asset(asset)
    //   ..addListener(() => setState(() {}))
    //   ..setLooping(true)
    //   ..initialize().then((_) => controller!.pause());

    // controller1 = VideoPlayerController.asset(asset1)
    //   ..addListener(() => setState(() {}))
    //   ..setLooping(true)
    //   ..initialize().then((_) => controller!.pause());

    // controller2 = VideoPlayerController.asset(asset2)
    //   ..addListener(() => setState(() {}))
    //   ..setLooping(true)
    //   ..initialize().then((_) => controller!.pause());
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose

  //   super.dispose();
  //   controller!.dispose();
  // }

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
                                        child: InkWell(
                                          onTap: () => Get.to(VideoPlayerPage(
                                            index: index,
                                          )),
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
                                                      Container(
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Duration :',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "Nunito",
                                                          ),
                                                        ),
                                                        Text(
                                                          'Credit Point :',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "Nunito",
                                                          ),
                                                        ),
                                                        Text(
                                                          'Speaker :',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "Nunito",
                                                          ),
                                                        ),
                                                        Text(
                                                          'Approved by :',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                "Nunito",
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
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
                                                        Text(
                                                          "${cmeProgramController.allCmeVideos.value!.videoList![index].creditPoint} Credit Point",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                "Nunito",
                                                          ),
                                                        ),
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
                                                        Text(
                                                          "Karnataka Medical Council",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                "Nunito",
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
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
                                                      child: Text('Take Test'),
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
                                                      onPressed: () {},
                                                      child:
                                                          Text('    Buy    '),
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
                                                    )
                                                  ],
                                                ),

                                                // Row(
                                                //   children: [
                                                //     Column(
                                                //       children: [
                                                //         // Padding(
                                                //         //   padding:
                                                //         //       const EdgeInsets
                                                //         //               .only(
                                                //         //           left: 8,
                                                //         //           right: 8),
                                                //         //   child: Text(
                                                //         //     "${cmeProgramController.allCmeVideos.value!.videoList![index].videoTimingHour} h",
                                                //         //     style: TextStyle(
                                                //         //       // fontSize: 18,
                                                //         //       fontWeight:
                                                //         //           FontWeight
                                                //         //               .bold,
                                                //         //       fontFamily:
                                                //         //           "Nunito",
                                                //         //       // color: Colors.blue.shade700,
                                                //         //     ),
                                                //         //   ),
                                                //         // ),
                                                //         SizedBox(
                                                //           height: 8,
                                                //         ),
                                                //         // Text(
                                                //         //   "${cmeProgramController.allCmeVideos.value!.videoList![index].creditPoint} Credit\n Point",
                                                //         //   style: TextStyle(
                                                //         //     fontWeight:
                                                //         //         FontWeight.w500,
                                                //         //     fontFamily:
                                                //         //         "Nunito",
                                                //         //   ),
                                                //         // ),
                                                //       ],
                                                //     ),
                                                //     SizedBox(
                                                //       width: 5,
                                                //     ),
                                                //     Padding(
                                                //       padding:
                                                //           const EdgeInsets.only(
                                                //               top: 15),
                                                //       child: Column(
                                                //         crossAxisAlignment:
                                                //             CrossAxisAlignment
                                                //                 .start,
                                                //         children: [
                                                //           // Container(
                                                //           //   width:
                                                //           //       context.width *
                                                //           //           0.49,
                                                //           //   child: Text(
                                                //           //     cmeProgramController
                                                //           //         .allCmeVideos
                                                //           //         .value!
                                                //           //         .videoList![
                                                //           //             index]
                                                //           //         .videoName
                                                //           //         .toString(),
                                                //           //     maxLines: 2,
                                                //           //     overflow:
                                                //           //         TextOverflow
                                                //           //             .fade,
                                                //           //     style: TextStyle(
                                                //           //       fontSize: 18,
                                                //           //       fontWeight:
                                                //           //           FontWeight
                                                //           //               .bold,
                                                //           //       fontFamily:
                                                //           //           "Nunito",
                                                //           //     ),
                                                //           //   ),
                                                //           // ),
                                                //           SizedBox(
                                                //             height: 8,
                                                //           ),
                                                //           Text(
                                                //             'For all ${cmeProgramController.allCmeVideos.value!.videoList![index].speakerSpecialty} Practitioner',
                                                //             overflow:
                                                //                 TextOverflow
                                                //                     .fade,
                                                //             maxLines: 1,
                                                //             style: TextStyle(
                                                //               fontSize: 16,
                                                //               fontFamily:
                                                //                   "Nunito",
                                                //             ),
                                                //           ),
                                                //           SizedBox(
                                                //             height: 8,
                                                //           ),
                                                //           Text(
                                                //             "Speaker : ${cmeProgramController.allCmeVideos.value!.videoList![index].speakerName}"
                                                //                 .toString(),
                                                //             style: TextStyle(
                                                //               fontSize: 15,
                                                //               // fontWeight:
                                                //               //     FontWeight.bold,
                                                //               fontFamily:
                                                //                   "Nunito",
                                                //             ),
                                                //           ),
                                                //           SizedBox(
                                                //             height: 8,
                                                //           ),

                                                //           SizedBox(
                                                //             height: 8,
                                                //           ),
                                                //           Text(
                                                //             "Approved by : Karnataka Medical Council",
                                                //             style: TextStyle(
                                                //               fontWeight:
                                                //                   FontWeight
                                                //                       .w500,
                                                //               fontFamily:
                                                //                   "Nunito",
                                                //             ),
                                                //           ),

                                                //           // SizedBox(
                                                //           //   height: 5,
                                                //           // ),

                                                //         ],
                                                //       ),
                                                //     ),
                                                //     Spacer(),
                                                //   ],
                                                // ),
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
                                      ),
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        height: 20,
                                      ),
                                  itemCount: cmeProgramController
                                      .allCmeVideos.value!.videoList!.length),
                            ),
                          ),

                          // Container(
                          //   // color: Colors.amber,
                          //   height: context.width > 410
                          //       ? context.height * 0.62
                          //       : context.height * 0.59,
                          //   child: SingleChildScrollView(
                          //     scrollDirection: Axis.vertical,
                          //     physics: BouncingScrollPhysics(),
                          //     child: Column(
                          //       children: [
                          //         Center(
                          //           child: Container(
                          //             height: context.width > 410
                          //                 ? context.height * 0.45
                          //                 : context.height * 0.502,
                          //             width: context.width * 0.8,
                          //             decoration: BoxDecoration(
                          //               borderRadius:
                          //                   BorderRadius.all(Radius.circular(10.0)),
                          //               border: Border.all(
                          //                 color: Colors.black,
                          //                 width: 1,
                          //               ),
                          //             ),
                          //             margin: EdgeInsets.only(
                          //               left: 0.0,
                          //             ),
                          //             child: Column(
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 GestureDetector(
                          //                   onTap: () {
                          //                     Get.to(AssetPlayerWidget());
                          //                   },
                          //                   child: Container(
                          //                     // margin: EdgeInsets.all(2.0),
                          //                     height: context.height * 0.19,
                          //                     // width: context.width * 0.794,
                          //                     // decoration: BoxDecoration,
                          //                     // color: Colors.amber,
                          //                     child: Stack(children: [
                          //                       ClipRRect(
                          //                           borderRadius: BorderRadius.only(
                          //                             topLeft: Radius.circular(10.0),
                          //                             topRight: Radius.circular(10.0),
                          //                           ),
                          //                           child: VideoPlayer(controller!)),
                          //                       Center(
                          //                         child: Padding(
                          //                           padding:
                          //                               const EdgeInsets.only(top: 0.0),
                          //                           child: Image.asset(
                          //                             'assets/cme logo 1.png',
                          //                             // color: Colors.black,
                          //                             height: 60,
                          //                             fit: BoxFit.cover,
                          //                           ),
                          //                         ),
                          //                       ),
                          //                     ]),
                          //                   ),
                          //                 ),
                          //                 Container(
                          //                   height: 1,
                          //                   color: Colors.black,
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                       left: 5.0, top: 5),
                          //                   child: Text(
                          //                     'Evidence Based Medicines',
                          //                     style: TextStyle(
                          //                       fontSize: 18,
                          //                       fontWeight: FontWeight.bold,
                          //                       // color: Colors.blue.shade700,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Row(
                          //                     children: [
                          //                       Text(
                          //                         'Credit Points:',
                          //                         style: TextStyle(
                          //                           fontSize: 15,
                          //                           fontWeight: FontWeight.bold,
                          //                           // color: Colors.blue.shade700,
                          //                         ),
                          //                       ),
                          //                       Text(
                          //                         '1 Duration:0.45 hrs',
                          //                         style: TextStyle(
                          //                           fontSize: 15,
                          //                           // color: Colors.blue.shade700, 1 Duration:0.45 hrs
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Row(
                          //                     children: [
                          //                       Text(
                          //                         'Speaker Name:',
                          //                         style: TextStyle(
                          //                           fontSize: 15,
                          //                           fontWeight: FontWeight.bold,
                          //                           // color: Colors.blue.shade700,
                          //                         ),
                          //                       ),
                          //                       Text(
                          //                         'Dr Lakshman',
                          //                         style: TextStyle(
                          //                           fontSize: 15,
                          //                           // color: Colors.blue.shade700,
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 5,
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Text(
                          //                     'Approved by Karnataka Medical',
                          //                     style: TextStyle(
                          //                       fontSize: 15,
                          //                       fontWeight: FontWeight.bold,
                          //                       // color: Colors.blue.shade700,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Text(
                          //                     'Council',
                          //                     style: TextStyle(
                          //                       fontSize: 15,
                          //                       fontWeight: FontWeight.bold,
                          //                       // color: Colors.blue.shade700,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 5,
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Text(
                          //                     'Buy Videos @ 600 + 18% GST/-',
                          //                     style: TextStyle(
                          //                       fontSize: 15,
                          //                       fontWeight: FontWeight.bold,
                          //                       // color: Colors.blue.shade700,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Text(
                          //                     'Score Point',
                          //                     style: TextStyle(
                          //                       fontSize: 15,
                          //                       fontWeight: FontWeight.bold,
                          //                       // color: Colors.blue.shade700,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 10,
                          //                 ),
                          //                 Center(
                          //                   child: ElevatedButton(
                          //                       onPressed: () {
                          //                         Get.offAll(Question(
                          //                           isGoingtoTest: false,
                          //                         ));
                          //                       },
                          //                       style: ElevatedButton.styleFrom(
                          //                           backgroundColor: Colors.black87,
                          //                           // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                          //                           shape: RoundedRectangleBorder(
                          //                             borderRadius:
                          //                                 BorderRadius.circular(15),
                          //                           )),
                          //                       child: Text(
                          //                         "Take Test",
                          //                         style: TextStyle(
                          //                           fontFamily: "Nunito",
                          //                           fontWeight: FontWeight.bold,
                          //                         ),
                          //                       )),
                          //                 ),
                          //                 // ElevatedButton(
                          //                 //     onPressed: () {
                          //                 //       Get.to(Question());
                          //                 //     },
                          //                 //     style: ElevatedButton.styleFrom(
                          //                 //         primary: Color.fromARGB(255, 218, 206, 37),
                          //                 //         shape: RoundedRectangleBorder(
                          //                 //           borderRadius: BorderRadius.circular(15),
                          //                 //         )),
                          //                 //     child: Text("Take Test")),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 20,
                          //         ),
                          //         Center(
                          //           child: Opacity(
                          //             opacity: 0.6,
                          //             child: Container(
                          //               height: context.width > 410
                          //                   ? context.height * 0.45
                          //                   : context.height * 0.502,
                          //               width: context.width * 0.8,
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.all(Radius.circular(10.0)),
                          //                 // color: Colors.amber.withOpacity(1.5),
                          //                 border: Border.all(
                          //                   color: Colors.black,
                          //                   width: 1,
                          //                 ),
                          //               ),
                          //               margin: EdgeInsets.only(left: 0.0),
                          //               child: Column(
                          //                 crossAxisAlignment: CrossAxisAlignment.start,
                          //                 children: [
                          //                   GestureDetector(
                          //                     onTap: () {
                          //                       Get.to(AssetPlayerWidget1());
                          //                     },
                          //                     child: Container(
                          //                       height: context.height * 0.19,
                          //                       width: context.width * 0.794,
                          //                       // color: Colors.amber,
                          //                       child: Stack(children: [
                          //                         ClipRRect(
                          //                             borderRadius: BorderRadius.only(
                          //                               topLeft: Radius.circular(10.0),
                          //                               topRight: Radius.circular(10.0),
                          //                             ),
                          //                             child: VideoPlayer(controller1!)),
                          //                         Center(
                          //                           child: Padding(
                          //                             padding: const EdgeInsets.only(
                          //                                 top: 0.0),
                          //                             child: Image.asset(
                          //                               'assets/cme logo 1.png',
                          //                               // color: Colors.black,
                          //                               height: 60,
                          //                               fit: BoxFit.cover,
                          //                             ),
                          //                           ),
                          //                         ),
                          //                       ]),
                          //                     ),
                          //                   ),
                          //                   Container(
                          //                     height: 1,
                          //                     color: Colors.black,
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(
                          //                         left: 5.0, top: 5),
                          //                     child: Text(
                          //                       'Evidence Based Medicines',
                          //                       style: TextStyle(
                          //                         fontSize: 18,
                          //                         fontWeight: FontWeight.bold,
                          //                         // color: Colors.blue.shade700,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Row(
                          //                       children: [
                          //                         Text(
                          //                           'Credit Points:',
                          //                           style: TextStyle(
                          //                             fontSize: 15,
                          //                             fontWeight: FontWeight.bold,
                          //                             // color: Colors.blue.shade700,
                          //                           ),
                          //                         ),
                          //                         Text(
                          //                           '1 Duration:0.45 hrs',
                          //                           style: TextStyle(
                          //                             fontSize: 15,
                          //                             // color: Colors.blue.shade700, 1 Duration:0.45 hrs
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Row(
                          //                       children: [
                          //                         Text(
                          //                           'Speaker Name:',
                          //                           style: TextStyle(
                          //                             fontSize: 15,
                          //                             fontWeight: FontWeight.bold,
                          //                             // color: Colors.blue.shade700,
                          //                           ),
                          //                         ),
                          //                         Text(
                          //                           'Dr Lakshman',
                          //                           style: TextStyle(
                          //                             fontSize: 15,
                          //                             // color: Colors.blue.shade700,
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     height: 5,
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Text(
                          //                       'Approved by Karnataka Medical',
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         // color: Colors.blue.shade700,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Text(
                          //                       'Council',
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         // color: Colors.blue.shade700,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     height: 5,
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Text(
                          //                       'Buy Videos @ 600 + 18% GST/-',
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         // color: Colors.blue.shade700,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Text(
                          //                       'Score Point',
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         // color: Colors.blue.shade700,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     height: 10,
                          //                   ),
                          //                   Center(
                          //                     child: ElevatedButton(
                          //                         onPressed: () {
                          //                           cmeProgramController.createOrder();
                          //                           // cmeProgramController.isClicked
                          //                           //     ? () {
                          //                           //         print(cmeProgramController
                          //                           //             .isClicked);
                          //                           //         cmeProgramController
                          //                           //             .isClicked = false;
                          //                           //         print(cmeProgramController
                          //                           //             .isClicked);
                          //                           //         cmeProgramController
                          //                           //             .createOrder();
                          //                           //       }
                          //                           //     : null;
                          //                         },
                          //                         style: ElevatedButton.styleFrom(
                          //                             backgroundColor: Colors
                          //                                 .black87, //Color.fromARGB(255, 218, 206, 37),
                          //                             shape: RoundedRectangleBorder(
                          //                               borderRadius:
                          //                                   BorderRadius.circular(15),
                          //                             )),
                          //                         child: Text(
                          //                           "Buy Now",
                          //                           style: TextStyle(
                          //                             fontFamily: "Nunito",
                          //                             fontWeight: FontWeight.bold,
                          //                           ),
                          //                         )),
                          //                   ),
                          //                   // ElevatedButton(
                          //                   //     onPressed: () {
                          //                   //       Get.to(Question());
                          //                   //     },
                          //                   //     style: ElevatedButton.styleFrom(
                          //                   //         primary: Color.fromARGB(255, 218, 206, 37),
                          //                   //         shape: RoundedRectangleBorder(
                          //                   //           borderRadius: BorderRadius.circular(15),
                          //                   //         )),
                          //                   //     child: Text("Take Test")),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 20,
                          //         ),
                          //         Center(
                          //           child: Opacity(
                          //             opacity: 0.6,
                          //             child: Container(
                          //               height: context.width > 410
                          //                   ? context.height * 0.45
                          //                   : context.height * 0.502,
                          //               width: context.width * 0.8,
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.all(Radius.circular(10.0)),
                          //                 border: Border.all(
                          //                   color: Colors.black,
                          //                   width: 1,
                          //                 ),
                          //               ),
                          //               margin: EdgeInsets.only(left: 0.0, right: 0.0),
                          //               child: Column(
                          //                 crossAxisAlignment: CrossAxisAlignment.start,
                          //                 children: [
                          //                   GestureDetector(
                          //                     onTap: () {
                          //                       Get.to(AssetPlayerWidget2());
                          //                     },
                          //                     child: Container(
                          //                       height: context.height * 0.19,
                          //                       width: context.width * 0.794,
                          //                       // color: Colors.amber,
                          //                       child: Stack(children: [
                          //                         ClipRRect(
                          //                             borderRadius: BorderRadius.only(
                          //                               topLeft: Radius.circular(10.0),
                          //                               topRight: Radius.circular(10.0),
                          //                             ),
                          //                             child: VideoPlayer(controller2!)),
                          //                         Center(
                          //                           child: Padding(
                          //                             padding: const EdgeInsets.only(
                          //                                 top: 0.0),
                          //                             child: Image.asset(
                          //                               'assets/cme logo 1.png',
                          //                               // color: Colors.black,
                          //                               height: 60,
                          //                               fit: BoxFit.cover,
                          //                             ),
                          //                           ),
                          //                         ),
                          //                       ]),
                          //                     ),
                          //                   ),
                          //                   Container(
                          //                     height: 1,
                          //                     color: Colors.black,
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(
                          //                         left: 5.0, top: 5),
                          //                     child: Text(
                          //                       'Evidence Based Medicines',
                          //                       style: TextStyle(
                          //                         fontSize: 18,
                          //                         fontWeight: FontWeight.bold,
                          //                         // color: Colors.blue.shade700,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Row(
                          //                       children: [
                          //                         Text(
                          //                           'Credit Points:',
                          //                           style: TextStyle(
                          //                             fontSize: 15,
                          //                             fontWeight: FontWeight.bold,
                          //                             // color: Colors.blue.shade700,
                          //                           ),
                          //                         ),
                          //                         Text(
                          //                           '1 Duration:0.45 hrs',
                          //                           style: TextStyle(
                          //                             fontSize: 15,
                          //                             // color: Colors.blue.shade700, 1 Duration:0.45 hrs
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Row(
                          //                       children: [
                          //                         Text(
                          //                           'Speaker Name:',
                          //                           style: TextStyle(
                          //                             fontSize: 15,
                          //                             fontWeight: FontWeight.bold,
                          //                             // color: Colors.blue.shade700,
                          //                           ),
                          //                         ),
                          //                         Text(
                          //                           'Dr Lakshman',
                          //                           style: TextStyle(
                          //                             fontSize: 15,
                          //                             // color: Colors.blue.shade700,
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     height: 5,
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Text(
                          //                       'Approved by Karnataka Medical',
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         // color: Colors.blue.shade700,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Text(
                          //                       'Council',
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         // color: Colors.blue.shade700,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     height: 5,
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Text(
                          //                       'Buy Videos @ 600 + 18% GST/-',
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         // color: Colors.blue.shade700,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   Padding(
                          //                     padding: const EdgeInsets.only(left: 5.0),
                          //                     child: Text(
                          //                       'Score Point',
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         // color: Colors.blue.shade700,
                          //                       ),
                          //                     ),
                          //                   ),
                          //                   SizedBox(
                          //                     height: 10,
                          //                   ),
                          //                   Center(
                          //                     child: ElevatedButton(
                          //                         onPressed: () {
                          //                           cmeProgramController.createOrder();
                          //                         },
                          //                         style: ElevatedButton.styleFrom(
                          //                             backgroundColor: Colors
                          //                                 .black87, //Color.fromARGB(255, 218, 206, 37),
                          //                             shape: RoundedRectangleBorder(
                          //                               borderRadius:
                          //                                   BorderRadius.circular(15),
                          //                             )),
                          //                         child: Text(
                          //                           "Buy Now",
                          //                           style: TextStyle(
                          //                             fontFamily: "Nunito",
                          //                             fontWeight: FontWeight.bold,
                          //                           ),
                          //                         )),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ),
                          //         SizedBox(
                          //           height: 20,
                          //         ),
                          //         Center(
                          //           child: Container(
                          //             height: context.width > 410
                          //                 ? context.height * 0.45
                          //                 : context.height * 0.502,
                          //             width: context.width * 0.8,
                          //             decoration: BoxDecoration(
                          //               borderRadius:
                          //                   BorderRadius.all(Radius.circular(10.0)),
                          //               border: Border.all(
                          //                 color: Colors.black,
                          //                 width: 1,
                          //               ),
                          //             ),
                          //             margin: EdgeInsets.only(left: 0.0),
                          //             child: Column(
                          //               crossAxisAlignment: CrossAxisAlignment.start,
                          //               children: [
                          //                 GestureDetector(
                          //                   onTap: () {
                          //                     Get.to(AssetPlayerWidget());
                          //                   },
                          //                   child: Container(
                          //                     height: context.height * 0.19,
                          //                     width: context.width * 0.794,
                          //                     // color: Colors.amber,
                          //                     child: Stack(children: [
                          //                       ClipRRect(
                          //                           borderRadius: BorderRadius.only(
                          //                             topLeft: Radius.circular(10.0),
                          //                             topRight: Radius.circular(10.0),
                          //                           ),
                          //                           child: VideoPlayer(controller!)),
                          //                       Center(
                          //                         child: Padding(
                          //                           padding:
                          //                               const EdgeInsets.only(top: 0.0),
                          //                           child: Image.asset(
                          //                             'assets/cme logo 1.png',
                          //                             // color: Colors.black,
                          //                             height: 60,
                          //                             fit: BoxFit.cover,
                          //                           ),
                          //                         ),
                          //                       ),
                          //                     ]),
                          //                   ),
                          //                 ),
                          //                 Container(
                          //                   height: 1,
                          //                   color: Colors.black,
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(
                          //                       left: 5.0, top: 5),
                          //                   child: Text(
                          //                     'Evidence Based Medicines',
                          //                     style: TextStyle(
                          //                       fontSize: 18,
                          //                       fontWeight: FontWeight.bold,
                          //                       // color: Colors.blue.shade700,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Row(
                          //                     children: [
                          //                       Text(
                          //                         'Credit Points:',
                          //                         style: TextStyle(
                          //                           fontSize: 15,
                          //                           fontWeight: FontWeight.bold,
                          //                           // color: Colors.blue.shade700,
                          //                         ),
                          //                       ),
                          //                       Text(
                          //                         '1 Duration:0.45 hrs',
                          //                         style: TextStyle(
                          //                           fontSize: 15,
                          //                           // color: Colors.blue.shade700, 1 Duration:0.45 hrs
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Row(
                          //                     children: [
                          //                       Text(
                          //                         'Speaker Name:',
                          //                         style: TextStyle(
                          //                           fontSize: 15,
                          //                           fontWeight: FontWeight.bold,
                          //                           // color: Colors.blue.shade700,
                          //                         ),
                          //                       ),
                          //                       Text(
                          //                         'Dr Lakshman',
                          //                         style: TextStyle(
                          //                           fontSize: 15,
                          //                           // color: Colors.blue.shade700,
                          //                         ),
                          //                       ),
                          //                     ],
                          //                   ),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 5,
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Text(
                          //                     'Approved by Karnataka Medical',
                          //                     style: TextStyle(
                          //                       fontSize: 15,
                          //                       fontWeight: FontWeight.bold,
                          //                       // color: Colors.blue.shade700,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Text(
                          //                     'Council',
                          //                     style: TextStyle(
                          //                       fontSize: 15,
                          //                       fontWeight: FontWeight.bold,
                          //                       // color: Colors.blue.shade700,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 5,
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Text(
                          //                     'Buy Videos @ 600 + 18% GST/-',
                          //                     style: TextStyle(
                          //                       fontSize: 15,
                          //                       fontWeight: FontWeight.bold,
                          //                       // color: Colors.blue.shade700,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 Padding(
                          //                   padding: const EdgeInsets.only(left: 5.0),
                          //                   child: Text(
                          //                     'Score Point',
                          //                     style: TextStyle(
                          //                       fontSize: 15,
                          //                       fontWeight: FontWeight.bold,
                          //                       // color: Colors.blue.shade700,
                          //                     ),
                          //                   ),
                          //                 ),
                          //                 SizedBox(
                          //                   height: 10,
                          //                 ),

                          //                 Center(
                          //                   child: ElevatedButton(
                          //                       onPressed: () {
                          //                         Get.to(Question(
                          //                           isGoingtoTest: false,
                          //                         ));
                          //                       },
                          //                       style: ElevatedButton.styleFrom(
                          //                           backgroundColor: Colors
                          //                               .black87, // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                          //                           shape: RoundedRectangleBorder(
                          //                             borderRadius:
                          //                                 BorderRadius.circular(15),
                          //                           )),
                          //                       child: Text(
                          //                         "Take Test",
                          //                         style: TextStyle(
                          //                           fontFamily: "Nunito",
                          //                           fontWeight: FontWeight.bold,
                          //                         ),
                          //                       )),
                          //                 ),
                          //                 // ElevatedButton(
                          //                 //     onPressed: () {
                          //                 //       Get.to(Question());
                          //                 //     },
                          //                 //     style: ElevatedButton.styleFrom(
                          //                 //         primary: Color.fromARGB(255, 218, 206, 37),
                          //                 //         shape: RoundedRectangleBorder(
                          //                 //           borderRadius: BorderRadius.circular(15),
                          //                 //         )),
                          //                 //     child: Text("Take Test")),
                          //               ],
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          SizedBox(
                            height: 0,
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
