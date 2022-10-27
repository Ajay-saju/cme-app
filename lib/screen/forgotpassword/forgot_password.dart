import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hslr/screen/login/login_controller.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({Key? key}) : super(key: key);

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  LoginController logController = Get.put(LoginController());

  static final GlobalKey<FormState> forpasskey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: ((_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white, //Color(0xff63c3fe),
            // appBar: AppBar(
            //   backgroundColor: Colors.white,
            //   title: Text(
            //     "Forgot Password",
            //     style: TextStyle(color: Colors.black),
            //   ),
            //   iconTheme: IconThemeData(
            //     color: Colors.black, //change your color here
            //   ),
            // ),
            body: SafeArea(
              child: Form(
                key: forpasskey,
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
                                  "Forgot Password",
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
                      Padding(
                        padding: EdgeInsets.only(
                            left: context.width > 410 ? 40.0 : 20, top: 50),
                        child: Text(
                          "Enter the required details to create new password",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.phone,
                            controller: logController.formobnumb,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 9) {
                                return null;
                              } else if (value.length < 9 && value.isNotEmpty) {
                                return "Your Mobile Is Short";
                              } else {
                                return 'Required Mobile No ';
                              }
                            },
                            decoration: InputDecoration(
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
                                hintText: "Mobile Number",
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
                          padding: const EdgeInsets.all(20.0),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.number,
                            controller: logController.forregnumb,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 9) {
                                return null;
                              } else if (value.length < 9 && value.isNotEmpty) {
                                return "Your Reg No Is Short";
                              } else {
                                return 'Required Reg No ';
                              }
                            },
                            decoration: InputDecoration(
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
                                hintText: "Register Number",
                                hintStyle: TextStyle(
                                  // fontWeight: FontWeight.bold,
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
                        height: 20,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          Center(
                              child: SizedBox(
                            width: context.width * 0.3,
                            child: ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Nunito"),
                                )),
                          )),
                          Spacer(),
                          Center(
                              child: SizedBox(
                            width: context.width * 0.3,
                            child: ElevatedButton(
                                onPressed: () {
                                  forpasskey.currentState!.validate();
                                },
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Nunito"),
                                )),
                          )),
                          Spacer(),
                        ],
                      ),

////////////////////
                      // Container(
                      //   margin: EdgeInsets.only(top: 50.0),
                      //   height: context.height * 0.6,
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
                      //       Padding(
                      //         padding: const EdgeInsets.all(20.0),
                      //         child: Text(
                      //           "Forgot Password",
                      //           style: TextStyle(
                      //             fontSize: 20.0,
                      //             color: Colors.grey.shade300,
                      //           ),
                      //         ),
                      //       ),
                      //       Center(
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(20.0),
                      //           child: TextFormField(
                      //             inputFormatters: [
                      //               LengthLimitingTextInputFormatter(10),
                      //             ],
                      //             keyboardType: TextInputType.phone,
                      //             controller: logController.formobnumb,
                      //             validator: (value) {
                      //               if (value!.isNotEmpty &&
                      //                   value.length > 9) {
                      //                 return null;
                      //               } else if (value.length < 9 &&
                      //                   value.isNotEmpty) {
                      //                 return "Your Mobile Is Short";
                      //               } else {
                      //                 return 'Required Mobile No ';
                      //               }
                      //             },
                      //             decoration: InputDecoration(
                      //                 border: OutlineInputBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(50.0),
                      //                   borderSide: const BorderSide(
                      //                       color: Colors.green),
                      //                 ),
                      //                 enabledBorder: OutlineInputBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(50.0),
                      //                   borderSide: const BorderSide(
                      //                       color: Colors.black),
                      //                 ),
                      //                 errorBorder: OutlineInputBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(50.0),
                      //                   borderSide: const BorderSide(
                      //                       color: Colors.grey),
                      //                 ),
                      //                 focusedBorder: OutlineInputBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(50.0),
                      //                   borderSide:
                      //                       BorderSide(color: Colors.black),
                      //                 ),
                      //                 focusedErrorBorder: OutlineInputBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(50.0),
                      //                   borderSide: BorderSide(
                      //                     color: Colors.black,
                      //                   ),
                      //                 ),
                      //                 hintText: "Mobile Number",
                      //                 filled: true,
                      //                 fillColor: Colors.white,
                      //                 contentPadding:
                      //                     const EdgeInsets.only(left: 20.0)),
                      //           ),
                      //         ),
                      //       ),
                      //       Center(
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(20.0),
                      //           child: TextFormField(
                      //             inputFormatters: [
                      //               LengthLimitingTextInputFormatter(10),
                      //             ],
                      //             keyboardType: TextInputType.number,
                      //             controller: logController.forregnumb,
                      //             validator: (value) {
                      //               if (value!.isNotEmpty &&
                      //                   value.length > 9) {
                      //                 return null;
                      //               } else if (value.length < 9 &&
                      //                   value.isNotEmpty) {
                      //                 return "Your Reg No Is Short";
                      //               } else {
                      //                 return 'Required Reg No ';
                      //               }
                      //             },
                      //             decoration: InputDecoration(
                      //                 border: OutlineInputBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(50.0),
                      //                   borderSide: const BorderSide(
                      //                       color: Colors.green),
                      //                 ),
                      //                 enabledBorder: OutlineInputBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(50.0),
                      //                   borderSide: const BorderSide(
                      //                       color: Colors.black),
                      //                 ),
                      //                 errorBorder: OutlineInputBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(50.0),
                      //                   borderSide: const BorderSide(
                      //                       color: Colors.grey),
                      //                 ),
                      //                 focusedBorder: OutlineInputBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(50.0),
                      //                   borderSide:
                      //                       BorderSide(color: Colors.black),
                      //                 ),
                      //                 focusedErrorBorder: OutlineInputBorder(
                      //                   borderRadius:
                      //                       BorderRadius.circular(50.0),
                      //                   borderSide: BorderSide(
                      //                     color: Colors.black,
                      //                   ),
                      //                 ),
                      //                 hintText: "Register Number",
                      //                 filled: true,
                      //                 fillColor: Colors.white,
                      //                 contentPadding:
                      //                     const EdgeInsets.only(left: 20.0)),
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 20,
                      //       ),
                      //       Center(
                      //           child: SizedBox(
                      //         width: context.width * 0.3,
                      //         child: ElevatedButton(
                      //             onPressed: () {
                      //               forpasskey.currentState!.validate();
                      //             },
                      //             child: Text("Submit")),
                      //       )),
                      //       SizedBox(
                      //         height: 20,
                      //       ),
                      //       Center(
                      //           child: SizedBox(
                      //         width: context.width * 0.5,
                      //         child: ElevatedButton(
                      //             onPressed: () {
                      //               Get.back();
                      //             },
                      //             child: Text("Cancel")),
                      //       )),
                      //     ],
                      //   ),
                      // ),
                      // // SizedBox(
                      //   height: context.height * 0.1,
                      // ),
                      ///////////////
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
