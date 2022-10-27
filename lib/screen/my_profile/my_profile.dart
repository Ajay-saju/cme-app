import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hslr/screen/creat_account/create_account.dart';
import 'package:hslr/screen/forgotpassword/forgot_password.dart';
import 'package:hslr/screen/login/login_controller.dart';
import 'package:hslr/screen/member_details/member_details.dart';
import 'package:hslr/screen/online_cmeprog/online_cmeprogram.dart';
import 'package:hslr/screen/paymentdetails/paymentdetails.dart';
import 'package:hslr/screen/quiz/question.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  LoginController logController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: ((_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            // backgroundColor: Colors.grey,

            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    height: context.height * 0.09,
                    width: context.width,
                    color: Colors.white, //Color(0xff63c3fe),
                    child: Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(Memberdetail());
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 50),
                        height: context.height * 0.06,
                        width: context.width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text(
                            "Members Details",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        height: context.height * 0.06,
                        width: context.width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text(
                            "Education Details",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(PaymentDetails());
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        height: context.height * 0.06,
                        width: context.width * 0.7,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade700,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                          child: Text(
                            "Receipt List",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
