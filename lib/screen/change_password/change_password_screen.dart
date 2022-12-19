import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/change_password/change_password_controller.dart';
import 'package:hslr/screen/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  ChangePasswordScreenController passwordController =
      Get.put(ChangePasswordScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 2,
                color: Colors.black,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/R.png',
                          height: 15,
                          width: 20,
                          fit: BoxFit.cover,
                        ),
                        // Spacer(),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "Change Password",
                          style: TextStyle(
                              fontFamily: "Nunito",
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 2,
                color: Colors.black,
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                  key: passwordController.passformkey,
                  child: Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            20.0,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                            ],
                            keyboardType: TextInputType.number,
                            controller: passwordController.oldPassword,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 3) {
                                return null;
                              } else if (value.length < 3 && value.isNotEmpty) {
                                return "Password Is Short";
                              } else {
                                return 'Required Old Password ';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Old Password",
                                hintStyle: TextStyle(
                                  fontFamily: "Nunito",
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    const EdgeInsets.only(left: 20.0)),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            20.0,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                            ],
                            keyboardType: TextInputType.number,
                            controller: passwordController.newPassword,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 3) {
                                return null;
                              } else if (value.length < 3 && value.isNotEmpty) {
                                return "Password Is Short";
                              } else {
                                return 'Required New Password ';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "New Password",
                                hintStyle: TextStyle(
                                  fontFamily: "Nunito",
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    const EdgeInsets.only(left: 20.0)),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            20.0,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                            ],
                            keyboardType: TextInputType.number,
                            controller: passwordController.conformPassword,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 3) {
                                return null;
                              } else if (value.length < 3 && value.isNotEmpty) {
                                return "Password Is Short";
                              } else {
                                return 'Required Confirm Password ';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                  fontFamily: "Nunito",
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    const EdgeInsets.only(left: 20.0)),
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontFamily: "Nunito"),
                      )),
                  ElevatedButton(
                      onPressed: () async {
                        if (passwordController.passformkey.currentState!
                            .validate()) {
                           await Get.snackbar('Success',
                              'Password has been changed successfully',
                              colorText: Colors.white,
                              backgroundColor: Colors.black,
                              duration: Duration(seconds: 3));

                          Timer(Duration(seconds: 2), () async {
                            SharedPreferences sessionlog =
                                await SharedPreferences.getInstance();
                            sessionlog.remove("log_name");
                            Get.off(Login());
                          });
                        } else {
                          print('not valid');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: Text(
                        "Update",
                        style: TextStyle(fontFamily: "Nunito"),
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
