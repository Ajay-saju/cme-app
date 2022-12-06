import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/cmeprogrm_points/cme_points.dart';
import 'package:hslr/screen/creat_account/create_account.dart';
import 'package:hslr/screen/dashboard/dashboard_controller.dart';
import 'package:hslr/screen/login/login.dart';
import 'package:hslr/screen/member_details/member_details.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram.dart';
import 'package:hslr/screen/paymentdetails/paymentdetails.dart';
import 'package:hslr/screen/receipt/reciept_screen.dart';
import 'package:hslr/screen/result_screen/result_screen.dart';
import 'package:hslr/screen/test_screen/testscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BottomDrawer extends StatefulWidget {
  const BottomDrawer({Key? key}) : super(key: key);

  @override
  State<BottomDrawer> createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  ScrollController controller = ScrollController();
  DashboardController bdrawerController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GetBuilder<DashboardController>(
      builder: ((_) {
        return Container(
          width: width * 0.8,
          height: height * 1,
          child: Drawer(
            child: GestureDetector(
              onTap: () {
                // FocusScope.of(context).unfocus();
                bdrawerController.visibledrop = false;
                bdrawerController.update();
              },
              child: Scaffold(
                backgroundColor: Color(0xffDC3638),
                body: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 18.0, top: 25.0, right: 18.0),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundImage: AssetImage(
                                'assets/man.png',

                                // fit: BoxFit.cover,
                              ),
                              radius: 25.0,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: context.width * 0.05,
                            ),
                            // Spacer(),
                            Text(
                              "Dr Ram",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Container(
                        height: context.width > 410
                            ? context.height * 0.9
                            : context.height * 0.75,
                        child: SingleChildScrollView(
                          controller: controller,
                          // reverse: true,
                          // scrollDirection: Axis.,
                          child: Column(children: [
                            ListTile(
                              leading: SizedBox(
                                height: 22,
                                width: 22,
                                child: Image.asset(
                                  'assets/hmwhite.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                "Dashboard",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                bdrawerController.sidedrawer(0);
                                bdrawerController.update();
                                Get.back();
                              },
                            ),

                            // InkWell(
                            //   onTap: () {
                            //     // Get.to(DashboardController());
                            //     bdrawerController.sidedrawer(0);
                            //     bdrawerController.update();
                            //     Get.back();
                            //   },
                            //   child: Padding(
                            //     padding: const EdgeInsets.all(20.0),
                            //     child: Row(
                            //       children: [
                            //         SizedBox(
                            //           height: 22,
                            //           width: 22,
                            //           // padding: const EdgeInsets.all(0.0),
                            //           child: Image.asset(
                            //             'assets/hmwhite.png',
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           width: 20,
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(top: 5.0),
                            //           child: Text(
                            //             "Dashboard",
                            //             style: TextStyle(
                            //               fontSize: 18,
                            //               fontFamily: "Nunito",
                            //               fontWeight: FontWeight.bold,
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor:
                                    Colors.white, // here for close state
                                colorScheme: ColorScheme.light(
                                  primary: Colors.white,
                                ), // here for open state in replacement of deprecated accentColor
                                dividerColor: Colors
                                    .transparent, // if you want to remove the border
                              ),
                              child: ExpansionTile(
                                // onExpansionChanged: (value) {
                                //   if(value == true){
                                //      bdrawerController.visibledrop = false;
                                //       bdrawerController.update();

                                //   }else{
                                //     bdrawerController.visibledrop = true;
                                //      bdrawerController.update();
                                //   }

                                //   // bdrawerController.update();
                                // },
                                leading: SizedBox(
                                  height: 25,
                                  width: 22,
                                  // padding: const EdgeInsets.all(0.0),
                                  child: Image.asset(
                                    'assets/Untitled.png',
                                    // height: 15,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  "Profile",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),

                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 20.0, left: 60),
                                    height: 110,
                                    width: 250,
                                    // color: Colors.amber,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(Memberdetail());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 15),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 22,
                                                  width: 22,
                                                  // padding: const EdgeInsets.all(0.0),
                                                  child: Image.asset(
                                                    'assets/ff.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                    "Members Details",
                                                    style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(Memberdetail());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 15),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 22,
                                                  width: 22,
                                                  // padding: const EdgeInsets.all(0.0),
                                                  child: Image.asset(
                                                    'assets/ed.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                    "Education Details",
                                                    style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            // InkWell(
                            //   onTap: () {
                            //     // controller.animateTo(5,
                            //     //     duration: Duration(seconds: 5),
                            //     //     curve: Curves.slowMiddle);
                            //     bdrawerController.visibledrop =
                            //         !bdrawerController.visibledrop;
                            //     bdrawerController.update();
                            //   },
                            //   child: Padding(
                            //     padding:
                            //         const EdgeInsets.only(left: 20.0, top: 10),
                            //     child: Row(
                            //       children: [
                            //         SizedBox(
                            //           height: 25,
                            //           width: 22,
                            //           // padding: const EdgeInsets.all(0.0),
                            //           child: Image.asset(
                            //             'assets/Untitled.png',
                            //             // height: 15,
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           width: 20,
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(
                            //               top: 5.0, left: 5),
                            //           child: Text(
                            //             "Profile",
                            //             style: TextStyle(
                            //               fontSize: 18,
                            //               fontFamily: "Nunito",
                            //               fontWeight: FontWeight.bold,
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //         ),
                            //         // Spacer(),
                            //         SizedBox(
                            //           width: 100,
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(
                            //               left: 8.0, top: 0),
                            //           child: GetBuilder<DashboardController>(
                            //             builder: (contoll) {
                            //               return bdrawerController.visibledrop
                            //                   ? Image.asset(
                            //                       'assets/ffe.png',
                            //                       height: 10,
                            //                       color: Colors.white,
                            //                     )
                            //                   : Image.asset(
                            //                       'assets/gg.png',
                            //                       height: 10,
                            //                       color: Colors.white,
                            //                       // height: 15,
                            //                       // fit: BoxFit.cover,
                            //                     );
                            //             },
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            Visibility(
                              visible: bdrawerController.visibledrop,
                              child: Container(
                                margin: EdgeInsets.only(top: 20.0, left: 60),
                                height: 110,
                                width: 250,
                                // color: Colors.amber,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.white)),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(Memberdetail());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 15),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 22,
                                              width: 22,
                                              // padding: const EdgeInsets.all(0.0),
                                              child: Image.asset(
                                                'assets/ff.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                "Members Details",
                                                style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(Memberdetail());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 15),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 22,
                                              width: 22,
                                              // padding: const EdgeInsets.all(0.0),
                                              child: Image.asset(
                                                'assets/ed.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                "Education Details",
                                                style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            ListTile(
                              leading: SizedBox(
                                height: 25,
                                width: 22,
                                // padding: const EdgeInsets.all(0.0),
                                child: Image.asset(
                                  'assets/att.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                "Receipt List",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                Get.to(PaymentDetails());
                              },
                            ),

                            // InkWell(
                            //   onTap: () {
                            //     Get.to(PaymentDetails());
                            //     // bdrawerController.sidedrawer(0);
                            //     // bdrawerController.update();
                            //     // Get.back();
                            //   },
                            //   child: Padding(
                            //     padding:
                            //         const EdgeInsets.only(left: 20.0, top: 30),
                            //     child: Row(
                            //       children: [
                            //         SizedBox(
                            //           height: 25,
                            //           width: 22,
                            //           // padding: const EdgeInsets.all(0.0),
                            //           child: Image.asset(
                            //             'assets/att.png',
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           width: 20,
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(
                            //               top: 5.0, left: 5),
                            //           child: Text(
                            //             "Receipt List",
                            //             style: TextStyle(
                            //               fontFamily: "Nunito",
                            //               fontSize: 18,
                            //               fontWeight: FontWeight.bold,
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            ListTile(
                              leading: Image.asset(
                                'assets/cme logo 1.png',
                                height: 22,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                "Online CME Programs",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                Get.to(Onlinecmeprogram());
                              },
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     Get.to(Onlinecmeprogram());
                            //     // bdrawerController.sidedrawer(0);
                            //     // bdrawerController.update();
                            //     // Get.back();
                            //   },
                            //   child: Padding(
                            //     padding:
                            //         const EdgeInsets.only(left: 20.0, top: 30),
                            //     child: Row(
                            //       children: [
                            //         Padding(
                            //           padding: const EdgeInsets.only(top: 5.0),
                            //           child: Image.asset(
                            //             'assets/cme logo 1.png',
                            //             height: 22,
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           width: 20,
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(top: 5.0),
                            //           child: Text(
                            //             "Online CME Programs",
                            //             style: TextStyle(
                            //               fontFamily: "Nunito",
                            //               fontSize: 18,
                            //               fontWeight: FontWeight.bold,
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            ListTile(
                              leading: SizedBox(
                                height: 22,
                                child: Image.asset(
                                  'assets/at.png',
                                  fit: BoxFit.cover,
                                  // height: 22,
                                  // width: 22,
                                ),
                              ),
                              title: Text(
                                "Attended CME Programms and points",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              onTap: () {
                                Get.to(Cmepoints());
                              },
                            ),
                            // InkWell(
                            //   onTap: () {
                            //     Get.to(Cmepoints());
                            //     // bdrawerController.sidedrawer(0);
                            //     // bdrawerController.update();
                            //     // Get.back();
                            //   },
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(left: 20.0),
                            //     child: Row(
                            //       children: [
                            //         SizedBox(
                            //           height: 22,
                            //           child: Image.asset(
                            //             'assets/at.png',
                            //             fit: BoxFit.cover,
                            //             // height: 22,
                            //             // width: 22,
                            //           ),
                            //         ),
                            //         SizedBox(
                            //           width: 30,
                            //         ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(top: 15.0),
                            //           child: SizedBox(
                            //             width: context.width * 0.5,
                            //             child: Transform(
                            //               transform: Matrix4.translationValues(
                            //                   0, 15, 0),
                            //               child: Text(
                            //                 "Attended CME Programms and points",
                            //                 style: TextStyle(
                            //                   fontFamily: "Nunito",
                            //                   fontSize: 18,
                            //                   fontWeight: FontWeight.bold,
                            //                   color: Colors.white,
                            //                 ),
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),

                            // const SizedBox(
                            //   height: 25,
                            // ),

                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor:
                                    Colors.white, // here for close state
                                colorScheme: ColorScheme.light(
                                  primary: Colors.white,
                                ), // here for open state in replacement of deprecated accentColor
                                dividerColor: Colors
                                    .transparent, // if you want to remove the border
                              ),
                              child: ExpansionTile(
                                leading: SizedBox(
                                  height: 25,
                                  width: 22,
                                  // padding: const EdgeInsets.all(0.0),
                                  child: Image.asset(
                                    'assets/Untitled.png',
                                    // height: 15,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  "PG NEET / PG CET",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(top: 20.0, left: 60),
                                    height: 140,
                                    width: 250,
                                    // color: Colors.amber,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        border:
                                            Border.all(color: Colors.white)),
                                    child: Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.to(const TestScreen());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 15),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 22,
                                                  width: 22,
                                                  // padding: const EdgeInsets.all(0.0),
                                                  child: Image.asset(
                                                    'assets/ff.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                    "TEST",
                                                    style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(ResultScreen());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 15),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 22,
                                                  width: 22,
                                                  // padding: const EdgeInsets.all(0.0),
                                                  child: Image.asset(
                                                    'assets/ed.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                    "RESULT",
                                                    style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.to(ReceiptScreen());
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 20.0, top: 15),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 22,
                                                  width: 22,
                                                  // padding: const EdgeInsets.all(0.0),
                                                  child: Image.asset(
                                                    'assets/ed.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                    "RECEIPTS",
                                                    style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                // trailing: Padding(
                                //   padding:
                                //       const EdgeInsets.only(left: 8.0, top: 0),
                                //   child: GetBuilder<DashboardController>(
                                //     builder: (controller) {
                                //       return controller.visibleDropOne
                                //           ? Image.asset(
                                //               'assets/ffe.png',
                                //               height: 10,
                                //               color: Colors.white,
                                //             )
                                //           : Image.asset(
                                //               'assets/gg.png',
                                //               height: 10,
                                //               color: Colors.white,
                                //             );
                                //     },
                                //   ),
                                // ),
                                // onTap: () {
                                //   bdrawerController.visibleDropOne =
                                //       !bdrawerController.visibleDropOne;
                                //   bdrawerController.update();
                                // },
                              ),
                            ),

                            // InkWell(
                            //   onTap: () {
                            //     // scrollToTop();
                            //     controller.animateTo(5,
                            //         duration: Duration(seconds: 5),
                            //         curve: Curves.easeIn);
                            //     bdrawerController.visibleDropOne =
                            //         !bdrawerController.visibleDropOne;
                            //     bdrawerController.update();
                            //   },
                            //   child: Padding(
                            //     padding: const EdgeInsets.only(
                            //         right: 20, left: 20.0, top: 10),
                            //     child: Row(
                            //       children: [
                            //         SizedBox(
                            //           height: 25,
                            //           width: 22,
                            //           // padding: const EdgeInsets.all(0.0),
                            //           child: Image.asset(
                            //             'assets/Untitled.png',
                            //             // height: 15,
                            //             fit: BoxFit.cover,
                            //           ),
                            //         ),
                            //         const SizedBox(
                            //           width: 20,
                            //         ),
                            //         const Padding(
                            //           padding:
                            //               EdgeInsets.only(top: 5.0, left: 5),
                            //           child: Text(
                            //             "PG NEET / PG CET",
                            //             style: TextStyle(
                            //               fontSize: 18,
                            //               fontFamily: "Nunito",
                            //               fontWeight: FontWeight.bold,
                            //               color: Colors.white,
                            //             ),
                            //           ),
                            //         ),
                            //         const Spacer(),
                            //         // SizedBox(
                            //         //   width: 100,
                            //         // ),
                            //         Padding(
                            //           padding: const EdgeInsets.only(
                            //               left: 8.0, top: 0),
                            //           child: GetBuilder<DashboardController>(
                            //             builder: (controller) {
                            //               return controller.visibleDropOne
                            //                   ? Image.asset(
                            //                       'assets/ffe.png',
                            //                       height: 10,
                            //                       color: Colors.white,
                            //                     )
                            //                   : Image.asset(
                            //                       'assets/gg.png',
                            //                       height: 10,
                            //                       color: Colors.white,
                            //                     );
                            //             },
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            ListTile(
                              onTap: () async {
                                SharedPreferences sessionlog =
                                    await SharedPreferences.getInstance();
                                sessionlog.remove("log_name");
                                Get.to(Login());
                              },
                              leading: SizedBox(
                                height: 25,
                                width: 25,
                                // padding: const EdgeInsets.all(0.0),
                                child: Image.asset(
                                  'assets/lgot.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                "Logout",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),

                            Visibility(
                              visible: bdrawerController.visibleDropOne,
                              child: Container(
                                margin: EdgeInsets.only(top: 20.0, left: 60),
                                height: 140,
                                width: 250,
                                // color: Colors.amber,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: Colors.white)),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Get.to(const TestScreen());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 15),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 22,
                                              width: 22,
                                              // padding: const EdgeInsets.all(0.0),
                                              child: Image.asset(
                                                'assets/ff.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                "TEST",
                                                style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(ResultScreen());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 15),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 22,
                                              width: 22,
                                              // padding: const EdgeInsets.all(0.0),
                                              child: Image.asset(
                                                'assets/ed.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                "RESULT",
                                                style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.to(ReceiptScreen());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20.0, top: 15),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 22,
                                              width: 22,
                                              // padding: const EdgeInsets.all(0.0),
                                              child: Image.asset(
                                                'assets/ed.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 5.0),
                                              child: Text(
                                                "RECEIPTS",
                                                style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // bdrawerController.visibledrop == true &&
                            //         bdrawerController.visibledrop == true
                            //     ? const SizedBox(
                            //         height: 170,
                            //       )
                            //     : SizedBox(),

                            context.width > 410
                                ? SizedBox(
                                    height: bdrawerController.visibledrop
                                        ? context.height * 0.05
                                        : context.height * 0.2,
                                  )
                                : SizedBox(
                                    height: bdrawerController.visibledrop
                                        ? context.height * 0.0
                                        : context.height * 0.0,
                                  ),
                            //   context.width>410? SizedBox(
                            //     height: bdrawerController.visibleDropOne
                            //         ? context.height * 0.05
                            //         : context.height * 0.2,
                            //   )
                            // : SizedBox(
                            //     height: bdrawerController.visibleDropOne
                            //         ? context.height * 0.0
                            //         : context.height * 0.1,
                            //   ),
                          ]),
                        ),
                      ),
                      // Divider(
                      //   thickness: 2,
                      //   color: Colors.white,
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.all(20.0),
                      //   child: Row(
                      //     children: [
                      //       SizedBox(
                      //         height: 25,
                      //         width: 25,
                      //         // padding: const EdgeInsets.all(0.0),
                      //         child: Image.asset(
                      //           'assets/lgot.png',
                      //           fit: BoxFit.cover,
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 20,
                      //       ),
                      //       GestureDetector(
                      //         onTap: () async {
                      //           SharedPreferences sessionlog =
                      //               await SharedPreferences.getInstance();
                      //           sessionlog.remove("log_name");
                      //           Get.to(Login());
                      //         },
                      //         child: Padding(
                      //           padding: const EdgeInsets.only(top: 8.0),
                      //           child: Text(
                      //             "Logout",
                      //             style: TextStyle(
                      //                 fontFamily: "Nunito",
                      //                 fontSize: 20,
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.bold),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Center(
                          child: Text(
                        "Copyright @ 2022",
                        style: TextStyle(
                          fontFamily: "Nunito",
                        ),
                      )),
                      Center(
                          child: Text(
                        "All Right Received",
                        style: TextStyle(
                          fontFamily: "Nunito",
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  scrollToTop() {
    Timer(
      Duration(seconds: 0),
      () => controller.animateTo(5,
          curve: Curves.easeOut, duration: const Duration(seconds: 10)),
    );
  }
}
