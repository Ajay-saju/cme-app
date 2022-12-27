import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/models/get_reciepts.dart';

import '../../main.dart';
import '../../models/get_cme_list_model.dart';
import '../../services/cme_list_service.dart';
import '../../services/user_payment_service.dart';

class DashboardController extends GetxController {
//  @override
//   void onClose() {
//    drawerKey.close();
//     super.onClose();
//   }

  Rx<GetPayment> getpaymentList = GetPayment().obs;
  Future<GetPayment?> getRecieptList() async {
    final mId = await sessionlog.getString('userId');
    final getPaymentService = GetPaymentService();

    try {
      final response = await getPaymentService.getPaymentDetails(mId);
      log(response.statusCode.toString());
      var jsonFile = jsonDecode(response.data);
      if (response.statusCode == 200) {
        getpaymentList.value = GetPayment.fromJson(jsonFile);
        print(getpaymentList.value.userData1![0].date);
      }
    } catch (e) {}
  }

  Rx<GetCmeList> cmeList = GetCmeList().obs;

  Future<GetCmeList?> getCmeList() async {
    final cmeListService = CmeListService();

    try {
      final response = await cmeListService.getCmeList();
      log(response.statusCode.toString());
      var jsonFile = jsonDecode(response.data);
      if (response.statusCode == 200) {
        cmeList.value = GetCmeList.fromJson(jsonFile);
      
      }
    } catch (e) {}
  }

  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  bool iconOne = false;
  bool iconTwo = false;
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

  void changeTabIndex(int index) {
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
