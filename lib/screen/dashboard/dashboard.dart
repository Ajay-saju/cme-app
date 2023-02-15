import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/main.dart';
import 'package:hslr/screen/bottomdrawer/bottomdrawer.dart';
import 'package:hslr/screen/dashboard/dashboard_controller.dart';
import 'package:hslr/screen/home.dart/home.dart';
import 'package:hslr/screen/profile_tab/profile_tab.dart';

ValueNotifier<int> indexChaingeNotifier = ValueNotifier(0);

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final screens = [
    // BottomDrawer(),

    Home(),
    ProfileScreenTab(),
  ];
  DashboardController dashboardController = Get.put(DashboardController());
  // final logCOntroller = Get.find<LoginController>();
  // static final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    indexChaingeNotifier = ValueNotifier(0);
    dashboardController.getUserData(sessionlog.getString('userId').toString());
    dashboardController.getuserDashboardData(); 
    dashboardController.getUserProfilePick();
    dashboardController.getRecieptList();
    dashboardController.getCmeList();
    dashboardController.getEduList();
    dashboardController.getEduIdList();
  }

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
              // backgroundColor: Colors.black87,
              title: 'Are you Sure!',
              titleStyle: TextStyle(
                fontFamily: "Nunito",
                color: Colors.black87,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              middleText: 'Do you really want to exit from this application',
              middleTextStyle: TextStyle(
                fontFamily: "Nunito",
                color: Colors.black87,
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              borderRadius: BorderRadius.circular(30),
                            )),
                      ),
                    ),
                    // Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Text(
                          'Exit',
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
                              borderRadius: BorderRadius.circular(30),
                            )),
                      ),

                      // child: ButtonWidget(
                      //     text: 'Exit',
                      //     onClicked: () {
                      //       // Future.value(true);
                      //       exit(0);
                      //     }),
                    ),
                  ],
                )
              ]);
        }
        return Future.value(false);
      },
      child: GetBuilder<DashboardController>(
        builder: ((_) {
          //  var user_id = dashboardController.userid;
          return
              //
              Scaffold(
            key: DashboardController.drawerKey,
            drawer: const BottomDrawer(),
            body: SafeArea(
              child: dashboardController.getUserDetails.value.loginName == null
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black87,
                        strokeWidth: 1.5,
                      ),
                    )
                  : Stack(
                      // index: dashboardController.tabIndex,
                      children: [
                        ValueListenableBuilder(
                            valueListenable: indexChaingeNotifier,
                            builder: (context, int index, _) {
                              return screens[index];
                            })
                      ],
                    ),
            ),
            bottomNavigationBar: ValueListenableBuilder(
                valueListenable: indexChaingeNotifier,
                builder: (context, int newIndex, _) {
                  return BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      // unselectedItemColor: Colors.black87, //Colors.blue.shade200,
                      // selectedItemColor: Colors
                      //     .black87, //Color(0xffC8C8C8), //Colors.blue.shade700,00000
                      onTap: dashboardController.changeTab,
                      // onTap: (index) {
                      //   indexChaingeNotifier.value = index;
                      //   // dashboardController.changeTabIndex;
                      // },
                      currentIndex: dashboardController.tabIndex,
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      items: const [
                        BottomNavigationBarItem(
                          icon: ImageIcon(AssetImage("assets/nd.png"),
                              color: Colors.black87),
                          label: "",
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage("assets/hm.png"),
                            color: Colors.black87,
                          ),
                          label: "",
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(
                            Icons.account_circle_rounded,
                            size: 30,
                            color: Colors.black87,
                          ),
                          //  ImageIcon(
                          //   AssetImage("assets/profile.png"),
                          //   color: Colors.black87,
                          // ),

                          label: "",
                        ),
                      ]);
                }),
            // ),
          );
        }),
      ),
    );
  }
}
