import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hslr/screen/cmeprogrm_points/certificate_pdf.dart';
import 'package:hslr/screen/login/login_controller.dart';
import 'package:hslr/screen/member_details/member_controller.dart';

class Cmepoints extends StatefulWidget {
  const Cmepoints({Key? key}) : super(key: key);

  @override
  State<Cmepoints> createState() => _CmepointsState();
}

class _CmepointsState extends State<Cmepoints> {
  MemberDetailsController mebController = Get.put(MemberDetailsController());

  TableRow buildRow(List<String> cells) =>
      TableRow(children: cells.map((cell) => Text(cell)).toList());
  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
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
                            SizedBox(
                              width: 25,
                            ),
                            Text(
                              "CME Points",
                              style: TextStyle(
                                  fontFamily: "Nunito",
                                  color: Colors.black,
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
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      left: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffDC3638),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      left: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.black, width: 1),
                                      // bottom:
                                      //     BorderSide(color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      left: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 25,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      left: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Program\n  Name',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffDC3638)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Program 1',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Program 2',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'Program 3',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Column(
                          //   children: [
                          //     Container(
                          //       margin: EdgeInsets.only(top: 10),
                          //       height: 60,
                          //       width: 50,
                          //       decoration: BoxDecoration(
                          //         border: Border(
                          //             bottom: BorderSide(
                          //                 color: Colors.black, width: 1),
                          //             right: BorderSide(
                          //                 color: Colors.black, width: 1),
                          //             top: BorderSide(
                          //                 color: Colors.black, width: 1)),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           'Points',
                          //           style: TextStyle(
                          //               fontSize: 14,
                          //               fontFamily: "Nunito",
                          //               fontWeight: FontWeight.bold,
                          //               color: Color(0xffDC3638)),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       margin: EdgeInsets.only(top: 0),
                          //       height: 50,
                          //       width: 50,
                          //       decoration: BoxDecoration(
                          //         border: Border(
                          //           top: BorderSide(
                          //               color: Colors.black, width: 1),
                          //           right: BorderSide(
                          //               color: Colors.black, width: 1),
                          //           // left:
                          //           //     BorderSide(color: Colors.black, width: 1)
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           '120',
                          //           style: TextStyle(
                          //             fontSize: 15,
                          //             fontFamily: "Nunito",
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       margin: EdgeInsets.only(top: 0),
                          //       height: 50,
                          //       width: 50,
                          //       decoration: BoxDecoration(
                          //         border: Border(
                          //           top: BorderSide(
                          //               color: Colors.black, width: 1),
                          //           // bottom:
                          //           //     BorderSide(color: Colors.black, width: 1),
                          //           right: BorderSide(
                          //               color: Colors.black, width: 1),
                          //           // left:
                          //           //     BorderSide(color: Colors.black, width: 1)
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           '130',
                          //           style: TextStyle(
                          //             fontSize: 15,
                          //             fontFamily: "Nunito",
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Container(
                          //       margin: EdgeInsets.only(top: 0),
                          //       height: 50,
                          //       width: 50,
                          //       decoration: BoxDecoration(
                          //         border: Border(
                          //           bottom: BorderSide(
                          //               color: Colors.black, width: 1),
                          //           top: BorderSide(
                          //               color: Colors.black, width: 1),
                          //           right: BorderSide(
                          //               color: Colors.black, width: 1),
                          //           // left:
                          //           //     BorderSide(color: Colors.black, width: 1)
                          //         ),
                          //       ),
                          //       child: Center(
                          //         child: Text(
                          //           '140',
                          //           style: TextStyle(
                          //             fontSize: 15,
                          //             fontFamily: "Nunito",
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Program\n    Date',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffDC3638)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '10/06/2022',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '11/06/2022',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '12/06/2022',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Attended\n    Date',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffDC3638)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '10/06/2022',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '11/06/2022',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '12/06/2022',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Attendeds\nQuestions',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffDC3638)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '10',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '11',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '12',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    '  Passed\nQuestons',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffDC3638)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '8',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '7',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '9',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Attempts',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffDC3638)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Credit\nPoints',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffDC3638)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '0',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 80,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 60,
                                width: 125,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.black, width: 1),
                                      right: BorderSide(
                                          color: Colors.black, width: 1),
                                      top: BorderSide(
                                          color: Colors.black, width: 1)),
                                ),
                                child: Center(
                                  child: Text(
                                    'Certificate',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xffDC3638)),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 125,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    CertificatePdf.createPdf();
                                  },
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Image.asset(
                                        'assets/hj.png',
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 125,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    // bottom:
                                    //     BorderSide(color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 0),
                                height: 50,
                                width: 125,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1),
                                    top: BorderSide(
                                        color: Colors.black, width: 1),
                                    right: BorderSide(
                                        color: Colors.black, width: 1),
                                    // left:
                                    //     BorderSide(color: Colors.black, width: 1)
                                  ),
                                ),
                                child: InkWell(
                                  onTap: ()=>CertificatePdf.createPdf(),
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Image.asset(
                                        'assets/hj.png',
                                        height: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],

                        // textDirection: Axis.horizontal,

                        // children: [
                        //   buildRow([
                        //     'Cell 1',
                        //     'Cell 2',
                        //     'Cell 3',
                        //     'Cell 4',
                        //     'Cell 5',
                        //   ]),
                        // ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(
                          'Showing 3 of 3 Entries',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Nunito",
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
