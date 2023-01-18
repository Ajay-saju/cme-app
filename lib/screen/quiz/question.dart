import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram_controller.dart';
import 'package:hslr/screen/quiz/qutionCpntroller.dart';

class Question extends StatefulWidget {
  final bool isGoingtoTest;
  final correctAnswer;
  final quesList;
  Question({
    Key? key,
    required this.isGoingtoTest,
    this.quesList,
    this.correctAnswer,
  }) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  QuestionController qController = Get.put(QuestionController());
  final cmeProgramControll = Get.find<CmeProgramController>();

  var finalQuesList;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   // qController.takePicture();
  //   // cmeProgramControll.getAllQuestionsData(widget.videoId);

  //   // storeCorrectAns();
  // }

  @override
  Widget build(BuildContext context) {
    finalQuesList = widget.quesList;
    // if (qController.cameraController.value.isInitialized)
    print(finalQuesList);
    print(widget.correctAnswer);
    print('============================================================');

    return WillPopScope(
      onWillPop: () async {
        if (qController.tabIndex != 0) {
          qController.tabIndex.value = 0;
          qController.update();
          return Future.value(false);
        } else {
          qController.cancelTest(widget.isGoingtoTest);
          // Get.defaultDialog(
          //   title: 'Are you sure',
          //   confirm: ElevatedButton(
          //       style: ElevatedButton.styleFrom(
          //           backgroundColor: Colors.black,
          //           shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(30),
          //           )),
          //       onPressed: () {
          //         qController.cancelTest(true);
          //         // if (qController.timer != null) {
          //         //   // qController.cameraController.stopImageStream();
          //         // }

          //         // widget.isGoingtoTest == true
          //         //     ? Get.offAll(TestScreen())
          //         //     : Get.offAll(Onlinecmeprogram());
          //       },
          //       child: Text(
          //         'Ok',
          //         style: TextStyle(
          //           fontFamily: "Nunito",
          //         ),
          //       )),
          //   cancel: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //         backgroundColor: Colors.black,
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(30),
          //         )),
          //     onPressed: () {
          //       Get.back();
          //     },
          //     child: Text(
          //       'Cancel',
          //       style: TextStyle(
          //         fontFamily: "Nunito",
          //       ),
          //     ),
          //   ),
          //   middleText: "Your answers will be countable",
          //   middleTextStyle: TextStyle(
          //     fontFamily: "Nunito",
          //   ),
          // );
        }
        return Future.value(false);
      },
      child: GetBuilder<QuestionController>(
        builder: ((_) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                automaticallyImplyLeading: true,
                actions: [
                  Obx(() => Padding(
                        padding: const EdgeInsets.only(right: 15, top: 18),
                        child: Text(qController.time.value,
                            style: TextStyle(
                                fontFamily: "Nunito",
                                color: qController.timerColorsChange(),
                                fontWeight: FontWeight.w600,
                                fontSize: 15)),
                      )),
                ],

                backgroundColor: Colors.white, //Color(0xff63c3fe),
                // elevation: 0,
                title: Text(
                  "Anatomy Quiz",
                  style: TextStyle(fontFamily: "Nunito", color: Colors.black),
                ),
                iconTheme: IconThemeData(
                  color: Colors.black, //change your color here
                ),
              ),
              //Color(0xff63c3fe),
              body: SafeArea(
                child: finalQuesList == null
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.black87,
                          strokeWidth: 1.5,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              "Question ${qController.pageChange + 1} out of ${finalQuesList.length}",
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: "Nunito",
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 2,
                          ),
                          Container(
                              // color: Colors.amber,
                              height: context.width > 410
                                  ? context.height * 0.67
                                  : context.height * 0.6,
                              child: PageView.builder(
                                // scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                controller: qController.pageController,

                                onPageChanged: (index) {
                                  qController.pageChange = index;

                                  qController.update();
                                },
                                itemCount: finalQuesList.length,
                                itemBuilder: (context, index) {
                                  return Obx(() => Container(
                                        height: context.height,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(18.0),
                                              child: Text(
                                                finalQuesList[index][0]
                                                    .toString()
                                                    .replaceAll(
                                                        new RegExp(
                                                            r'[<p></p>]+'),
                                                        ''),
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: 20.0,
                                                    fontFamily: "Nunito",
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                qController
                                                    .changeSelectedOPtion(
                                                        qController
                                                            .isSelectedOptionA);
                                                print(
                                                    "A ${qController.isSelectedOptionA}");

                                                if (qController
                                                        .isSelectedOptionA ==
                                                    1) {
                                                  qController.isSelectedOptionB
                                                      .value = 0;
                                                  qController.isSelectedOptionC
                                                      .value = 0;
                                                  qController.isSelectedOptionD
                                                      .value = 0;
                                                  qController.optionA.value =
                                                      true;
                                                  qController.optionB.value =
                                                      false;
                                                  qController.optionC.value =
                                                      false;
                                                  qController.optionD.value =
                                                      false;
                                                  qController.selectedOption
                                                      .value = 'a';

                                                  qController.answers[
                                                      qController.pageChange +
                                                          1] = qController
                                                      .selectedOption
                                                      .toString()
                                                      .toLowerCase();
                                                  print(qController.answers);
                                                } else {
                                                  qController.optionA.value =
                                                      false;
                                                  qController.selectedOption
                                                      .value = '';
                                                  qController.answers[
                                                      qController.pageChange +
                                                          1] = qController
                                                      .selectedOption
                                                      .toString()
                                                      .toLowerCase();
                                                  print(qController.answers);
                                                }

                                                qController.update();
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 18.0),
                                                    height: 80,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: qController.answers[
                                                                        qController.pageChange +
                                                                            1] ==
                                                                    'a' ||
                                                                qController
                                                                        .optionA
                                                                        .value ==
                                                                    true
                                                            // qController
                                                            //         .isSelectedOption ==
                                                            //     1
                                                            ? Colors.red
                                                            : Colors.black87,
                                                        border: Border.all(
                                                          // width: ,
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        )),
                                                    child: Center(
                                                        child: Text(
                                                      "A",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: "Nunito",
                                                          color: Colors.white
                                                          //  qController
                                                          //                 .answers[qController
                                                          //                     .pageChange +
                                                          //                 1] ==
                                                          //             'a' ||
                                                          //         qController
                                                          //             .optionA
                                                          //             .value
                                                          //     ? Colors.white
                                                          //     : Colors.black
                                                          ),
                                                    )),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(0.0),
                                                    height: 80,
                                                    width: context.width * 0.8,
                                                    decoration: BoxDecoration(
                                                        // color: Colors.orange,
                                                        border: Border.all(
                                                          // width: ,
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5),
                                                        )),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 10.0,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          finalQuesList[index]
                                                                  [1]
                                                              .toString()
                                                              .replaceAll(
                                                                  new RegExp(
                                                                      r'[<p></p>]+'),
                                                                  '')
                                                              .substring(3),
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  "Nunito",
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                qController
                                                    .changeSelectedOPtion(
                                                        qController
                                                            .isSelectedOptionB);
                                                print(
                                                    "B ${qController.isSelectedOptionB}");

                                                if (qController
                                                        .isSelectedOptionB ==
                                                    1) {
                                                  qController.isSelectedOptionA
                                                      .value = 0;
                                                  qController.isSelectedOptionC
                                                      .value = 0;
                                                  qController.isSelectedOptionD
                                                      .value = 0;
                                                  qController.optionA.value =
                                                      false;
                                                  qController.optionB.value =
                                                      true;
                                                  qController.optionC.value =
                                                      false;
                                                  qController.optionD.value =
                                                      false;
                                                  // qController.selectedOption = true;
                                                  qController.selectedOption
                                                      .value = 'b';

                                                  qController.answers[
                                                      qController.pageChange +
                                                          1] = qController
                                                      .selectedOption
                                                      .toString()
                                                      .toLowerCase();
                                                  print(qController.answers);
                                                } else {
                                                  qController.optionB.value =
                                                      false;
                                                  qController.selectedOption
                                                      .value = '';
                                                  qController.answers[
                                                      qController.pageChange +
                                                          1] = qController
                                                      .selectedOption
                                                      .toString()
                                                      .toLowerCase();
                                                  print(qController.answers);
                                                }

                                                qController.update();
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 18.0),
                                                    height: 80,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: qController.answers[
                                                                        qController.pageChange +
                                                                            1] ==
                                                                    'b' ||
                                                                qController
                                                                    .optionB
                                                                    .value
                                                            // &&  qController.selectedOption == true
                                                            ? Colors.red
                                                            : Colors.black87,
                                                        border: Border.all(
                                                          // width: ,
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        )),
                                                    child: Center(
                                                        child: Text(
                                                      "B",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: "Nunito",
                                                          color: Colors.white
                                                          //  qController.answers[
                                                          //                 qController.pageChange +
                                                          //                     1] ==
                                                          //             'b' ||
                                                          //         qController
                                                          //             .optionB
                                                          //             .value
                                                          //     // &&  qController.selectedOption == true
                                                          //     ? Colors.white
                                                          //     : Colors.black87,
                                                          ),
                                                    )),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(0.0),
                                                    height: 80,
                                                    width: context.width * 0.8,
                                                    decoration: BoxDecoration(
                                                        // color: Colors.orange,
                                                        border: Border.all(
                                                          // width: ,
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5),
                                                        )),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 10.0,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          finalQuesList[index]
                                                                  [2]
                                                              .toString()
                                                              .replaceAll(
                                                                  new RegExp(
                                                                      r'[<p></p>]+'),
                                                                  '')
                                                              .substring(3),
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  "Nunito",
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                qController
                                                    .changeSelectedOPtion(
                                                        qController
                                                            .isSelectedOptionC);
                                                print(
                                                    "C ${qController.isSelectedOptionC}");

                                                if (qController
                                                        .isSelectedOptionC ==
                                                    1) {
                                                  qController.isSelectedOptionA
                                                      .value = 0;
                                                  qController.isSelectedOptionB
                                                      .value = 0;
                                                  qController.isSelectedOptionD
                                                      .value = 0;
                                                  qController.optionA.value =
                                                      false;
                                                  qController.optionB.value =
                                                      false;
                                                  qController.optionC.value =
                                                      true;
                                                  qController.optionD.value =
                                                      false;
                                                  // qController.selectedOption = true;
                                                  qController.selectedOption
                                                      .value = 'c';

                                                  qController.answers[
                                                      qController.pageChange +
                                                          1] = qController
                                                      .selectedOption
                                                      .toString()
                                                      .toLowerCase();
                                                  print(qController.answers);
                                                } else {
                                                  qController.optionC.value =
                                                      false;
                                                  qController.selectedOption
                                                      .value = '';
                                                  qController.answers[
                                                      qController.pageChange +
                                                          1] = qController
                                                      .selectedOption
                                                      .toString()
                                                      .toLowerCase();
                                                  print(qController.answers);
                                                }

                                                qController.update();
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 18.0),
                                                    height: 80,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: qController.answers[
                                                                        qController.pageChange +
                                                                            1] ==
                                                                    'c' ||
                                                                qController
                                                                    .optionC
                                                                    .value
                                                            //  ||  qController.selectedOption == true
                                                            ? Colors.red
                                                            : Colors.black87,
                                                        border: Border.all(
                                                          // width: ,
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        )),
                                                    child: Center(
                                                        child: Text(
                                                      "C",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: "Nunito",
                                                          color: Colors.white
                                                          //  qController.answers[
                                                          //                 qController.pageChange +
                                                          //                     1] ==
                                                          //             'c' ||
                                                          //         qController
                                                          //             .optionC
                                                          //             .value
                                                          //     //  ||  qController.selectedOption == true
                                                          //     ? Colors.white
                                                          //     : Colors.black87,
                                                          ),
                                                    )),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(0.0),
                                                    height: 80,
                                                    width: context.width * 0.8,
                                                    decoration: BoxDecoration(
                                                        // color: Colors.orange,
                                                        border: Border.all(
                                                          // width: ,
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5),
                                                        )),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 10.0,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          finalQuesList[index]
                                                                  [3]
                                                              .toString()
                                                              .replaceAll(
                                                                  new RegExp(
                                                                      r'[<p></p>]+'),
                                                                  '')
                                                              .substring(3),
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  "Nunito",
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                qController
                                                    .changeSelectedOPtion(
                                                        qController
                                                            .isSelectedOptionD);
                                                print(
                                                    "D ${qController.isSelectedOptionD}");

                                                if (qController
                                                        .isSelectedOptionD ==
                                                    1) {
                                                  qController.isSelectedOptionA
                                                      .value = 0;
                                                  qController.isSelectedOptionC
                                                      .value = 0;
                                                  qController.isSelectedOptionB
                                                      .value = 0;
                                                  qController.optionA.value =
                                                      false;
                                                  qController.optionB.value =
                                                      false;
                                                  qController.optionC.value =
                                                      false;
                                                  qController.optionD.value =
                                                      true;
                                                  qController.selectedOption
                                                      .value = 'd';

                                                  qController.answers[
                                                      qController.pageChange +
                                                          1] = qController
                                                      .selectedOption
                                                      .toString()
                                                      .toLowerCase();
                                                  print(qController.answers);
                                                } else {
                                                  qController.optionD.value =
                                                      false;
                                                  qController.selectedOption
                                                      .value = '';
                                                  qController.answers[
                                                      qController.pageChange +
                                                          1] = qController
                                                      .selectedOption
                                                      .toString()
                                                      .toLowerCase();
                                                  print(qController.answers);
                                                }

                                                // qController.selectedOption = true;
                                                qController.update();
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 18.0),
                                                    height: 80,
                                                    width: 40,
                                                    decoration: BoxDecoration(
                                                        color: qController.answers[
                                                                        qController.pageChange +
                                                                            1] ==
                                                                    'd' ||
                                                                qController
                                                                    .optionD
                                                                    .value
                                                            ? Colors.red
                                                            : Colors.black87,
                                                        border: Border.all(
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                        )),
                                                    child: Center(
                                                        child: Text(
                                                      "D",
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: "Nunito",
                                                          color: Colors.white
                                                          // qController.answers[
                                                          //                 qController.pageChange +
                                                          //                     1] ==
                                                          //             'd' ||
                                                          //         qController
                                                          //             .optionD
                                                          //             .value
                                                          //     ? Colors.white
                                                          //     : Colors.black87,
                                                          ),
                                                    )),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.all(0.0),
                                                    height: 80,
                                                    width: context.width * 0.8,
                                                    decoration: BoxDecoration(
                                                        // color: Colors.orange,
                                                        border: Border.all(
                                                          // width: ,
                                                          color: Colors.grey,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  5),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5),
                                                        )),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                        left: 10.0,
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          finalQuesList[index]
                                                                  [4]
                                                              .toString()
                                                              .replaceAll(
                                                                  new RegExp(
                                                                      r'[<p></p>]+'),
                                                                  '')
                                                              .substring(3),
                                                          maxLines: 3,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontFamily:
                                                                  "Nunito",
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ));
                                },
                              )),
                          SizedBox(
                            height: 50,
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: context.width * 0.25,
                                child: ElevatedButton(
                                    onPressed: () {
                                      print(qController.answers);
                                      qController.pageChange == 0
                                          ? qController
                                              .cancelTest(widget.isGoingtoTest)
                                          : qController.optionA.value = false;
                                      qController.optionB.value = false;
                                      qController.optionC.value = false;
                                      qController.optionD.value = false;
                                      qController.pageController.animateToPage(
                                          qController.pageChange > 0
                                              ? --qController.pageChange
                                              : qController.pageChange = 0,
                                          // --qController.pageChange,
                                          duration: Duration(microseconds: 250),
                                          curve: Curves.bounceInOut);
                                      print(
                                          "page_change--:${qController.pageChange}");
                                      qController.update();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    child: Text(
                                      qController.pageChange == 0
                                          ? "Cancel"
                                          : "Previous",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                      ),
                                    )),
                              ),
                              // Spacer(),
                              SizedBox(
                                width: 20,
                              ),

                              SizedBox(
                                width: context.width * 0.25,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      qController.pageChange != 14
                                          ? null
                                          //  qController.answers[
                                          //         qController.pageChange + 1] =
                                          //     qController.selectedOption
                                          //         .toString()
                                          //         .toLowerCase()
                                          : qController.completeTest(
                                              selectedOption: qController
                                                  .selectedOption
                                                  .toString()
                                                  .toLowerCase(),
                                              isGoingtoTest:
                                                  widget.isGoingtoTest,
                                              correctAns: widget.correctAnswer,
                                              input: qController.answers);

                                      print(qController.answers);

                                      qController.optionA.value = false;
                                      qController.optionB.value = false;
                                      qController.optionC.value = false;
                                      qController.optionD.value = false;
                                      qController.pageController.nextPage(
                                          duration: Duration(microseconds: 50),
                                          curve: Curves.bounceInOut);

                                      print(
                                          "page_change++:${qController.pageChange}");
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    child: Text(
                                      qController.pageChange == 14
                                          ? 'Submit'
                                          : "Next",
                                      style: TextStyle(
                                        fontFamily: "Nunito",
                                      ),
                                    )),
                              ),
                            ],
                          ),
                          Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
              ),
            ),
          );
        }),
      ),
    );
    // else
    //   return SizedBox();
  }

  // competeTest() {
  //   Get.defaultDialog(
  //     barrierDismissible: false,
  //     cancel: ElevatedButton(
  //       style: ElevatedButton.styleFrom(
  //           backgroundColor: Colors.black,
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(30),
  //           )),
  //       onPressed: () {
  //         Get.back();
  //       },
  //       child: Text(
  //         'Cancel',
  //         style: TextStyle(
  //           fontFamily: "Nunito",
  //         ),
  //       ),
  //     ),
  //     confirm: ElevatedButton(
  //         style: ElevatedButton.styleFrom(
  //             backgroundColor: Colors.black,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(30),
  //             )),
  //         onPressed: () {
  //           qController.timer!.cancel();
  //           widget.isGoingtoTest == true
  //               ? Get.offAll(TestScreen())
  //               : Get.offAll(Onlinecmeprogram());
  //         },
  //         child: Text(
  //           'OK',
  //           style: TextStyle(
  //             fontFamily: "Nunito",
  //           ),
  //         )),
  //     title: 'Complete',
  //     titleStyle: TextStyle(
  //       fontSize: 20,
  //       fontWeight: FontWeight.bold,
  //       fontFamily: "Nunito",
  //     ),
  //     middleText: 'Test Completed Successfully',
  //     middleTextStyle: TextStyle(
  //       fontFamily: "Nunito",
  //     ),
  //   );
  // }

  // void storeCorrectAns() {
  //   for (int i = 0; i < widget.quesList.length; i++) {
  //     // qController.correctAnswer[i+1] = widget.quesList[i].

}
