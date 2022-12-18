import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/models/user_details.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/services/last_login_service/last_login_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;
import 'dart:developer' as dp;
import '../../services/user_profile_service/get_user_logid_service.dart';
import '../../services/user_profile_service/get_user_profile_service.dart';

class LoginController extends GetxController {
  static final GlobalKey<FormState> regformkey = GlobalKey<FormState>();

  Rx<GetUserDetails> getUserDetails = GetUserDetails().obs;

  List<GetUserDetails> user = [];

  TextEditingController mobNumb = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController formobnumb = TextEditingController();
  TextEditingController forregnumb = TextEditingController();
  TextEditingController regName = TextEditingController();
  TextEditingController regmobnum = TextEditingController();
  TextEditingController regno = TextEditingController();
  TextEditingController regpass = TextEditingController();

  var username;

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

  Future getUserId(String mobileNo, String pin) async {
    final userLogIdService = UserLogIdService();

    try {
      final response = await userLogIdService.getUserUid(mobileNo, pin);
      var jsonFile = convert.jsonDecode(response.data);

      if (response.statusCode == 200) {
        final mid = jsonFile[0];

        await getUserData(mid);
        await getUserLastLogin(mid);
      }
    } catch (e) {
      if (e is DioError) {
        print(e.toString());
      }
      update();
    }
  }

  Future<GetUserDetails?> getUserData(String mId) async {
    final getUserDetailsService = GetUserDetailsService();
    // var jsonFile;
    try {
      final response = await getUserDetailsService.getUserProfile(mId);

      var jsonFile = convert.jsonDecode(response.data);
      print(response.statusCode.toString());

      dp.log(response.data);

      if (response.statusCode == 200) {
        print('json working');
        getUserDetails.value = GetUserDetails.fromJson(jsonFile[0]);
        print(getUserDetails.value.firstName.toString());
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
}
