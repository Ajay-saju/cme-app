import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/login/login_controller.dart';
import 'package:hslr/screen/member_details/member_controller.dart';
import 'package:hslr/screen/quiz/question.dart';
import 'package:hslr/screen/videoplayerwidget/videoplayerwidget.dart';
import 'package:video_player/video_player.dart';

class Onlinecmeprogram extends StatefulWidget {
  const Onlinecmeprogram({Key? key}) : super(key: key);

  @override
  State<Onlinecmeprogram> createState() => _OnlinecmeprogramState();
}

class _OnlinecmeprogramState extends State<Onlinecmeprogram> {
  MemberDetailsController mebController = Get.put(MemberDetailsController());

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
    controller = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.pause());

    controller1 = VideoPlayerController.asset(asset1)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.pause());

    controller2 = VideoPlayerController.asset(asset2)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => controller!.pause());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("screen_width:${context.width}");
    return GetBuilder<MemberDetailsController>(
      builder: ((_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white, //Color(0xff63c3fe),
            body: SafeArea(
                child: Center(
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
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Container(
                            // color: Colors.amber,
                            decoration: BoxDecoration(
                                color:
                                    Color(0xffDC3638), // Colors.orange,//E0C152
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),

                            width: context.width > 410
                                ? context.width * 0.45
                                : context.width * 0.4,
                            height: 40,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  // Initial Value
                                  value: mebController.speciality,
                                  hint: Text(
                                    "Select Speciality",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Nunito",
                                        fontSize:
                                            context.width > 410 ? 15 : 13),
                                  ),

                                  // Down Arrow Icon
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 0.0),
                                    child: Image.asset(
                                      'assets/gg.png',
                                      height: 10,
                                    ),
                                  ),

                                  // Array list of items
                                  items: mebController.specialitylist
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Color(
                                                  0xff2D2D2D)) //Color(0xff4169e1)),#
                                          ),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    mebController.speciality = newValue;
                                    mebController.update();
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                          child: Container(
                            width: context.width > 410
                                ? context.width * 0.45
                                : context.width * 0.4,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xffDC3638), //
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15.0, right: 10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  // Initial Value
                                  value: mebController.program,
                                  hint: Text(
                                    "Program Name",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        color: Colors.white,
                                        fontSize:
                                            context.width > 410 ? 15 : 13),
                                  ),

                                  // Down Arrow Icon
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Image.asset(
                                      'assets/gg.png',
                                      height: 10,
                                    ),
                                  ),

                                  // Array list of items
                                  items: mebController.programlist
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Color(
                                                  0xff2D2D2D)) //Color(0xff4169e1)),#
                                          ),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      mebController.program = newValue;
                                      mebController.update();
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
                  Container(
                    // color: Colors.amber,
                    height: context.width > 410
                        ? context.height * 0.62
                        : context.height * 0.59,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              height: context.width > 410
                                  ? context.height * 0.45
                                  : context.height * 0.502,
                              width: context.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              margin: EdgeInsets.only(
                                left: 0.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(AssetPlayerWidget());
                                    },
                                    child: Container(
                                      // margin: EdgeInsets.all(2.0),
                                      height: context.height * 0.19,
                                      // width: context.width * 0.794,
                                      // decoration: BoxDecoration,
                                      // color: Colors.amber,
                                      child: Stack(children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            ),
                                            child: VideoPlayer(controller!)),
                                        Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0.0),
                                            child: Image.asset(
                                              'assets/cme logo 1.png',
                                              // color: Colors.black,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, top: 5),
                                    child: Text(
                                      'Evidence Based Medicines',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Credit Points:',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.blue.shade700,
                                          ),
                                        ),
                                        Text(
                                          '1 Duration:0.45 hrs',
                                          style: TextStyle(
                                            fontSize: 15,
                                            // color: Colors.blue.shade700, 1 Duration:0.45 hrs
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Speaker Name:',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.blue.shade700,
                                          ),
                                        ),
                                        Text(
                                          'Dr Lakshman',
                                          style: TextStyle(
                                            fontSize: 15,
                                            // color: Colors.blue.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Approved by Karnataka Medical',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Council',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Buy Videos @ 600 + 18% GST/-',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Score Point',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Get.offAll(Question(
                                            isGoingtoTest: false,
                                          ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(
                                                0xffE0C152), // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                        child: Text(
                                          "Take Test",
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ),
                                  // ElevatedButton(
                                  //     onPressed: () {
                                  //       Get.to(Question());
                                  //     },
                                  //     style: ElevatedButton.styleFrom(
                                  //         primary: Color.fromARGB(255, 218, 206, 37),
                                  //         shape: RoundedRectangleBorder(
                                  //           borderRadius: BorderRadius.circular(15),
                                  //         )),
                                  //     child: Text("Take Test")),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Opacity(
                              opacity: 0.6,
                              child: Container(
                                height: context.width > 410
                                    ? context.height * 0.45
                                    : context.height * 0.502,
                                width: context.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  // color: Colors.amber.withOpacity(1.5),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(AssetPlayerWidget1());
                                      },
                                      child: Container(
                                        height: context.height * 0.19,
                                        width: context.width * 0.794,
                                        // color: Colors.amber,
                                        child: Stack(children: [
                                          ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                              child: VideoPlayer(controller1!)),
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0),
                                              child: Image.asset(
                                                'assets/cme logo 1.png',
                                                // color: Colors.black,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, top: 5),
                                      child: Text(
                                        'Evidence Based Medicines',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Credit Points:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.blue.shade700,
                                            ),
                                          ),
                                          Text(
                                            '1 Duration:0.45 hrs',
                                            style: TextStyle(
                                              fontSize: 15,
                                              // color: Colors.blue.shade700, 1 Duration:0.45 hrs
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Speaker Name:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.blue.shade700,
                                            ),
                                          ),
                                          Text(
                                            'Dr Lakshman',
                                            style: TextStyle(
                                              fontSize: 15,
                                              // color: Colors.blue.shade700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Approved by Karnataka Medical',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Council',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Buy Videos @ 600 + 18% GST/-',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Score Point',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(
                                                  0xffE0C152), //Color.fromARGB(255, 218, 206, 37),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              )),
                                          child: Text(
                                            "Buy Now",
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    ),
                                    // ElevatedButton(
                                    //     onPressed: () {
                                    //       Get.to(Question());
                                    //     },
                                    //     style: ElevatedButton.styleFrom(
                                    //         primary: Color.fromARGB(255, 218, 206, 37),
                                    //         shape: RoundedRectangleBorder(
                                    //           borderRadius: BorderRadius.circular(15),
                                    //         )),
                                    //     child: Text("Take Test")),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Opacity(
                              opacity: 0.6,
                              child: Container(
                                height: context.width > 410
                                    ? context.height * 0.45
                                    : context.height * 0.502,
                                width: context.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                margin: EdgeInsets.only(left: 0.0, right: 0.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(AssetPlayerWidget2());
                                      },
                                      child: Container(
                                        height: context.height * 0.19,
                                        width: context.width * 0.794,
                                        // color: Colors.amber,
                                        child: Stack(children: [
                                          ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10.0),
                                                topRight: Radius.circular(10.0),
                                              ),
                                              child: VideoPlayer(controller2!)),
                                          Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 0.0),
                                              child: Image.asset(
                                                'assets/cme logo 1.png',
                                                // color: Colors.black,
                                                height: 60,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5.0, top: 5),
                                      child: Text(
                                        'Evidence Based Medicines',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Credit Points:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.blue.shade700,
                                            ),
                                          ),
                                          Text(
                                            '1 Duration:0.45 hrs',
                                            style: TextStyle(
                                              fontSize: 15,
                                              // color: Colors.blue.shade700, 1 Duration:0.45 hrs
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Speaker Name:',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.blue.shade700,
                                            ),
                                          ),
                                          Text(
                                            'Dr Lakshman',
                                            style: TextStyle(
                                              fontSize: 15,
                                              // color: Colors.blue.shade700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Approved by Karnataka Medical',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Council',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Buy Videos @ 600 + 18% GST/-',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5.0),
                                      child: Text(
                                        'Score Point',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.blue.shade700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                              primary: Color(
                                                  0xffE0C152), //Color.fromARGB(255, 218, 206, 37),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              )),
                                          child: Text(
                                            "Buy Now",
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Container(
                              height: context.width > 410
                                  ? context.height * 0.45
                                  : context.height * 0.502,
                              width: context.width * 0.8,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                ),
                              ),
                              margin: EdgeInsets.only(left: 0.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(AssetPlayerWidget());
                                    },
                                    child: Container(
                                      height: context.height * 0.19,
                                      width: context.width * 0.794,
                                      // color: Colors.amber,
                                      child: Stack(children: [
                                        ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10.0),
                                              topRight: Radius.circular(10.0),
                                            ),
                                            child: VideoPlayer(controller!)),
                                        Center(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 0.0),
                                            child: Image.asset(
                                              'assets/cme logo 1.png',
                                              // color: Colors.black,
                                              height: 60,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5.0, top: 5),
                                    child: Text(
                                      'Evidence Based Medicines',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Credit Points:',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.blue.shade700,
                                          ),
                                        ),
                                        Text(
                                          '1 Duration:0.45 hrs',
                                          style: TextStyle(
                                            fontSize: 15,
                                            // color: Colors.blue.shade700, 1 Duration:0.45 hrs
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Speaker Name:',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.blue.shade700,
                                          ),
                                        ),
                                        Text(
                                          'Dr Lakshman',
                                          style: TextStyle(
                                            fontSize: 15,
                                            // color: Colors.blue.shade700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Approved by Karnataka Medical',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Council',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Buy Videos @ 600 + 18% GST/-',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Text(
                                      'Score Point',
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.blue.shade700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Get.to(Question(
                                            isGoingtoTest: false,
                                          ));
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Color(
                                                0xffE0C152), // Colors.orange,//// Color.fromARGB(255, 218, 206, 37),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            )),
                                        child: Text(
                                          "Take Test",
                                          style: TextStyle(
                                            fontFamily: "Nunito",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )),
                                  ),
                                  // ElevatedButton(
                                  //     onPressed: () {
                                  //       Get.to(Question());
                                  //     },
                                  //     style: ElevatedButton.styleFrom(
                                  //         primary: Color.fromARGB(255, 218, 206, 37),
                                  //         shape: RoundedRectangleBorder(
                                  //           borderRadius: BorderRadius.circular(15),
                                  //         )),
                                  //     child: Text("Take Test")),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Showing 3 of 3 Entries',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Nunito",
                        // color: Colors.blue.shade700,
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
        );
      }),
    );
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
