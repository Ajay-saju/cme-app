import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/login/login_controller.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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
            backgroundColor: Colors.white, //Color(0xff63c3fe),
            // appBar: AppBar(
            //   backgroundColor: Colors.white,
            //   title: Text(
            //     "Create New Account",
            //     style: TextStyle(color: Colors.black),
            //   ),
            //   iconTheme: IconThemeData(
            //     color: Colors.black, //change your color here
            //   ),
            // ),

            body: SafeArea(
              child: Form(
                key: LoginController.regformkey,
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
                                  "Create New Account",
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
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: Text(
                            "Register Form",
                            style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontFamily: "Nunito",
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            20.0,
                          ),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.name,
                            controller: logController.regName,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 3) {
                                return null;
                              } else if (value.length < 3 && value.isNotEmpty) {
                                return "Your Name is Short";
                              } else {
                                return 'Required Name ';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
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
                                hintText: "Dr Name",
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
                      Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.number,
                            controller: logController.regmobnum,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 9) {
                                return null;
                              } else if (value.length < 9 && value.isNotEmpty) {
                                return "Your Mobile No Is Short";
                              } else {
                                return 'Required Mobile No ';
                              }
                            },
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.0),
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
                          padding: const EdgeInsets.all(20),
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.number,
                            controller: logController.regno,
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
                                hintText: "Council Reg No",
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
                        height: 0,
                      ),
                      SizedBox(
                        height: logController.creatsize
                            ? context.height * 0.1
                            : context.height * 0.06,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: TextFormField(
                            onTap: () {},
                            obscureText: logController.isObscure,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(6),
                            ],
                            keyboardType: TextInputType.text,
                            controller: logController.password,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 5) {
                                return null;
                              } else if (value.length < 5 && value.isNotEmpty) {
                                return "Your Password is Short";
                              } else {
                                logController.creatsized();
                                return 'Required Password';
                              }
                            },
                            decoration: InputDecoration(
                                suffix: Container(
                                  transform:
                                      Matrix4.translationValues(-10, 8, 0),
                                  child: IconButton(
                                      // iconSize: 15.0,
                                      color: Colors.grey,
                                      onPressed: () {
                                        logController.isObscure =
                                            !logController.isObscure;
                                        logController.update();
                                      },
                                      icon: Icon(logController.isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
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
                                // hintStyle: TextStyle(color: Colors.white),
                                hintText: "4 Digit Pin",
                                hintStyle: TextStyle(
                                  fontFamily: "Nunito",
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding:
                                    EdgeInsets.only(left: 20.0, bottom: 30)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      Center(
                        child: Container(
                          margin: EdgeInsets.all(16),
                          height: context.height * 0.06,
                          width: context.width * 0.9,
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              border: Border.all(color: Colors.black)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                value: logController.dropvalue,
                                isExpanded: true,
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Image.asset('assets/Dropdownb.png'),
                                ),
                                hint: Text(
                                  "Select Profession",
                                  style: TextStyle(
                                    // fontWeight: FontWeight.bold,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                items: logController.dropitems
                                    .map(logController.buildMenuItem)
                                    .toList(),
                                onChanged: (value) {
                                  logController.dropvalue = value;
                                  logController.update();
                                }),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      Center(
                          child: SizedBox(
                        width: context.width * 0.3,
                        child: ElevatedButton(
                            onPressed: () {
                              LoginController.regformkey.currentState!
                                  .validate();
                            },
                            style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            child: Text("Register")),
                      )),

                      /////////////////
                      //     Container(
                      //       margin: EdgeInsets.only(top: 50.0),
                      //       height: context.height * 0.7,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(25.0),
                      //         color: Color(0xfff6f9fb),
                      //         shape: BoxShape.rectangle,
                      //         boxShadow: [
                      //           BoxShadow(
                      //               color: Colors.grey.shade300,
                      //               spreadRadius: 0.0,
                      //               blurRadius: 5,
                      //               offset: const Offset(3.0, 3.0)),
                      //           BoxShadow(
                      //               color: Colors.grey.shade400,
                      //               spreadRadius: 0.0,
                      //               blurRadius: 5 / 2.0,
                      //               offset: const Offset(3.0, 3.0)),
                      //           const BoxShadow(
                      //               color: Colors.white,
                      //               spreadRadius: 2.0,
                      //               blurRadius: 2,
                      //               offset: Offset(-1.0, -1.0)),
                      //           const BoxShadow(
                      //               color: Colors.white,
                      //               spreadRadius: 3.0,
                      //               blurRadius: 5 / 2,
                      //               offset: Offset(-1.0, -1.0)),
                      //         ],
                      //       ),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           const Padding(
                      //             padding: EdgeInsets.all(20.0),
                      //             child: Text(
                      //               "Register Form",
                      //               style: TextStyle(
                      //                   fontSize: 20.0, color: Colors.grey),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      // ////////////
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
