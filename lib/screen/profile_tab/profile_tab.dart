import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/profile_tab/profile_tab_controller.dart';

import '../change_password/change_password_screen.dart';
import '../change_profile_pick/change_profile_pick_screen.dart';
import '../dashboard/dashboard_controller.dart';

class ProfileScreenTab extends StatefulWidget {
  const ProfileScreenTab({Key? key}) : super(key: key);

  @override
  State<ProfileScreenTab> createState() => _ProfileScreenTabState();
}

class _ProfileScreenTabState extends State<ProfileScreenTab> {
  ProfileTabController profileTabController = ProfileTabController();
  DashboardController logController = Get.find();

  @override
  Widget build(BuildContext context) {
    logController.getUserDetails.value.loginName == null
        ? ""
        : profileTabController.memName.text =
            logController.getUserDetails.value.loginName!;
    logController.getUserDetails.value.councilName == null
        ? ""
        : profileTabController.memCouncilName.text =
            logController.getUserDetails.value.councilName!;
    logController.getUserDetails.value.mobileNumber == null
        ? ""
        : profileTabController.memPhoneno.text =
            logController.getUserDetails.value.mobileNumber!;
    logController.getUserDetails.value.regNo == null
        ? ""
        : profileTabController.memCouncilno.text =
            logController.getUserDetails.value.regNo!;
    return Scaffold(
      backgroundColor: Colors.white, //Color(0xff63c3fe),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Profile",
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
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.black87, // here for close state
                colorScheme: ColorScheme.light(
                  primary: Colors.black87,
                ), // here for open state in replacement of deprecated accentColor
                dividerColor:
                    Colors.transparent, // if you want to remove the border
              ),
              child: ExpansionTile(
                leading: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    'assets/ff.png',
                    fit: BoxFit.cover,
                    color: Colors.black87,
                  ),
                ),
                title: Text(
                  'Member Details',
                  style: TextStyle(
                      fontFamily: "Nunito",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                children: [
                  Form(
                      key: profileTabController.profileTabFormkey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            TextFormField(
                              cursorColor: Colors.black87,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(25),
                              ],
                              keyboardType: TextInputType.name,
                              controller: profileTabController.memName,
                              textCapitalization: TextCapitalization.words,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 3) {
                                  return null;
                                } else if (value.length < 3 &&
                                    value.isNotEmpty) {
                                  return "Your Name Is Short";
                                } else {
                                  return 'Required Name ';
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffix: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                hintText: "Name",
                                hintStyle: TextStyle(
                                  fontFamily: "Nunito",
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                fontFamily: "Nunito",
                              ),
                            ),
                            TextFormField(
                              cursorColor: Colors.black87,
                              keyboardType: TextInputType.text,
                              controller: profileTabController.memCouncilName,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 3) {
                                  return null;
                                } else if (value.length < 3 &&
                                    value.isNotEmpty) {
                                  return "Your Councile Name Is Short";
                                } else {
                                  return 'Required Councile Name ';
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffix: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                hintText: "Councile Name",
                                hintStyle: TextStyle(
                                  fontFamily: "Nunito",
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                fontFamily: "Nunito",
                              ),
                            ),
                            TextFormField(
                              cursorColor: Colors.black87,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              keyboardType: TextInputType.number,
                              controller: profileTabController.memPhoneno,
                              // textCapitalization: TextCapitalization.words,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 9) {
                                  return null;
                                } else if (value.length < 9 &&
                                    value.isNotEmpty) {
                                  return "Your Mobile No Short";
                                } else {
                                  return 'Required Mobile Number ';
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffix: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                hintText: "Mobile Number",
                                hintStyle: TextStyle(
                                  fontFamily: "Nunito",
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                fontFamily: "Nunito",
                              ),
                            ),
                            TextFormField(
                              cursorColor: Colors.black87,
                              inputFormatters: [
                                // LengthLimitingTextInputFormatter(10),
                              ],
                              keyboardType: TextInputType.text,
                              controller: profileTabController.memCouncilno,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 1) {
                                  return null;
                                } else if (value.length < 1 &&
                                    value.isNotEmpty) {
                                  return "Your Reg No Is Short";
                                } else {
                                  return 'Required Reg No ';
                                }
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                suffix: Icon(
                                  Icons.edit,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                hintText: "Council Reg No",
                                hintStyle: TextStyle(
                                  fontFamily: "Nunito",
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              style: TextStyle(
                                fontFamily: "Nunito",
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                                child: SizedBox(
                              width: context.width * 0.3,
                              child: ElevatedButton(
                                  onPressed: () {
                                    profileTabController
                                        .profileTabFormkey.currentState!
                                        .validate();
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
                            SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                unselectedWidgetColor: Colors.black87, // here for close state
                colorScheme: ColorScheme.light(
                  primary: Colors.black87,
                ), // here for open state in replacement of deprecated accentColor
                dividerColor:
                    Colors.transparent, // if you want to remove the border
              ),
              child: ExpansionTile(
                leading: SizedBox(
                  height: 25,
                  width: 25,
                  child: Image.asset(
                    'assets/ed.png',
                    fit: BoxFit.cover,
                    color: Colors.black87,
                  ),
                ),
                title: Text(
                  'Education Details',
                  style: TextStyle(
                      fontFamily: "Nunito",
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                children: [
                  ExpansionTile(
                    title: Text(''),
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
