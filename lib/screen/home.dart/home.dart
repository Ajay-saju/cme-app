import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/main.dart';
import 'package:hslr/screen/dashboard/dashboard_controller.dart';
import 'package:hslr/screen/login/login_controller.dart';

import '../change_profile_pick/change_profile_pick_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  LoginController logController = Get.put(LoginController());
  DashboardController dashController = Get.find();
  final pick = sessionlog.getString('proPick')!.replaceAll("https", 'http');

  @override
  Widget build(BuildContext context) {
    print(pick.toString());
    print(dashController.profilePick.toString());
    // final date  =
    int _selectedIndex = 0;
    return GetBuilder<DashboardController>(
      builder: ((_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white, //Color(0xff63c3fe),
            body: SafeArea(
              child: dashController.getUserDetails.value.loginName == null &&
                      dashController.dateTime.value == null &&
                      dashController.dashBordData.value == ''
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black87,
                        strokeWidth: 2,
                      ),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Container(
                        //   margin: EdgeInsets.only(top: 10),
                        //   height: context.height * 0.09,
                        //   width: context.width,
                        //   color: Colors.white, //Color(0xff63c3fe),
                        //   child:
                        // SizedBox(
                        //     height: 25,
                        //     width: 25,
                        //     // padding: const EdgeInsets.all(0.0),
                        //     child: Image.asset(
                        //       'assets/FB.png',
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: context.height * 0.1,
                              width: context.width * 0.8,
                              // padding: const EdgeInsets.all(0.0),
                              child: Image.asset(
                                'assets/FB.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                              ),
                              child: InkWell(
                                onTap: () {
                                  // Get.to(ChangeProfilePicture());
                                },
                                child: CircleAvatar(
                                  radius: 28,
                                  child: dashController.profilePick == null &&
                                          pick == "No Photo Available"
                                      ? Icon(
                                          Icons.add_a_photo_rounded,
                                          size: 30,
                                        )
                                      : null,
                                  backgroundImage: Image.network(
                                          dashController.profilePick == null
                                              ? pick.replaceAll('"', '')
                                              : dashController.profilePick
                                                  .replaceAll('"', ''))
                                      .image,
                                  backgroundColor: Colors.black87,
                                ),
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: context.width > 410
                              ? context.height * 0.75
                              : context.height * 0.73,
                          width: 450,
                          child: SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(
                                    "Dashboard",
                                    style: TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Nunito",
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 20.0, left: 20),
                                  height: context.width > 410
                                      ? context.height * 0.15
                                      : context.height * 0.16,
                                  width: context.height * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color.fromARGB(
                                        255, 23, 162, 184), //9ac3a1
                                    shape: BoxShape.rectangle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          spreadRadius: 0.0,
                                          blurRadius: 5,
                                          offset: const Offset(3.0, 3.0)),
                                      const BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 2.0,
                                          blurRadius: 2,
                                          offset: Offset(-1.0, -1.0)),
                                      const BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 3.0,
                                          blurRadius: 5 / 2,
                                          offset: Offset(-1.0, -1.0)),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 20.0, left: 20.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              "Last Logged in",
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: context.width > 410
                                                      ? 25
                                                      : 20,
                                                  color: Colors.white),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 40,
                                                  top: 8,
                                                  bottom: 8),
                                              child: Text(
                                                dashController.dateTime.value ==
                                                        ''
                                                    ? ""
                                                    : dashController.dateTime
                                                            .value.isNotEmpty
                                                        ? dashController
                                                            .dateTime.value[0]
                                                            .toString()
                                                        : ' - - - ',
                                                style: TextStyle(
                                                    fontFamily: "Nunito",
                                                    fontSize:
                                                        context.width > 410
                                                            ? 20
                                                            : 18,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 65),
                                              child: Text(
                                                dashController.dateTime
                                                            .value.isNotEmpty
                                                        ? dashController
                                                            .dateTime.value[1]
                                                            .toString()
                                                        : ' - - - ',
                                                style: TextStyle(
                                                    fontFamily: "Nunito",
                                                    fontSize:
                                                        context.width > 410
                                                            ? 20
                                                            : 18,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20.0, left: 20),
                                  height: context.height * 0.15,
                                  width: context.height * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color.fromARGB(
                                        255, 111, 66, 193), //,be99c2
                                    shape: BoxShape.rectangle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          spreadRadius: 0.0,
                                          blurRadius: 5,
                                          offset: const Offset(3.0, 3.0)),
                                      // BoxShadow(
                                      //     color: Colors.grey.shade400,
                                      //     spreadRadius: 0.0,
                                      //     blurRadius: 5 / 2.0,
                                      //     offset: const Offset(3.0, 3.0)),
                                      const BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 2.0,
                                          blurRadius: 2,
                                          offset: Offset(-1.0, -1.0)),
                                      const BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 3.0,
                                          blurRadius: 5 / 2,
                                          offset: Offset(-1.0, -1.0)),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 12.0, left: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Last Test Taken",
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: context.width > 410
                                                      ? 25
                                                      : 20,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              dashController.dashBordData.value
                                                          .lastTest ==
                                                      null
                                                  ? " "
                                                  : dashController
                                                      .dashBordData
                                                      .value
                                                      .lastTest![0]
                                                      .lastTest
                                                      .toString(),
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: context.width > 410
                                                      ? 20
                                                      : 18,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20.0, left: 20),
                                  height: context.height * 0.15,
                                  width: context.height * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color.fromARGB(
                                        255, 28, 175, 154), //,c1bc9b
                                    shape: BoxShape.rectangle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          spreadRadius: 0.0,
                                          blurRadius: 5,
                                          offset: const Offset(3.0, 3.0)),
                                      // BoxShadow(
                                      //     color: Colors.grey.shade400,
                                      //     spreadRadius: 0.0,
                                      //     blurRadius: 5 / 2.0,
                                      //     offset: const Offset(3.0, 3.0)),
                                      const BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 2.0,
                                          blurRadius: 2,
                                          offset: Offset(-1.0, -1.0)),
                                      const BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 3.0,
                                          blurRadius: 5 / 2,
                                          offset: Offset(-1.0, -1.0)),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.0, left: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Lastest Video Uploaded",
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: context.width > 410
                                                      ? 25
                                                      : 20,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              dashController.dashBordData.value
                                                          .newVideolist ==
                                                      null
                                                  ? ""
                                                  : dashController
                                                      .dashBordData
                                                      .value
                                                      .newVideolist![0]
                                                      .latestV
                                                      .toString(),
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: context.width > 410
                                                      ? 25
                                                      : 20,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20.0, left: 20),
                                  height: context.height * 0.15,
                                  width: context.height * 0.35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color.fromARGB(
                                        255, 8, 102, 198), //,c1bc9b,
                                    shape: BoxShape.rectangle,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade300,
                                          spreadRadius: 0.0,
                                          blurRadius: 5,
                                          offset: const Offset(3.0, 3.0)),
                                      const BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 2.0,
                                          blurRadius: 2,
                                          offset: Offset(-1.0, -1.0)),
                                      const BoxShadow(
                                          color: Colors.white,
                                          spreadRadius: 3.0,
                                          blurRadius: 5 / 2,
                                          offset: Offset(-1.0, -1.0)),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 15.0, left: 20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Last Video Purchased",
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: context.width > 410
                                                      ? 25
                                                      : 20,
                                                  color: Colors.white),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              dashController.dashBordData.value
                                                          .lastBuyVideo ==
                                                      null
                                                  ? " "
                                                  : dashController
                                                      .dashBordData
                                                      .value
                                                      .lastBuyVideo![0]
                                                      .lastBuy
                                                      .toString(),
                                              style: TextStyle(
                                                  fontFamily: "Nunito",
                                                  fontSize: context.width > 410
                                                      ? 25
                                                      : 20,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            // bottomNavigationBar:
            //     BottomNavigationBar(items: <BottomNavigationBarItem>[
            //   BottomNavigationBarItem(
            //     icon: ImageIcon(
            //       AssetImage("assets/hm.png"),
            //       color: Colors.black87,
            //     ),
            //     label: "",
            //   ),
            //   BottomNavigationBarItem(
            //     icon: ImageIcon(AssetImage("assets/nd.png"),
            //         color: Colors.black87),
            //     label: "",
            //   ),
            // ]),
          ),
        );
      }),
    );
  }
}
