import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hslr/screen/creat_account/create_account.dart';
import 'package:hslr/screen/forgotpassword/forgot_password.dart';
import 'package:hslr/screen/login/login_controller.dart';
import 'package:hslr/screen/quiz/qutionCpntroller.dart';

class Question extends StatefulWidget {
  const Question({Key? key}) : super(key: key);

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  QuestionController qController = Get.put(QuestionController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionController>(
      builder: ((_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Text(
                      "Question ${qController.pageChange + 1} out of ${qController.questionlist.length}",
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
                        physics: NeverScrollableScrollPhysics(),
                        controller: qController.pageController,

                        onPageChanged: (index) {
                          qController.pageChange = index;
                          qController.update();
                        },
                        itemCount: qController.questionlist.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    qController.questionlist[index].question,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    qController.optionA = true;
                                    qController.optionB = false;
                                    qController.optionC = false;
                                    qController.optionD = false;
                                    qController.update();
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 18.0),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: qController.optionA
                                                ? Color(0xff32D774)
                                                : Colors.white,
                                            border: Border.all(
                                              // width: ,
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            )),
                                        child: Center(
                                            child: Text(
                                          "A",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Nunito",
                                          ),
                                        )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(0.0),
                                        height: 40,
                                        width: context.width * 0.8,
                                        decoration: BoxDecoration(
                                            // color: Colors.orange,
                                            border: Border.all(
                                              // width: ,
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 10.0),
                                          child: Text(qController
                                              .questionlist[index].optionA),
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
                                    qController.optionA = false;
                                    qController.optionB = true;
                                    qController.optionC = false;
                                    qController.optionD = false;
                                    qController.update();
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 18.0),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: qController.optionB
                                                ? Color(0xff32D774)
                                                : Colors.white,
                                            border: Border.all(
                                              // width: ,
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            )),
                                        child: Center(
                                            child: Text(
                                          "B",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Nunito",
                                          ),
                                        )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(0.0),
                                        height: 40,
                                        width: context.width * 0.8,
                                        decoration: BoxDecoration(
                                            // color: Colors.orange,
                                            border: Border.all(
                                              // width: ,
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 10.0),
                                          child: Text(
                                            qController
                                                .questionlist[index].optionB,
                                            style: TextStyle(
                                              fontFamily: "Nunito",
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
                                    qController.optionA = false;
                                    qController.optionB = false;
                                    qController.optionC = true;
                                    qController.optionD = false;
                                    qController.update();
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 18.0),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: qController.optionC
                                                ? Color(0xff32D774)
                                                : Colors.white,
                                            border: Border.all(
                                              // width: ,
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            )),
                                        child: Center(
                                            child: Text(
                                          "C",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: "Nunito",
                                          ),
                                        )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(0.0),
                                        height: 40,
                                        width: context.width * 0.8,
                                        decoration: BoxDecoration(
                                            // color: Colors.orange,
                                            border: Border.all(
                                              // width: ,
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 10.0),
                                          child: Text(
                                            qController
                                                .questionlist[index].optionC,
                                            style: TextStyle(
                                              fontFamily: "Nunito",
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
                                    qController.optionA = false;
                                    qController.optionB = false;
                                    qController.optionC = false;
                                    qController.optionD = true;
                                    qController.update();
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 18.0),
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            color: qController.optionD
                                                ? Color(0xff32D774)
                                                : Colors.white,
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              bottomLeft: Radius.circular(10),
                                            )),
                                        child: Center(
                                            child: Text(
                                          "D",
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: "Nunito",
                                          ),
                                        )),
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(0.0),
                                        height: 40,
                                        width: context.width * 0.8,
                                        decoration: BoxDecoration(
                                            // color: Colors.orange,
                                            border: Border.all(
                                              // width: ,
                                              color: Colors.grey,
                                            ),
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(5),
                                              bottomRight: Radius.circular(5),
                                            )),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, top: 10.0),
                                          child: Text(
                                            qController
                                                .questionlist[index].optionD,
                                            style: TextStyle(
                                              fontFamily: "Nunito",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },

                        // children: [
                        //   Container(
                        //     color: Colors.green,
                        //   ),
                        //   Container(
                        //     color: Colors.blue,
                        //   ),
                        //   Container(
                        //     color: Colors.orange,
                        //   ),
                        // ],
                        // scrollDirection: Axis.horizontal,
                        // // physics: NeverScrollableScrollPhysics(),
                        // itemCount: qController.questionlist.length,
                        // itemBuilder: (context, index) {
                        //   return SizedBox(
                        //     height: 400,
                        //     width: context.width,
                        //     child: Column(
                        //       children: [
                        //         Text(
                        //             "Question ${qController.questionlist[index].question}"),
                        //         SizedBox(
                        //           width: context.width * 0.3,
                        //           child: ElevatedButton(
                        //               onPressed: () {
                        //                 qController.questionlist[index--];
                        //                 qController.update();
                        //               },
                        //               style: ElevatedButton.styleFrom(
                        //                   primary: Colors.blue.shade700,
                        //                   shape: RoundedRectangleBorder(
                        //                     borderRadius:
                        //                         BorderRadius.circular(30),
                        //                   )),
                        //               child: Text("Previous")),
                        //         ),
                        //         SizedBox(
                        //           width: context.width * 0.3,
                        //           child: GetBuilder<QuestionController>(
                        //             builder: (_) {
                        //               return ElevatedButton(
                        //                   onPressed: () {
                        //                     if (qController
                        //                             .questionlist[index] !=
                        //                         qController
                        //                                 .questionlist.length -
                        //                             1) {
                        //                       qController.questionlist[index++];
                        //                       print(
                        //                           "nextbutton:${qController.questionlist[index].optionA}");
                        //                       qController.update();
                        //                     }
                        //                   },
                        //                   style: ElevatedButton.styleFrom(
                        //                       primary: Colors.blue.shade700,
                        //                       shape: RoundedRectangleBorder(
                        //                         borderRadius:
                        //                             BorderRadius.circular(30),
                        //                       )),
                        //                   child: Text("Next"));
                        //             }
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   );

