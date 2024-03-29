import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/creat_account/create_account.dart';
import 'package:hslr/screen/forgotpassword/forgot_password.dart';
import 'package:hslr/screen/login/login_controller.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController logController = Get.put(LoginController());
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    sessionlogin();
    // logController.getDashboa/rdData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    logController.mobNumb.clear();
    logController.password.clear();
    logController.dropvalue = null;
  }

  @override
  void sessionlogin() async {
    // SharedPreferences sessionlog = await SharedPreferences.getInstance();
    // var user = sessionlog.getString('log_name');
    // if (user == null) {
    //   print(user.toString());
    //   Get.to(Login());
    // } else {
    //   Get.to(Dashboard());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: ((_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.white, //Color(0xff63c3fe), //#4e98f5
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: SizedBox(
                            height: 150,
                            child: Image.asset(
                              'assets/FB.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Nunito",
                              // fontStyle: NunitoSans,
                              // color: Colors.blue.shade700,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButtonFormField<String>(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
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
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide:
                                        const BorderSide(color: Colors.black),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(right: 10, left: 15),
                                  // border: InputBorder.none
                                ),
                                value: logController.dropvalue,
                                isExpanded: true,
                                icon: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Image.asset(
                                    'assets/Dropdownb.png',
                                    color: Color(0xffDC3638),
                                  ),
                                ),
                                hint: Text(
                                  "  Select Profession",
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      color: Colors.black87),
                                ),
                                items: logController.dropitems
                                    .map(logController.buildMenuItem)
                                    .toList(),
                                onChanged: (value) {
                                  logController.dropvalue = value;
                                  logController.update();
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return "Please select a profession.";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),

                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, top: 20),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10),
                              ],
                              keyboardType: TextInputType.phone,
                              controller: logController.mobNumb,
                              validator: (value) {
                                if (value!.isNotEmpty && value.length > 9) {
                                  return null;
                                } else if (value.length < 9 &&
                                    value.isNotEmpty) {
                                  return "Your Mobile Is Short";
                                } else {
                                  return 'Required Mobile No ';
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
                                        const BorderSide(color: Colors.black),
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
                              // decoration: InputDecoration.collapsed(
                              //   border: BorderRadius.circular(radius),
                              //     hintStyle: TextStyle(color: Colors.grey),
                              //     hintText: "Mobile Number"),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: context.width > 410 ? 0 : 25,
                        // ),
                        SizedBox(
                          height: 20,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                            right: 20.0,
                          ),
                          child: TextFormField(
                            onTap: () {},
                            cursorColor: Colors.black,
                            obscureText: logController.isObscure,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                            ],
                            keyboardType: TextInputType.number,
                            controller: logController.password,
                            validator: (value) {
                              if (value!.isNotEmpty && value.length > 3) {
                                return null;
                              } else if (value.length < 3 && value.isNotEmpty) {
                                return "Your Pin is Short";
                              } else {
                                logController.sizedtext();
                                return 'Required Pin';
                              }
                            },
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    // iconSize: 15.0,
                                    color: Colors.black,
                                    onPressed: () {
                                      logController.isObscure =
                                          !logController.isObscure;
                                      logController.update();
                                    },
                                    icon: Icon(
                                      logController.isObscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Color(0xffDC3638),
                                    )),
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
                                      const BorderSide(color: Colors.black),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: Colors.black),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                hintStyle: TextStyle(
                                  fontFamily: "Nunito",
                                ),
                                hintText: "Pin",
                                filled: true,
                                fillColor: Colors.white,
                                contentPadding: EdgeInsets.only(
                                  left: 20.0,
                                )),
                          ),
                        ),

                        SizedBox(
                          height: 20,
                        ),
                        // SizedBox(
                        //   height: context.width > 410 ? 0 : 20,
                        // ),

                        SizedBox(
                          height: 45,
                        ),
                        Center(
                            child: SizedBox(
                                height: 35,
                                width: context.width * 0.25,
                                child: ElevatedButton(
                                    onPressed: () async {
                                      logController.isfade = false;
                                      if (formkey.currentState!.validate()) {
                                        await logController.userLogIn(
                                          mobileNo: logController.mobNumb.text,
                                          pin: logController.password.text,
                                          categoryId:
                                              logController.selectCategoryId(
                                                  logController.dropvalue),
                                        );
                                      } else {
                                        print("not valid");
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        )),
                                    child: Text(
                                      // logController.isfade != true
                                      //     ? "Wait"
                                      //     :
                                      'Login',
                                      style: TextStyle(
                                          fontFamily: "Nunito",
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )))),
                        SizedBox(
                          height: 15,
                        ),

                        GestureDetector(
                            onTap: () {
                              Get.to(Forgotpassword());
                            },
                            child: Center(
                                child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Nunito",
                              ),
                            ))),
                        SizedBox(
                          height: 25,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.offAll(CreateAccount());
                            },
                            child: Center(
                                child: Text(
                              "Create New Account",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                              ),
                            ))),
                      ],
                    ),
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
