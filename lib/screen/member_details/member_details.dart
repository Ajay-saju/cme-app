import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/dashboard/dashboard_controller.dart';
import 'package:hslr/screen/member_details/member_controller.dart';
import '../change_password/change_password_screen.dart';
import '../change_profile_pick/change_profile_pick_screen.dart';


class Memberdetail extends StatefulWidget {
  const Memberdetail({Key? key}) : super(key: key);

  @override
  State<Memberdetail> createState() => _MemberdetailState();
}

class _MemberdetailState extends State<Memberdetail> {
  MemberDetailsController mebController = Get.put(MemberDetailsController());
  DashboardController logController = Get.find();

  @override
  Widget build(BuildContext context) {
    logController.getUserDetails.value.loginName == null
        ? ""
        : mebController.memName.text =
            logController.getUserDetails.value.loginName!;

    // logController.getUserDetails.value.councilName == null
    //     ? ""
    //     : mebController.councilName.text =
    //         logController.getUserDetails.value.councilName!;

    // logController.getUserDetails.value.mobileNumber == null
    //     ? ""
    //     : mebController.membmobile.text =
    //         logController.getUserDetails.value.mobileNumber!;
    // logController.getUserDetails.value.stateDesc == null
    //     ? ""
    //     : mebController.membstate.text =
    //         logController.getUserDetails.value.stateDesc!;
    // logController.getUserDetails.value.districtName == null
    //     ? ""
    //     : mebController.membdistr.text =
    //         logController.getUserDetails.value.districtName!;
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
                            // initialValue:
                            //     logController.getUserDetails.value.councilName,
                            cursorColor: Colors.black87,

                            keyboardType: TextInputType.text,
                            controller: mebController.councilName,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 3) {
                                return null;
                              } else if (value.length < 3 && value.isNotEmpty) {
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
                            // initialValue:
                            //     logController.getUserDetails.value.mobileNumber,
                            cursorColor: Colors.black87,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.number,
                            controller: mebController.membmobile,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 9) {
                                return null;
                              } else if (value.length < 9 && value.isNotEmpty) {
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
                      
                      SizedBox(
                        height: 25.0,
                      ),

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
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            child: Text(
                              "Update",
                              style: TextStyle(fontFamily: "Nunito"),
                            )),
                      )),
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
