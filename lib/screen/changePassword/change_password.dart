import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../login/login.dart';
import 'change_password_controller.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key? key}) : super(key: key);

  final changePasswordController = Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
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
                        "Create new Password",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Nunito",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Your new password must be differnt from previous used password',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Nunito",
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
                key: changePasswordController.form,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GetBuilder<ChangePasswordController>(builder: (_) {
                        return TextFormField(
                          obscureText: changePasswordController.isObscurePass,
                          controller: changePasswordController.pass,
                          cursorColor: Colors.black,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(14),
                          ],
                          keyboardType: TextInputType.text,
                          // controller: logController.forregnumb,
                          validator: (value) {
                            if (value!.isNotEmpty && value.length > 7) {
                              return null;
                            } else if (value.length < 7 && value.isNotEmpty) {
                              return "Your password No Is Short";
                            } else {
                              return 'Required password ';
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  changePasswordController.isObscurePass
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  changePasswordController.isObscurePass =
                                      !changePasswordController.isObscurePass;
                                  changePasswordController.update();
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.green),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "New password",
                              hintStyle: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding:
                                  const EdgeInsets.only(left: 20.0)),
                        );
                      }),
                    ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GetBuilder<ChangePasswordController>(
                        builder: (_) {
                          return TextFormField(
                            obscureText:
                                changePasswordController.isObscureConfirmPass,
                            controller: changePasswordController.confirmPass,
                            cursorColor: Colors.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(14),
                            ],
                            keyboardType: TextInputType.text,
                            // controller: logController.forregnumb,
                            validator: (val) {
                              print(changePasswordController.pass.text);
                              print("_________________________________$val");
                              // if (value!.isNotEmpty && value.length > 7) {
                              //   return null;
                              // } else if (value.length < 7 && value.isNotEmpty) {
                              //   return "Your password No Is Short";
                              // }
                              // else
                              // if (value!.isEmpty) {
                              //   return 'Empty Password';
                              // }
                              // if (value != changePasswordController.pass.text) {
                              //   return 'Both password must be match ';
                              // }
                              if (val!.isEmpty) return 'Requred password';
                              if (val != changePasswordController.pass.text)
                                return 'Both password must be match';
                              return null;
                            },
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  changePasswordController.isObscureConfirmPass
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  changePasswordController
                                          .isObscureConfirmPass =
                                      !changePasswordController
                                          .isObscureConfirmPass;
                                  changePasswordController.update();
                                },
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.green),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.black),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide:
                                    const BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Colors.black),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              hintText: "Confirm password",
                              hintStyle: TextStyle(
                                // fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(left: 20.0),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () async {
                if (changePasswordController.form.currentState!.validate()) {
                  await Get.snackbar(

                      'Success', 'Password has been changed successfully',
                      colorText: Colors.white,
                      backgroundColor: Colors.black,
                      duration: Duration(seconds: 3));
                  Timer(Duration(seconds: 2), () {
                    Get.off(Login());
                  });
                } else {
                  print('not valid');
                }

                print(changePasswordController.form.currentState!.validate());
              },
              style: ElevatedButton.styleFrom(
                  fixedSize: Size(350, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.black),
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  'Reset Password',
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.5),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
