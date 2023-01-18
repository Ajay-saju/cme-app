import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/models/add_user_model.dart';
import 'package:hslr/screen/login/login.dart';
import 'package:hslr/services/create_user.dart';

class CreateAccountController extends GetxController {
  final GlobalKey<FormState> accformkey = GlobalKey<FormState>();

  TextEditingController mobNumb = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController formobnumb = TextEditingController();
  TextEditingController forregnumb = TextEditingController();
  TextEditingController regName = TextEditingController();
  TextEditingController regmobnum = TextEditingController();
  TextEditingController regno = TextEditingController();
  TextEditingController regpass = TextEditingController();

  bool isObscure = true;
  bool sizetext = false;
  String? dropvalue;

  creatsized() {
    sizetext = true;
    update();
    print("object:$sizetext");
  }

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
  Rx<AddUserModel> getUserDetails = AddUserModel().obs;
  createNewUser(
      {required String userName,
      required String number,
      required String regno,
      required String catId,
      required String password}) async {
    final userRegistrationServise = UserRegistrationServise();
    try {
      var response = await userRegistrationServise.crateNewUser(
          userName, number, regno, catId, password);

      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        getUserDetails.value = AddUserModel.fromJson(response.data);
        print('Successfully created');
        log(response.data);
        print(response.data.message.toString());
        await Get.snackbar('Success', 'Account Create successfully',
            colorText: Colors.white,
            backgroundColor: Colors.black,
            duration: Duration(seconds: 3));
        Timer(Duration(seconds: 2), () {
          Get.offAll(Login());
        });

        if (response.data.massage == 'failed') {
          Get.defaultDialog(
              title: 'Failed',
              middleText:
                  "Mobile Number Already Exists Use Your Login Credentials to Login",
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
      }
    } catch (e) {
      print(e.toString());
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
