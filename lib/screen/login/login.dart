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
    super.initState();
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
                        // SizedBox(
                        //   height: 10,
                        // ),

                        Center(
                          child: SizedBox(
                            height: 150,
                            child: Image.asset(
                              'assets/FB.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // SizedBox(
                        //   height: 10,
                        // ),
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
                          padding: const EdgeInsets.only(top: 20),
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 0),
                              height: 50, //context.height * 0.06,
                              width: context.width * 0.9,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  // color: Color(0xffDC3638),
                                  borderRadius: BorderRadius.circular(10.0),
                                  border: Border.all(color: Colors.black)),
                              child: 
                              DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
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
                                    }),
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
                                return "Your Password is Short";
                              } else {
                                logController.sizedtext();
                                return 'Required Password';
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
                                if (formkey.currentState!.validate()) {
                                  await logController.userLogIn(
                                    mobileNo: logController.mobNumb.text,
                                    pin: logController.password.text,
                                    categoryId: logController.selectCategoryId(
                                        logController.dropvalue),
                                  );
                                  // await logController.getUserId(
                                  //     logController.mobNumb.text,
                                  //     logController.password.text);
                                  // await logController.getUserLastLogin(
                                  //     'M202203151314294521440074394');
                                  // await logController.getUserLastLogin();
                                  // logController.sessionlogin();
                                } else {
                                  print("not valid");
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  )),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    fontFamily: "Nunito",
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                        )),
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
