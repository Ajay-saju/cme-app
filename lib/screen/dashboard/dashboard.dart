import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
import 'package:hslr/Widget/buttonwidget.dart';
import 'package:hslr/screen/bottomdrawer/bottomdrawer.dart';
// import 'package:hslr/screen/cme_program/cme_prog.dart';
// import 'package:hslr/screen/creat_account/create_account.dart';
import 'package:hslr/screen/dashboard/dashboard_controller.dart';
// import 'package:hslr/screen/forgotpassword/forgot_password.dart';
import 'package:hslr/screen/home.dart/home.dart';
// import 'package:hslr/screen/login/login_controller.dart';
// import 'package:hslr/screen/my_profile/my_profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  DashboardController dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (dashboardController.tabIndex != 0) {
          dashboardController.tabIndex = 0;
          dashboardController.update();
          return Future.value(false);
        } else {
          // return Future.value(true);
          Get.defaultDialog(
              title: 'Alert',
              content: Column(
                children: [
                  const Text('Are you Sure!'),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonWidget(
                            text: 'Back',
                            onClicked: () {
                              Get.back();
                            }),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ButtonWidget(
                            text: 'Exit',
                            onClicked: () {
                              // Future.value(true);
                              exit(0);
                            }),
                      ),
                    ],
                  )
                ],
              ));
        }
        return Future.value(false);
      },
      child: GetBuilder<DashboardController>(
        builder: ((_) {
          //  var user_id = dashboardController.userid;
          return Scaffold(
            key: dashboardController.drawerKey,
            drawer: const BottomDrawer(),
            body: SafeArea(
              child: IndexedStack(
                index: dashboardController.tabIndex,
                children: const [
                  Home(),
                  // CmeProgram(),
                  // MyProfile(),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                unselectedItemColor:const Color(0xffC8C8C8), //Colors.blue.shade200,
                selectedItemColor: Colors
                    .black87, //Color(0xffC8C8C8), //Colors.blue.shade700,00000
                onTap: dashboardController.changeTabIndex,
                currentIndex: dashboardController.tabIndex,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: const [
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/hm.png")),
                    label: "",
                  ),
                  // BottomNavigationBarItem(
                  //   icon: ImageIcon(AssetImage("assets/V.png")),
                  //   label: "",
                  // ),
                  // BottomNavigationBarItem(
                  //   icon: ImageIcon(AssetImage("assets/p.png")),
                  //   label: "",
                  // ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(AssetImage("assets/nd.png")),
                    label: "",
                  ),
                ]),
            // ),
          );
        }),
      ),
    );
  }
}
