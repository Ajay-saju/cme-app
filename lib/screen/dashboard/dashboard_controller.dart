import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/base_api/orginal_api.dart';
import 'package:hslr/models/dashboard_data_models.dart';
import 'package:hslr/models/get_eduid_list.model.dart';
import 'package:hslr/models/get_reciepts.dart';
import 'package:hslr/models/user_details.dart';
import 'package:hslr/screen/login/login_controller.dart';
import 'package:hslr/screen/profile_tab/profile_tab.dart';
import 'package:hslr/services/get_eduid_list_servise.dart';
import 'package:hslr/services/user_profile_service/get_user_profile_service.dart';
import 'package:hslr/services/user_progile_pick_service.dart';
import '../../main.dart';
import '../../models/get_cme_list_model.dart';
import '../../models/get_edu_details_model.dart';
import '../../models/user_dashboard_details_model.dart';
import '../../services/cme_list_service.dart';
import '../../services/dashbord_details_service.dart';
import '../../services/education_details_service.dart';
import '../../services/user_payment_service.dart';
import 'package:intl/intl.dart';

final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

class DashboardController extends GetxController {
  static final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

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
    if (index == 0) {
      drawerKey.currentState!.openDrawer();
      tabIndex = index;
      print(index);
    } else if (index == 2) {
      tabIndex = index;
      print(index);
      print(tabIndex);
    } else {
      tabIndex = index;
      print(index);
      update();
    }
  }

  void changeTab(int index) {
    switch (index) {
      case 0:
        drawerKey.currentState!.openDrawer();

        break;
      // case 1:
      //   Get.to(Dashboard());

      //   break;

      case 2:
        Get.to(ProfileScreenTab());
        break;
      default:
        // Get.to(Home());
        break;
    }
  }

// ****User Education details****
  

  //*** user Profile picture */
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
        profilePick = response.data.replaceAll('https', "http");
        print(profilePick);
    
        await sessionlog.setString('proPick', response.data);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
    }
    update();
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
      print(responseUserCme_video.toString());
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



  var dateTime =[].obs;
  Rx<UserDashBordDetails> dashBordData = UserDashBordDetails().obs;
  Future<UserDashBordDetails?> getuserDashboardData() async {
    final dashbordService = DashbordService();
    try {
      final response = await dashbordService.getDashboardData();
      var jsonFile = jsonDecode(response.data);

      if (response.statusCode == 200) {
        dashBordData.value = UserDashBordDetails.fromJson(jsonFile);
        dateTime.value =
            getLastLogin(dashBordData.value.lastlogin![0].lastLogT.toString())
                ;
        print(dashBordData.value.lastlogin![0].lastLogT.toString());
      } else {
        Get.defaultDialog(
            barrierDismissible: false,
            title: 'Something is wrong',
            middleText:
                "User Doesn't Exist, Please enter valid phone number and pin number",
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
            ),
            actions: [OkButton.okButton('Ok')]);
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

  List getLastLogin(String data)  {
    String input = data;
    DateTime dateTime = DateTime.parse(input);

    // Format date
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    String date =  dateFormat.format(dateTime);

    // Format time
    DateFormat timeFormat = DateFormat('h:mm a');
    String time =  timeFormat.format(dateTime);
    print(date.toString());
    print(time.toString());

    return [date, time];
  }
}
