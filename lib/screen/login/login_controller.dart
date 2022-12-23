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

  Rx<UserDetails> getUserDetails = UserDetails().obs;
  Rx<UserLogin> userLogin = UserLogin().obs;
  var profileImage = ''.obs;
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
  String? dropvalue;
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
      {required String mobileNo, required String pin}) async {
    final userLoginService = UserLoginService();
    final prefs = await SharedPreferences.getInstance();

    try {
      final response = await userLoginService.userLogin(mobileNo, pin);
      print(response.toString());
      dp.log(response.statusCode.toString());
      // var jsonFile = convert.jsonDecode(response.data);

      if (response.statusCode == 200) {
        userLogin.value = UserLogin.fromJson(response.data);
        print(userLogin.value.userId.toString());

        await prefs.setString('userId', userLogin.value.userId.toString());
        var mid = await prefs.getString('userId');
        await getUserData(mid!);

        await prefs.setString(
            'councilId', userLogin.value.councilId.toString());
        await prefs.setString('stateId', userLogin.value.stateId.toString());
        await prefs.setString('roleId', userLogin.value.roleId.toString());
        await prefs.setString('catId', userLogin.value.categoryId.toString());
        await prefs.setInt('country', userLogin.value.countryId!);
        // var conId = await prefs.getInt('country');
        // var stateId = await prefs.getString('stateId');
        // var counId = await prefs.getString('councilId');
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

  Future<UserDetails?> getUserData(String mId) async {
    final getUserDetailsService = GetUserDetailsService();

    try {
      final response = await getUserDetailsService.getUserProfile(mId);

      var jsonFile = convert.jsonDecode(response.data);
      print(response.statusCode.toString());

      dp.log(response.data);

      if (response.statusCode == 200) {
        print('json working');
        getUserDetails.value = UserDetails.fromJson(jsonFile);
        print(getUserDetails.value.loginName);
        username = sessionlog.getString('log_name');
        sessionlog.setString('log_name', getUserDetails.value.loginName!);
        await getUserProfilePick(
            mid: userLogin.value.userId,
            conId: userLogin.value.countryId,
            stateId: userLogin.value.stateId,
            counId: userLogin.value.councilId);

        await Get.off(Dashboard());
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

  getUserLastLogin(mId) async {
    final userLastLoginService = UserLastLoginService();

    try {
      final response = await userLastLoginService.getUserLastLoginData(mId);
      // var jsonFile = jsonDecode(response.data);
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

  getUserProfilePick(
      {required mid, required conId, required counId, required stateId}) async {
    final proPicService = UserPickService();
    try {
      final response = await proPicService.getProfilePick(
          mid: mid, conId: conId, counId: counId, stateId: stateId);
      if (response.statusCode == 200) {
        await sessionlog.setString('proPick', response.data);
        profileImage = response.data;
      }
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
    }
    update();
  }
}
