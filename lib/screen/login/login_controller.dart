import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  static final GlobalKey<FormState> regformkey = GlobalKey<FormState>();

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
  String? dropvalue;

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
    // username = sessionlog.getString('log_name');
    sessionlog.setString('log_name', mobNumb.text);

    Get.to(Dashboard());
  }
}
