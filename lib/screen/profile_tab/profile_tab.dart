import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/education_details/add_edu_details.dart';
import 'package:hslr/screen/education_details/edit_details.dart';
import 'package:hslr/screen/profile_tab/profile_tab_controller.dart';
import '../change_password/change_password_screen.dart';
import '../change_profile_pick/change_profile_pick_screen.dart';
import '../dashboard/dashboard.dart';
import '../dashboard/dashboard_controller.dart';

class ProfileScreenTab extends StatefulWidget {
  const ProfileScreenTab({Key? key}) : super(key: key);

  @override
  State<ProfileScreenTab> createState() => _ProfileScreenTabState();
}

class _ProfileScreenTabState extends State<ProfileScreenTab> {
  ProfileTabController profileTabController = Get.put(ProfileTabController());

  DashboardController logController = Get.find();
  @override
  void initState() {
    super.initState();
    profileTabController.getEduList();
    profileTabController.getEduIdList();
  }

  @override
  Widget build(BuildContext context) {
    print(profileTabController.eduList.value.result);
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
    return WillPopScope(
        onWillPop: () async {
          Get.offAll(Dashboard());
          return false;
        },
        child:
            // GetBuilder<ProfileTabController>(builder: ((_) {
            // return
            GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
              backgroundColor: Colors.white, //Color(0xff63c3fe),
              body: Obx(
                () => profileTabController.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.black87,
                          strokeWidth: 2.5,
                        ),
                      )
                    : SafeArea(
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
                                // Get.back();
                                Get.offAll(Dashboard());
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
                                unselectedWidgetColor:
                                    Colors.black87, // here for close state
                                colorScheme: ColorScheme.light(
                                  primary: Colors.black87,
                                ), // here for open state in replacement of deprecated accentColor
                                dividerColor: Colors
                                    .transparent, // if you want to remove the border
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
                                      key: profileTabController
                                          .profileTabFormkey,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          children: [
                                            TextFormField(
                                              cursorColor: Colors.black87,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    25),
                                              ],
                                              keyboardType: TextInputType.name,
                                              controller:
                                                  profileTabController.memName,
                                              textCapitalization:
                                                  TextCapitalization.words,
                                              validator: (value) {
                                                if (value!.isNotEmpty &&
                                                    value.length > 3) {
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
                                                suffix: IconButton(
                                                  color: Colors.black,
                                                  icon: Icon(Icons.edit),
                                                  onPressed: () {
                                                    print('working');
                                                    setState(() {
                                                      profileTabController
                                                              .isReadOnly =
                                                          !profileTabController
                                                              .isReadOnly;
                                                    });
                                                  },
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
                                              // enabled: profileTabController.isReadOnly,
                                              readOnly: !profileTabController
                                                  .isReadOnly,
                                            ),
                                            TextFormField(
                                              enabled: profileTabController
                                                  .isReadOnly1,
                                              cursorColor: Colors.black87,
                                              keyboardType: TextInputType.text,
                                              controller: profileTabController
                                                  .memCouncilName,
                                              validator: (value) {
                                                if (value!.isNotEmpty &&
                                                    value.length > 3) {
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
                                                suffix: IconButton(
                                                  color: Colors.black,
                                                  icon: Icon(Icons.edit),
                                                  onPressed: () {
                                                    setState(() {
                                                      profileTabController
                                                              .isReadOnly =
                                                          !profileTabController
                                                              .isReadOnly;
                                                    });
                                                  },
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
                                              readOnly: profileTabController
                                                  .isReadOnly,
                                              cursorColor: Colors.black87,
                                              inputFormatters: [
                                                LengthLimitingTextInputFormatter(
                                                    10),
                                              ],
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: profileTabController
                                                  .memPhoneno,
                                              // textCapitalization: TextCapitalization.words,
                                              validator: (value) {
                                                if (value!.isNotEmpty &&
                                                    value.length > 9) {
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
                                                suffix: IconButton(
                                                  color: Colors.black,
                                                  icon: Icon(Icons.edit),
                                                  onPressed: () {
                                                    setState(() {
                                                      profileTabController
                                                              .isReadOnly2 =
                                                          !profileTabController
                                                              .isReadOnly2;
                                                    });
                                                  },
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
                                              readOnly: profileTabController
                                                  .isReadOnly,
                                              cursorColor: Colors.black87,
                                              inputFormatters: [
                                                // LengthLimitingTextInputFormatter(10),
                                              ],
                                              keyboardType: TextInputType.text,
                                              controller: profileTabController
                                                  .memCouncilno,
                                              validator: (value) {
                                                if (value!.isNotEmpty &&
                                                    value.length > 1) {
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
                                                suffix: IconButton(
                                                  color: Colors.black,
                                                  icon: Icon(Icons.edit),
                                                  onPressed: () {
                                                    setState(() {
                                                      profileTabController
                                                              .isReadOnly =
                                                          !profileTabController
                                                              .isReadOnly;
                                                    });
                                                  },
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
                                                        .profileTabFormkey
                                                        .currentState!
                                                        .validate();
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Colors.black,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          )),
                                                  child: Text(
                                                    "Update",
                                                    style: TextStyle(
                                                        fontFamily: "Nunito"),
                                                  )),
                                            )),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 0, right: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                          ChangePasswordScreen());
                                                    },
                                                    child: Text(
                                                      "Change Password",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade900,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                          fontFamily: "Nunito"),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  InkWell(
                                                    onTap: () {
                                                      Get.to(
                                                          ChangeProfilePicture());
                                                    },
                                                    child: Text(
                                                      "Change Profile Pitcture",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors
                                                              .grey.shade900,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: "Nunito"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor:
                                    Colors.black87, // here for close state
                                colorScheme: ColorScheme.light(
                                  primary: Colors.black87,
                                ), // here for open state in replacement of deprecated accentColor
                                dividerColor: Colors
                                    .transparent, // if you want to remove the border
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
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: ElevatedButton(
                                            onPressed: () {
                                              Get.to(AddEducationDetails());
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                )),
                                            child: Text(
                                              'Add',
                                              style: TextStyle(
                                                  fontFamily: "Nunito"),
                                            )),
                                      ),
                                    ],
                                  ),
                                  profileTabController.eduList.value.result ==
                                              null &&
                                          profileTabController
                                                  .eduList.value.result ==
                                              []
                                      ? Center(
                                          child: Text(
                                            'No data available',
                                            style: TextStyle(
                                                fontFamily: "Nunito",
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: profileTabController
                                              .eduList.value.result!.length,
                                          itemBuilder: (context, index) =>
                                              ExpansionTile(
                                                title: Text(
                                                  profileTabController
                                                      .eduList
                                                      .value
                                                      .result![index]
                                                      .dEGREE
                                                      .toString(),
                                                  maxLines: 3,
                                                  style: TextStyle(
                                                      fontFamily: "Nunito",
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black),
                                                ),
                                                children: [
                                                  ListTile(
                                                    title: Text(
                                                      profileTabController
                                                          .eduList
                                                          .value
                                                          .result![index]
                                                          .uNIVERSITY
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      // textAlign:
                                                      //     TextAlign.left,

                                                      style: TextStyle(
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontFamily: "Nunito",
                                                          fontSize: 16,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  ListTile(
                                                    title: Text(
                                                      profileTabController
                                                          .eduList
                                                          .value
                                                          .result![index]
                                                          .cOLLEGE
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontFamily: "Nunito",
                                                          fontSize: 15,
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  // ListTile(
                                                  //   title: Text(
                                                  //     eduData[index].yEAROFPASSING.toString(),
                                                  //     maxLines: 3,
                                                  //     style: TextStyle(
                                                  //         fontFamily: "Nunito",
                                                  //         fontSize: 16,
                                                  //         color: Colors.black),
                                                  //   ),
                                                  // ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Get.to(EditEduDetails(
                                                          index: index,
                                                        ));
                                                      },
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              backgroundColor:
                                                                  Colors.black,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                              )),
                                                      child: Text(
                                                        'Edit',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                "Nunito"),
                                                      )),
                                                ],
                                              )),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
              )),
        )
        // }
        // )
        // ),
        );
  }
}
