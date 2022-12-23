import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/otpScreen/otp_screen_controller.dart';

import '../changePassword/change_password.dart';
import '../login/login_controller.dart';

class OtpScreen extends StatefulWidget {
  final String no;
  final String otp;
  const OtpScreen({Key? key, required this.no, required this.otp})
      : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? resendOtp;
  final otpController = Get.put(OptScreenController());
  LoginController loginController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
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
                          "Enter OTP",
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
              SizedBox(
                height: 40,
              ),
              Text(
                'Enter 4-digit OTP sent to',
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Nunito",
                    letterSpacing: 1,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "+91 ${widget.no}",
                style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  cursorColor: Colors.black,
                  inputFormatters: [LengthLimitingTextInputFormatter(4)],
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    otpController.enterdOtp = value;
                  },
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w700),
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      hintText: 'Enter OTP',
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Didn't receive code?",
                  style: TextStyle(
                      fontFamily: "Nunito",
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)),
              SizedBox(
                height: 15,
              ),
              Obx(() => otpController.isTimerVisible == true?
              Text('Resend OTP in ${otpController.seconds} sec ',
                  style: TextStyle(
                      fontFamily: "Nunito",
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                      fontSize: 14)):SizedBox()
                      ),
              SizedBox(
                height: 10,
              ),
              Obx(() => otpController.isVisible == true
                  ? TextButton(
                      onPressed: () {
                        otpController.seconds.value = 60;
                        otpController.isStopTimer.value = true;
                        resendOtp = loginController.grnarateOtp().toString();
                      },
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(
                          color: Colors.black45,
                          fontFamily: "Nunito",
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                  : SizedBox()),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () async {
                  print(widget.otp);
                  print(otpController.enterdOtp);

                  if (otpController.enterdOtp == widget.otp ||
                      otpController.enterdOtp == resendOtp) {
                    Get.to(ChangePassword());
                    // await otpController.userLogin(no, 'yes');
                  } else {
                    // await otpVerificationController.userLogin(no, 'no');

                    Get.defaultDialog(
                        title: 'Wrong OTP',
                        middleText: 'You are enterd a wrong OTP');
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.black),
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Verify OTP',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
