import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/main.dart';
import 'package:hslr/screen/cmeprogrm_points/cme_points.dart';
import 'package:hslr/screen/dashboard/dashboard_controller.dart';
import 'package:hslr/screen/education_details/education_screen.dart';
import 'package:hslr/screen/login/login.dart';
import 'package:hslr/screen/login/login_controller.dart';
import 'package:hslr/screen/member_details/member_details.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram.dart';
import 'package:hslr/screen/paymentdetails/paymentdetails.dart';
import 'package:hslr/screen/test_screen/testscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  // final pick = sessionlog.getString('proPick');

  final Uri _url = Uri.parse('http://www.vworks.co.in/');

  @override
  Widget build(BuildContext context) {
    // print(pick!.replaceAll('"', ''));
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
                            CircleAvatar(
                              // backgroundImage:
                              //     NetworkImage(pick!.replaceAll('"', '')),
                              // backgroundImage: NetworkImage(
                              //     loginController.profileImage.value),
                              radius: 25.0,
                              backgroundColor: Colors.white,
                            ),
                            SizedBox(
                              width: context.width * 0.05,
                            ),
                            // Spacer(),
                            Text(
                              loginController.getUserDetails.value.loginName
                                  .toString(),
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
                                    margin: EdgeInsets.only(left: 60),
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
                                            Get.to(EducationDetailsScreen());
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
                                    height: 150,
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
                                    height: 150,
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
                                                    "Test",
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
                                        InkWell(
                                          onTap: () {
                                            Get.to(PaymentDetails());
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
                                                    "Receipts",
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
                                SharedPreferences sessionlog =
                                    await SharedPreferences.getInstance();
                                sessionlog.remove("log_name");
                                Get.offAll(Login());
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
                          ]),
                        ),
                      ),
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
