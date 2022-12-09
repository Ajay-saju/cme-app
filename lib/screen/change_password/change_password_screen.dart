import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
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
                          "Change Password",
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
                    inputFormatters: [
                      // LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.text,
                    // controller: mebController.memName,
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
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.grey),
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
                        hintText: "Old Password",
                        hintStyle: TextStyle(
                          fontFamily: "Nunito",
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(left: 20.0)),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(
                    20.0,
                  ),
                  child: TextFormField(
                    inputFormatters: [
                      // LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.text,
                    // controller: mebController.memName,
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
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.grey),
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
                        hintText: "New Password",
                        hintStyle: TextStyle(
                          fontFamily: "Nunito",
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(left: 20.0)),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(
                    20.0,
                  ),
                  child: TextFormField(
                    inputFormatters: [
                      // LengthLimitingTextInputFormatter(10),
                    ],
                    keyboardType: TextInputType.text,
                    // controller: mebController.memName,
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
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.black),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(color: Colors.grey),
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
                        hintText: "Conform Password",
                        hintStyle: TextStyle(
                          fontFamily: "Nunito",
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(left: 20.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        // mebController.formkey.currentState!.validate();
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                      child: Text(
                        "Cancel",
                        style: TextStyle(fontFamily: "Nunito"),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        // mebController.formkey.currentState!.validate();
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
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