                        // }
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
                              qController.pageController.animateToPage(
                                  qController.pageChange > 0
                                      ? --qController.pageChange
                                      : qController.pageChange = 0,
                                  // --qController.pageChange,
                                  duration: Duration(microseconds: 250),
                                  curve: Curves.bounceInOut);
                              print("page_change--:${qController.pageChange}");
                              qController.update();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            child: Text(
                              "Previous",
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
                            onPressed: () {
                              qController.pageController.animateToPage(
                                  qController.pageChange >
                                          qController.questionlist.length
                                      ? ++qController.pageChange
                                      : qController.pageChange =
                                          qController.questionlist.length - 1,
                                  duration: Duration(microseconds: 250),
                                  curve: Curves.bounceInOut);
                              qController.update();
                              print("page_change++:${qController.pageChange}");
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            child: Text(
                              "Next",
                              style: TextStyle(
                                fontFamily: "Nunito",
                              ),
                            )),
                      ),
                      // GetBuilder<QuestionController>(builder: (_) {
                      //   return IconButton(
                      //       onPressed: () {
                      //         qController.pageController.animateToPage(
                      //             qController.pageChange > 0
                      //                 ? --qController.pageChange
                      //                 : qController.pageChange = 0,
                      //             // --qController.pageChange,
                      //             duration: Duration(microseconds: 250),
                      //             curve: Curves.bounceInOut);
                      //         print(
                      //             "page_change--:${qController.pageChange}");
                      //         qController.update();
                      //       },
                      //       icon: Icon(Icons.arrow_back_ios));
                      // }),
                      // IconButton(
                      //     onPressed: () {
                      //       qController.pageController.animateToPage(
                      //           qController.pageChange >
                      //                   qController.questionlist.length
                      //               ? ++qController.pageChange
                      //               : qController.pageChange =
                      //                   qController.questionlist.length - 1,
                      //           duration: Duration(microseconds: 250),
                      //           curve: Curves.bounceInOut);
                      //       qController.update();
                      //       print("page_change++:${qController.pageChange}");
                      //     },
                      //     icon: Icon(Icons.arrow_forward_ios)),
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
    );
  }
}
