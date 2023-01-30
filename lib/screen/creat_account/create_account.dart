import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/creat_account/create_acc_controller.dart';
import '../login/login.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  // LoginController logController = Get.put(LoginController());
  // final logController = Get.find<LoginController>();
  CreateAccountController accountController =
      Get.put(CreateAccountController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateAccountController>(
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
                key: accountController.accformkey,
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
                          Get.offAll(Login());
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
                        child: Container(
                          margin: EdgeInsets.all(16),
                          height: context.height * 0.06,
                          width: context.width * 0.9,
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                              // color: Color(0xffDC3638),
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(color: Colors.black)),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                                value: accountController.dropvalue,
                                isExpanded: true,
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Image.asset(
                                    'assets/Dropdownb.png',
                                    color: Color(0xffDC3638),
                                  ),
                                ),
                                hint: Text(
                                  "Select Profession",
                                  style: TextStyle(
                                      // fontWeight: FontWeight.bold,
                                      fontFamily: "Nunito",
                                      color: Colors.black87),
                                ),
                                items: accountController.dropitems
                                    .map(accountController.buildMenuItem)
                                    .toList(),
                                onChanged: (value) {
                                  accountController.dropvalue = value;
                                  accountController.update();
                                }),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(
                            20.0,
                          ),
                          child: TextFormField(
                            cursorColor: Colors.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(25),
                            ],
                            keyboardType: TextInputType.name,
                            controller: accountController.regName,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 2) {
                                return null;
                              } else if (value.length < 2 && value.isNotEmpty) {
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
                            cursorColor: Colors.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            keyboardType: TextInputType.number,
                            controller: accountController.regmobnum,
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
                            cursorColor: Colors.black,
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(10),
                            // ],
                            keyboardType: TextInputType.text,
                            controller: accountController.regno,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 1) {
                                return null;
                              } else if (value.length < 1 && value.isNotEmpty) {
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
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: TextFormField(
                          cursorColor: Colors.black,
                          onTap: () {},
                          obscureText: accountController.isObscure,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4),
                          ],
                          keyboardType: TextInputType.number,
                          controller: accountController.password,
                          validator: (value) {
                            if (value!.isNotEmpty && value.length > 3) {
                              return null;
                            } else if (value.length < 3 && value.isNotEmpty) {
                              return "Your Password is Short";
                            } else {
                              accountController.creatsized();
                              return 'Required Password';
                            }
                          },
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  // iconSize: 15.0,
                                  color: Colors.grey,
                                  onPressed: () {
                                    accountController.isObscure =
                                        !accountController.isObscure;
                                    accountController.update();
                                  },
                                  icon: Icon(
                                      accountController.isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color:
                                          Color.fromARGB(255, 249, 104, 106))),
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
                              contentPadding: EdgeInsets.only(
                                left: 20.0,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Center(
                          child: SizedBox(
                        width: context.width * 0.3,
                        child: ElevatedButton(
                            onPressed: () async {
                              // accountController.createNewUser();
                              if (accountController.accformkey.currentState!
                                  .validate()) {
                                await accountController.createNewUser(
                                    userName: accountController.regName.text,
                                    number: accountController.regmobnum.text,
                                    password: accountController.password.text,
                                    regno: accountController.regno.text,
                                    catId: accountController
                                        .selectCategoryId(
                                            accountController.dropvalue)
                                        .toString());
                              } else {
                                print('not valid');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                )),
                            child: Text("Register")),
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
