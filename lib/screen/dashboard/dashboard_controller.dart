import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/models/get_eduid_list.model.dart';
import 'package:hslr/models/get_reciepts.dart';
import 'package:hslr/services/get_eduid_list_servise.dart';
import 'package:hslr/services/user_progile_pick_service.dart';

import '../../main.dart';
import '../../models/get_cme_list_model.dart';
import '../../models/get_edu_details_model.dart';
import '../../services/cme_list_service.dart';
import '../../services/education_details_service.dart';
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

  Rx<GetEduDEtails> eduList = GetEduDEtails().obs;

  Future<GetEduDEtails?> getEduList() async {
    final ediListService = EducationDetalsServ();

    try {
      final response = await ediListService.getEduDetails();
      log(response.statusCode.toString());
      var jsonFile = jsonDecode(response.data);
      if (response.statusCode == 200) {
        eduList.value = GetEduDEtails.fromJson(jsonFile);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getUserProfilePick(
      {required mid,
      required contryId,
      required councilId,
      required stateId}) async {
    final proPicService = UserPickService();
    try {
      final response = await proPicService.getProfilePick(
          mid: mid, stateId: stateId, contryId: contryId, councilId: councilId);
      if (response.statusCode == 200) {
        // var temp = response.data.replaceAll('https', "http");
        // var ok = temp.replaceAll(" \", " /");
        await sessionlog.setString(
            'proPick', response.data.replaceAll('https', "http"));
        print(sessionlog.getString('proPick'));
        // profileImage = response.data;
        // print(profileImage.replaceAll('.', ''));
      }
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
    }
    update();
  }
  List<UniversityList>? universityList = [];
  List<CollegeList>? collegeList = [];
  List<CourseList>? courseList = [];
  Rx<GetEducationIdList?> eduIdList = GetEducationIdList().obs;
  getEduIdList() async {
    final eduIdListServise = EduIdListServise();

    try {
      final response = await eduIdListServise.getAllIdList();
      log(response.data);
      var jsonFile = jsonDecode(response.data);

      if (response.statusCode == 200) {
        eduIdList.value = GetEducationIdList.fromJson(jsonFile);

        universityList = eduIdList.value!.universityList!;
        collegeList = eduIdList.value!.collegeList!;
        courseList = eduIdList.value!.courseList!;
      }
    } catch (e) {}
  }
}
