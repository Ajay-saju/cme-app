import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/main.dart';
import 'package:hslr/models/user_details.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/services/last_login_service/last_login_service.dart';
import 'package:hslr/services/user_login_servise.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'dart:developer' as dp;
import '../../models/user_login_model.dart';
import '../../services/user_profile_service/get_user_profile_service.dart';
import '../../services/user_progile_pick_service.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> regformkey = GlobalKey<FormState>();

  // Rx<UserDetails> getUserDetails = UserDetails().obs;
  Rx<UserLogin> userLogin = UserLogin().obs;
  var profileImage = ''.obs;
  var isfade = true;
  List<UserDetails> user = [];

  TextEditingController mobNumb = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController formobnumb = TextEditingController();
  TextEditingController forregnumb = TextEditingController();
  TextEditingController regName = TextEditingController();
  TextEditingController regmobnum = TextEditingController();
  TextEditingController regno = TextEditingController();
  TextEditingController regpass = TextEditingController();

  var username;
  // var userId = ''.obs;
  // var councilId = ''.obs;
  // var stateId = ''.obs;
  // var roleId = ''.obs;
  // var categoryId = ''.obs;
  // int? contryId;

  bool isObscure = true;
  bool sizetext = false;
  bool creatsize = false;
  var isLOading = true.obs;
  String? dropvalue ;
  var date = ''.obs;
  var time = ''.obs;

  final dropitems = [
    'Medical',
    'Nursing',
    'Dental',
    'Ayurvedic',
  ];

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            fontFamily: "Nunito",
          ),
        ),
      );

  sizedtext() {
    sizetext = true;
    update();
    print("object:$sizetext");
  }

  creatsized() {
    sizetext = true;
    update();
    print("object:$sizetext");
  }

  void sessionlogin() async {
    SharedPreferences sessionlog = await SharedPreferences.getInstance();
    username = sessionlog.getString('log_name');
    sessionlog.setString('log_name', mobNumb.text);

    await Get.off(Dashboard());
  }

  // final otpApiCall = OtpApiCall();
  var otp = ''.obs;

  RxString phoneNo = ''.obs;
  RxBool visibility = false.obs;

  otpGenarate(String mobileNumber) {
    otp.value = grnarateOtp().toString();
    // otpApiCall.getHttp(otp.value, mobileNumber);
  }

  int grnarateOtp() {
    var rng = Random();

    var otp = (rng.nextInt(5000) + 1001);
    print(otp);
    return otp;
  }

  Future<UserLogin?> userLogIn(
      {required String mobileNo,
      required String pin,
      required int categoryId}) async {
    final userLoginService = UserLoginService();

    try {
      final response =
          await userLoginService.userLogin(mobileNo, pin, categoryId);
      print(response.toString());
      dp.log(response.statusCode.toString());
      // var jsonFile = convert.jsonDecode(response.data);

      if (response.statusCode == 200 && response.data != "User Doesn't Exist") {
        
        userLogin.value = UserLogin.fromJson(response.data);
        print(userLogin.value.userId.toString());

        await sessionlog.setString('userId', userLogin.value.userId.toString());
        var mid = await sessionlog.getString('userId');
        // await getUserData(mid!);

        await sessionlog.setString(
            'councilId', userLogin.value.councilId.toString());
        await sessionlog.setString(
            'stateId', userLogin.value.stateId.toString());
        await sessionlog.setString('roleId', userLogin.value.roleId.toString());
        await sessionlog.setString(
            'catId', userLogin.value.categoryId.toString());
        await sessionlog.setInt('country', userLogin.value.countryId!);
        if(mid !=null){
           await Get.offAll(Dashboard());
        }
      } else if (response.data == "User Doesn't Exist") {
        isfade = true;
        Get.defaultDialog(
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
            ));
      }
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
        isfade = true;
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
      }
      return null;
    }
    update();
    return null;
  }

  // Future<UserDetails?> getUserData(String mId) async {
  //   final getUserDetailsService = GetUserDetailsService();

  //   try {
  //     final response = await getUserDetailsService.getUserProfile(mId);

  //     var jsonFile = convert.jsonDecode(response.data);
  //     print(response.statusCode.toString());

  //     dp.log(response.data);

  //     if (response.statusCode == 200) {
  //       print('json working');
  //       getUserDetails.value = UserDetails.fromJson(jsonFile);
  //       print(getUserDetails.value.loginName);
  //       username = sessionlog.getString('log_name');
  //       sessionlog.setString('log_name', getUserDetails.value.loginName!);
  //       // await getUserProfilePick(
  //       //     mid: userLogin.value.userId,
  //       //     conId: userLogin.value.countryId,
  //       //     stateId: userLogin.value.stateId,
  //       //     counId: userLogin.value.councilId);

  //       // await getUserLastLogin(mId);

  //       await Get.offAll(Dashboard());
  //     } else {
  //       isfade = true;
  //       Get.defaultDialog(
  //           title: 'Something is wrong', middleText: 'Please try again');
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       print(e.toString());
  //     }
  //     return null;
  //   }
  //   update();
  //   return null;
  // }

  getUserLastLogin(mId) async {
    final userLastLoginService = UserLastLoginService();

    try {
      final response = await userLastLoginService.getUserLastLoginData(mId);
      // var jsonFile = jsonDecode(response.data);po
      if (response.statusCode == 200) {
        dp.log(response.data);
        // var jsonFile = convert.jsonDecode(response.data[0]);
        final splitted = response.data.split('T');
        print(splitted.toString());
        print(splitted[0].toString());
        print(splitted[1].toString());
        date.value = splitted[0].toString();
        time.value = splitted[1].toString();
        print(date.value);
        print(time.value);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
    }
    update();
  }

  int selectCategoryId(dropvalue) {
    var choice = dropvalue;
    int value = 0;

    switch (choice) {
      case 'Medical':
        return value = 1;

      case 'Nursing':
        return value = 2;
      case 'Dental':
        return value = 3;
      case 'Ayurvedic':
        return value = 4;
    }
    return value;
  }
}
