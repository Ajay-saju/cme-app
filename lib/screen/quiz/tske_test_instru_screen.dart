import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram_controller.dart';

class TestInstructionScreen extends StatefulWidget {
  final index;
  const TestInstructionScreen({Key? key, required this.index})
      : super(key: key);

  @override
  State<TestInstructionScreen> createState() => _TestInstructionScreenState();
}

class _TestInstructionScreenState extends State<TestInstructionScreen> {
  final cmeProgramController = Get.find<CmeProgramController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  'ONLINE CME TEST',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      // fontFamily: "Nunito",
                      color: Colors.red),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 230),
                  child: Text(
                    'Instructions :',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        // fontFamily: "Nunito",
                        color: Colors.red),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Table(
                  // defaultVerticalAlignment: TableCellVerticalAlignment.top,
                  columnWidths: const {
                    0: FlexColumnWidth(0.3),
                    1: FlexColumnWidth(4),
                    // 2: FlexColumnWidth(2),
                  },
                  children: [
                    TableRow(children: [
                      Text(
                        '1.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            // fontFamily: "Nunito",
                            color: Colors.red),
                      ),
                      Container(
                        height: 70,
                        child: Text(
                          'Read the Questions given in your question paper carefully and select the appropriate answer.',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              // fontFamily: "Nunito",
                              color: Colors.red),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        '2.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            // fontFamily: "Nunito",
                            color: Colors.red),
                      ),
                      Container(
                        height: 70,
                        child: Text(
                          'Use Next or Previous Buttons to get next or previous questions.',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              // fontFamily: "Nunito",
                              color: Colors.red),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        '3.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            // fontFamily: "Nunito",
                            color: Colors.red),
                      ),
                      Container(
                        height: 70,
                        child: Text(
                          "Once you have completed your test, Click on the 'Submit' button then say 'OK' to submit the paper.",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              // fontFamily: "Nunito",
                              color: Colors.red),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        '4.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            // fontFamily: "Nunito",
                            color: Colors.red),
                      ),
                      Container(
                        height: 90,
                        child: Text(
                          "While attending test  attendees face photos will be captured by camera device and the same will be  sent for the face detection to the respective authority.",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              // fontFamily: "Nunito",
                              color: Colors.red),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        '5.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            // fontFamily: "Nunito",
                            color: Colors.red),
                      ),
                      Container(
                        height: 70,
                        child: Text(
                          "If the captured photo does not contain your face. Your test will be rejected. So, Kindly make sure that your  camera is ON.",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              // fontFamily: "Nunito",
                              color: Colors.red),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        '6.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            // fontFamily: "Nunito",
                            color: Colors.red),
                      ),
                      Container(
                        height: 70,
                        child: Text(
                          "Make sure that your face is facing the camera .So, do the necessary camera adjustment.",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              // fontFamily: "Nunito",
                              color: Colors.red),
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      Text(
                        '7.',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            // fontFamily: "Nunito",
                            color: Colors.red),
                      ),
                      Text(
                        "On approval of genuinity CME credit points will be allocated on successful test pass.",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            // fontFamily: "Nunito",
                            color: Colors.red),
                      ),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Cancel'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(cmeProgramController.allCmeVideos.value!
                            .videoList![widget.index].speakerId);
                        print(cmeProgramController.allCmeVideos.value!
                            .videoList![widget.index].videoId);
                        cmeProgramController.getAllQuestionsData(
                          videoId: cmeProgramController.allCmeVideos.value!
                              .videoList![widget.index].videoId
                              .toString(),
                          spekerId: cmeProgramController.allCmeVideos.value!
                              .videoList![widget.index].speakerId
                              .toString(),
                        );
                      },
                      child: Text('OK'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
