import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_ticket_provider_mixin.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DashboardController extends GetxController {
  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
bool iconOne=false;
bool iconTwo =false;
  var tabIndex = 0;
  String? dropvalue;
  final dropitems = ['Members Details', 'Education Details'];
  bool visibledrop = false;
  bool visibleDropOne = false;
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
        ),
      );

  void sidedrawer(int index) {
    if (index == 0) {
      // drawerKey.currentState!.openDrawer();
      tabIndex = index;
    } else {
      tabIndex = index;
      update();
    }
  }

  void changeTabIndex( int index) {
    if (index == 1) {
      drawerKey.currentState!.openDrawer();
      tabIndex = index;
    } else {
      tabIndex = index;
      update();
    }
  }

  void iconChange() {}
}
