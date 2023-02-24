import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/main.dart';
import 'package:hslr/screen/cmeprogrm_points/cme_points.dart';
import 'package:hslr/screen/dashboard/dashboard_controller.dart';
import 'package:hslr/screen/downloaded_videos/video_list.dart';
import 'package:hslr/screen/login/login.dart';
import 'package:hslr/screen/login/login_controller.dart';
import 'package:hslr/screen/member_details/member_details.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram.dart';
import 'package:hslr/screen/paymentdetails/paymentdetails.dart';
import 'package:hslr/screen/test_screen/testscreen.dart';
import 'package:url_launcher/url_launcher.dart';

class BottomDrawer extends StatefulWidget {
  const BottomDrawer({Key? key}) : super(key: key);

  @override
  State<BottomDrawer> createState() => _BottomDrawerState();
}

class _BottomDrawerState extends State<BottomDrawer> {
  ScrollController controller = ScrollController();
  DashboardController bdrawerController = Get.put(DashboardController());
  LoginController loginController = Get.find();

  final pick = sessionlog.getString('proPick')!.replaceAll("https", 'http');

  final Uri _url = Uri.parse('http://www.vworks.co.in/');

  @override
  Widget build(BuildContext context) {
    // print(bdrawerController.profilePick.replaceAll('"', ''));
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
                            InkWell(
                              onTap: () {
                                // Get.to(ChangeProfilePicture());
                              },
                              child: CircleAvatar(
                                child: bdrawerController.profilePick == null ||
                                        pick == "No Photo Available"
                                    ? Text('')
                                    //  Icon(
                                    //     Icons.add_a_photo_rounded,
                                    //     color: Colors.black87,
                                    //     size: 30,
                                    //   )
                                    : null,
                                backgroundImage: Image.network(
                                        bdrawerController.profilePick == null
                                            ? pick.replaceAll('"', '')
                                            : bdrawerController.profilePick
                                                .replaceAll('"', ''))
                                    .image,
                                radius: 25.0,
                                backgroundColor: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: context.width * 0.05,
                            ),
                            // Spacer(),
                            Container(
                              // color: Colors.black87,
                              width: 200,
                              height: 30,
                              child: Text(
                                bdrawerController
                                        .getUserDetails.value.loginName ??
                                    '',
                                //     null
                                // ? " "
                                // : bdrawerController
                                //     .getUserDetails.value.loginName
                                //     .toString(),
                                style: TextStyle(
                                  // overflow: TextOverflow.fade,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Nunito",
                                  color: Colors.white,
                                ),
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
                        // height: context.width > 410
                        //     ? context.height * 0.9
                        //     : context.height * 0.70,
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
                                leading: Image.asset(
                                  'assets/event.png',
                                  color: Colors.white,
                                  height: 22,
                                  fit: BoxFit.cover,
                                ),
                                title: Text(
                                  'CME',
                                  style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 60),
                                    height: 200,
                                    width: 250,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.white),
                                        borderRadius:
                                            BorderRadius.circular(10.0)),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, top: 15),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(Onlinecmeprogram());
                                            },
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 22,
                                                  child: Image.asset(
                                                    'assets/cme logo 1.png',
                                                    // height: 22,
                                                    // width: 22,
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
                                                    "Online CME",
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25.0, top: 15),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(Cmepoints());
                                            },
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 22,
                                                  child: Image.asset(
                                                    'assets/at.png',
                                                    // height: 22,
                                                    // width: 22,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                    "Attented CME",
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25.0, top: 15, bottom: 10),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(PaymentDetails());
                                            },
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 22,
                                                  child: Image.asset(
                                                    'assets/att.png',
                                                    // height: 22,
                                                    // width: 22,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 22,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                    "CME Receipts",
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
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 25),
                                          child: InkWell(
                                            onTap: () {
                                              Get.to(VideoListScreen());
                                            },
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 22,
                                                  child: Image.asset(
                                                    'assets/att.png',
                                                    // height: 22,
                                                    // width: 22,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 22,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5.0),
                                                  child: Text(
                                                    "Your Videos",
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
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
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
                                  "CET / NEET",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: "Nunito",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 60),
                                    height: 100,
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
                                                    "CET / NEET Test",
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
                                            Get.to(Cmepoints());
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
                                                    "Result",
                                                    style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 19,
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
                            ListTile(
                              onTap: () async {
                                Get.defaultDialog(
                                  title: 'Are you sure',
                                  titleStyle: TextStyle(
                                    fontFamily: "Nunito",
                                    color: Colors.black87,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  middleText: 'Do you want to Logout  ?',
                                  middleTextStyle: TextStyle(
                                    fontFamily: "Nunito",
                                    color: Colors.black87,
                                    fontSize: 16,
                                    // fontWeight: FontWeight.bold,
                                  ),
                                  actions: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            child: Text(
                                              'Back',
                                              style: TextStyle(
                                                fontFamily: "Nunito",
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black87,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                )),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              sessionlog.remove("log_name");
                                              sessionlog.remove('userId');
                                              sessionlog.remove('proPick');

                                              Get.offAll(Login());
                                            },
                                            child: Text(
                                              'Logout',
                                              style: TextStyle(
                                                fontFamily: "Nunito",
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black87,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                )),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                );
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
                            // context.width > 410
                            //     ? SizedBox(
                            //         height: bdrawerController.visibledrop
                            //             ? context.height * 0.01
                            //             : context.height * 0.2,
                            //       )
                            //     : SizedBox(
                            //         height: bdrawerController.visibledrop
                            //             ? context.height * 0.0
                            //             : context.height * 0.0,
                            //       ),
                          ]),
                        ),
                      ),
                      Spacer(),
                      Center(
                          child: Text(
                        "Copyright @ 2022 All Right Received",
                        style: TextStyle(
                          fontFamily: "Nunito",
                        ),
                      )),
                      Center(
                          child: Text(
                        "V Works Software Pvt. Ltd.",
                        style: TextStyle(
                          fontFamily: "Nunito",
                        ),
                      )),
                      Center(
                        child: InkWell(
                          onTap: () async {
                            // const url = 'http://www.vworks.co.in/';
                            if (await launchUrl(_url,
                                mode: LaunchMode.inAppWebView)) {
                              await launchUrl(_url,
                                  mode: LaunchMode.inAppWebView);
                            } else {
                              throw 'Could not launch $_url';
                            }
                          },
                          child: Text(
                            'www.vworks.co.in',
                            style: TextStyle(
                              fontFamily: "Nunito",
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
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

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  scrollToTop() {
    Timer(
      Duration(seconds: 0),
      () => controller.animateTo(5,
          curve: Curves.easeOut, duration: const Duration(seconds: 10)),
    );
  }
}
