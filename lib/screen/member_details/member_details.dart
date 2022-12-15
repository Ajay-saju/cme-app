import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/member_details/member_controller.dart';

import '../change_password/change_password_screen.dart';
import '../change_profile_pick/change_profile_pick_screen.dart';
import '../login/login_controller.dart';

class Memberdetail extends StatefulWidget {
  const Memberdetail({Key? key}) : super(key: key);

  @override
  State<Memberdetail> createState() => _MemberdetailState();
}

class _MemberdetailState extends State<Memberdetail> {
  MemberDetailsController mebController = Get.put(MemberDetailsController());
  LoginController logController = Get.find();

  @override
  Widget build(BuildContext context) {
    mebController.memName.text =
        logController.getUserDetails.value.firstName.toString();
    mebController.membmobile.text =
        logController.getUserDetails.value.phoneNumber.toString();
    return GetBuilder<MemberDetailsController>(
      builder: ((_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white, //Color(0xff63c3fe),
            body: SafeArea(
              child: Form(
                key: mebController.formkey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
                                  "Members Details",
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

                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            20.0,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black87,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(20),
                            ],
                            keyboardType: TextInputType.text,
                            controller: mebController.memName,
                            textCapitalization: TextCapitalization.words,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 3) {
                                return null;
                              } else if (value.length < 3 && value.isNotEmpty) {
                                return "Your Name Is Short";
                              } else {
                                return 'Required Name ';
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
                                hintText: "Name",
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10, right: 20.0),
                          child: TextFormField(
                            cursorColor: Colors.black87,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.text,
                            controller: mebController.councilName,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 9) {
                                return null;
                              } else if (value.length < 9 && value.isNotEmpty) {
                                return "Your Councile Name Is Short";
                              } else {
                                return 'Required Councile Name ';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide:
                                      const BorderSide(color: Colors.green),
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
                                hintText: "Councile Name",
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 25, right: 20.0),
                          child: TextFormField(
                            cursorColor: Colors.black87,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.number,
                            controller: mebController.membmobile,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 10) {
                                return null;
                              } else if (value.length < 10 &&
                                  value.isNotEmpty) {
                                return "Your Mobile No Short";
                              } else {
                                return 'Required Mobile Number ';
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
                                hintText: "Mobile Number",
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    const EdgeInsets.only(left: 20.0)),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 25, right: 20.0),
                          child: TextFormField(
                            cursorColor: Colors.black87,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.text,
                            controller: mebController.membstate,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 10) {
                                return null;
                              } else if (value.length < 10 &&
                                  value.isNotEmpty) {
                                return "Your State Name is Short";
                              } else {
                                return 'Required State Name ';
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
                                hintText: "State Name",
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
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 25, right: 20.0),
                          child: TextFormField(
                            cursorColor: Colors.black87,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.text,
                            controller: mebController.membdistr,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 10) {
                                return null;
                              } else if (value.length < 10 &&
                                  value.isNotEmpty) {
                                return "Your Distict Name is Short";
                              } else {
                                return 'Required Distict Name';
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
                                hintText: "Distict Name",
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
                      SizedBox(
                        height: 25.0,
                      ),
                      // SizedBox(
                      //   height: mebController.sizechangepass
                      //       ? context.height * 0.1
                      //       : context.height * 0.06,
                      //   child: Padding(
                      //     padding: const EdgeInsets.only(left: 20.0, right: 20),
                      //     child: TextFormField(
                      //       onTap: () {},
                      //       obscureText: mebController.isObscure,
                      //       inputFormatters: [
                      //         LengthLimitingTextInputFormatter(6),
                      //       ],
                      //       keyboardType: TextInputType.text,
                      //       controller: mebController.changepass,
                      //       validator: (value) {
                      //         if (value!.isNotEmpty && value.length > 5) {
                      //           return null;
                      //         } else if (value.length < 5 && value.isNotEmpty) {
                      //           return "Your Password is Short";
                      //         } else {
                      //           mebController.sizepass();
                      //           return 'Required Password';
                      //         }
                      //       },
                      //       decoration: InputDecoration(
                      //           suffix: Container(
                      //             transform:
                      //                 Matrix4.translationValues(-10, 8, 0),
                      //             child: IconButton(
                      //                 // iconSize: 15.0,
                      //                 color: Colors.grey,
                      //                 onPressed: () {
                      //                   mebController.isObscure =
                      //                       !mebController.isObscure;
                      //                   mebController.update();
                      //                 },
                      //                 icon: Icon(mebController.isObscure
                      //                     ? Icons.visibility_off
                      //                     : Icons.visibility)),
                      //           ),
                      //           border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(15.0),
                      //             borderSide:
                      //                 const BorderSide(color: Colors.black),
                      //           ),
                      //           enabledBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(15.0),
                      //             borderSide:
                      //                 const BorderSide(color: Colors.black),
                      //           ),
                      //           errorBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(15.0),
                      //             borderSide:
                      //                 const BorderSide(color: Colors.grey),
                      //           ),
                      //           focusedBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(15.0),
                      //             borderSide: BorderSide(color: Colors.black),
                      //           ),
                      //           focusedErrorBorder: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(15.0),
                      //             borderSide: BorderSide(
                      //               color: Colors.black,
                      //             ),
                      //           ),
                      //           // hintStyle: TextStyle(color: Colors.white),
                      //           hintText: "Password",
                      //           hintStyle: TextStyle(
                      //             fontFamily: "Nunito",
                      //           ),
                      //           filled: true,
                      //           fillColor: Colors.white,
                      //           contentPadding:
                      //               EdgeInsets.only(left: 20.0, bottom: 30)),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(ChangePasswordScreen());
                              },
                              child: Text(
                                "Change Password",
                                style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontFamily: "Nunito"),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.to(ChangeProfilePicture());
                              },
                              child: Text(
                                "Change Profile Pitcture",
                                style: TextStyle(
                                    color: Colors.grey.shade900,
                                    fontFamily: "Nunito"),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Center(
                          child: SizedBox(
                        width: context.width * 0.3,
                        child: ElevatedButton(
                            onPressed: () {
                              mebController.formkey.currentState!.validate();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            child: Text(
                              "Update",
                              style: TextStyle(fontFamily: "Nunito"),
                            )),
                      )),

                      ///////////////
                      // Container(
                      //   margin: EdgeInsets.only(top: 20.0),
                      //   height: context.height * 0.9,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(25.0),
                      //     color: Color(0xfff6f9fb),
                      //     shape: BoxShape.rectangle,
                      //     boxShadow: [
                      //       BoxShadow(
                      //           color: Colors.grey.shade300,
                      //           spreadRadius: 0.0,
                      //           blurRadius: 5,
                      //           offset: const Offset(3.0, 3.0)),
                      //       BoxShadow(
                      //           color: Colors.grey.shade400,
                      //           spreadRadius: 0.0,
                      //           blurRadius: 5 / 2.0,
                      //           offset: const Offset(3.0, 3.0)),
                      //       const BoxShadow(
                      //           color: Colors.white,
                      //           spreadRadius: 2.0,
                      //           blurRadius: 2,
                      //           offset: Offset(-1.0, -1.0)),
                      //       const BoxShadow(
                      //           color: Colors.white,
                      //           spreadRadius: 3.0,
                      //           blurRadius: 5 / 2,
                      //           offset: Offset(-1.0, -1.0)),
                      //     ],
                      //   ),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       // const Padding(
                      //       //   padding: EdgeInsets.all(20.0),
                      //       //   child: Text(
                      //       //     "Member Details",
                      //       //     style: TextStyle(fontSize: 20.0),
                      //       //   ),
                      //       // ),
                      //     ],
                      //   ),
                      // ),
                      // // SizedBox(
                      //   height: context.height * 0.1,
                      // ),
                      /////////////////////////
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
