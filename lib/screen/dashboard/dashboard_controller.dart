import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/base_api/orginal_api.dart';
import 'package:hslr/models/all_cme_video_model.dart';
import 'package:hslr/models/dashboard_data_models.dart';
import 'package:hslr/models/get_eduid_list.model.dart';
import 'package:hslr/models/get_reciepts.dart';
import 'package:hslr/models/user_details.dart';
import 'package:hslr/services/all_cme_video_service.dart';
import 'package:hslr/services/get_eduid_list_servise.dart';
import 'package:hslr/services/user_profile_service/get_user_profile_service.dart';
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
  static GlobalKey<ScaffoldState> drawerKey = GlobalKey();

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
    print('working education list...');
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

  var profilePick;
  Future getUserProfilePick() async {
    final proPicService = UserPickService();
    try {
      final response = await proPicService.getProfilePick(
          mid: sessionlog.getString('userId').toString(),
          stateId: sessionlog.getString('stateId'),
          contryId: sessionlog.getInt('country'),
          councilId: sessionlog.getString('councilId'));
      if (response.statusCode == 200) {
        // var temp = response.data.replaceAll('https', "http");
        // var ok = temp.replaceAll(" \", " /");
        profilePick = response.data.replaceAll('https', "http");
        print(profilePick);
        print('=================================');

        await sessionlog.setString('proPick', response.data);
        // print(sessionlog.getString('proPick'));
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

  UserCmeVideo? userCmeVideo;
  UserCmeVideoPurchese? userCmeVideoPurchese;
  UserCmeVideoLastTest? userCmeVideoLastTest;
  getDashboardData() async {
    OrginalApi orginalApi = OrginalApi();
    final dio = Dio(BaseOptions(
        //
        baseUrl: orginalApi.baseUrl,
        responseType: ResponseType.plain));

    try {
      var responseUserCme_Last_Test = await dio.get('UserCme_Last_Test',
          queryParameters: {
            'Mid12': sessionlog.getString('userId').toString()
          });
      //
      //

      if (responseUserCme_Last_Test.statusCode == 200
          // &&
          // responseUserCme_video_PURCHES.statusCode == 200 &&
          //
          ) {
        userCmeVideoLastTest = UserCmeVideoLastTest.fromJson(
            jsonDecode(responseUserCme_Last_Test.data));
        print(userCmeVideoLastTest!.latest.toString());
      }
    } on DioError catch (e) {
      print(e.message);
      Get.defaultDialog(
          title: 'Something is wrong',
          middleText: "Please try again",
          middleTextStyle: TextStyle(
            fontFamily: "Nunito",
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          titleStyle: TextStyle(
            fontFamily: "Nunito",
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ));
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  getUserCmeVideo() async {
    OrginalApi orginalApi = OrginalApi();
    final dio = Dio(BaseOptions(
        //
        baseUrl: orginalApi.baseUrl,
        responseType: ResponseType.plain));
    try {
      var responseUserCme_video = await dio.get('UserCme_video',
          queryParameters: {
            "CategoryId": sessionlog.getString('catId').toString()
          });
      if (responseUserCme_video.statusCode == 200) {
        userCmeVideo =
            UserCmeVideo.fromJson(jsonDecode(responseUserCme_video.data));
      }
    } on DioError catch (e) {
      print(e.message);
      Get.defaultDialog(
          title: 'Something is wrong',
          middleText: "Please try again",
          middleTextStyle: TextStyle(
            fontFamily: "Nunito",
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          titleStyle: TextStyle(
            fontFamily: "Nunito",
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ));
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  getUserCmeVideoPurchese() async {
    OrginalApi orginalApi = OrginalApi();
    final dio = Dio(BaseOptions(
        //
        baseUrl: orginalApi.baseUrl,
        responseType: ResponseType.plain));
    try {
      var responseUserCme_video_PURCHES = await dio.get("UserCme_video_PURCHES",
          queryParameters: {
            'Mid11': sessionlog.getString('userId').toString()
          });
      if (responseUserCme_video_PURCHES.statusCode == 200) {
        userCmeVideoPurchese = UserCmeVideoPurchese.fromJson(
            jsonDecode(responseUserCme_video_PURCHES.data));
      }
    } on DioError catch (e) {
      print(e.message);
      Get.defaultDialog(
          title: 'Something is wrong',
          middleText: "Please try again",
          middleTextStyle: TextStyle(
            fontFamily: "Nunito",
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          titleStyle: TextStyle(
            fontFamily: "Nunito",
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ));
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Rx<UserDetails> getUserDetails = UserDetails().obs;
  Future<UserDetails?> getUserData(String mId) async {
    final getUserDetailsService = GetUserDetailsService();

    try {
      final response = await getUserDetailsService.getUserProfile(mId);

      var jsonFile = jsonDecode(response.data);
      print(response.statusCode.toString());

      log(response.data);

      if (response.statusCode == 200) {
        print('json working');
        getUserDetails.value = UserDetails.fromJson(jsonFile);
        print(getUserDetails.value.loginName);
        // username = sessionlog.getString('log_name');
        sessionlog.setString('log_name', getUserDetails.value.loginName!);
        // await getUserProfilePick(
        //     mid: userLogin.value.userId,
        //     conId: userLogin.value.countryId,
        //     stateId: userLogin.value.stateId,
        //     counId: userLogin.value.councilId);

        // await getUserLastLogin(mId);

      } else {
        // isfade = true;
        Get.defaultDialog(
            title: 'Something is wrong', middleText: 'Please try again');
      }
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
      return null;
    }
    update();
    return null;
  }

  // Rx<AllCmeVideos?> allCmeVideos = AllCmeVideos().obs;
  // Future getAllVideos() async {
  //   final allCmeVideoService = AllCmeVideoService();

  //   try {
  //     var response = await allCmeVideoService.getAllVideo();
  //     if (response.statusCode == 200) {
  //       allCmeVideos.value = AllCmeVideos.fromJson(jsonDecode(response.data));
  //       print(allCmeVideos.value!.videoList![0].speakerName);
  //     }
  //   } catch (e) {}
  // }
}
