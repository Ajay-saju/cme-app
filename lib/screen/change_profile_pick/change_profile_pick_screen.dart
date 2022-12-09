import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hslr/screen/change_profile_pick/profile_pick_controller.dart';

class ChangeProfilePicture extends StatelessWidget {
  ChangeProfilePicture({Key? key}) : super(key: key);

  final pickController = Get.put(ProfileController());

  Image profilePick() {
    if (pickController.fileImage.value != '')
      return Image.file(
        File(
          pickController.fileImage.value,
        ),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    else
      return Image.asset(
        'assets/profile.png',
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
  }

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
                          "Update Profile Picture",
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
                child: Obx(() => CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 103,
                      child: CircleAvatar(
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(.0),
                        //   child: profilePick(),
                        // ),
                        backgroundColor: Colors.white,
                        radius: 100,
                        backgroundImage: profilePick().image,
                      ),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  Get.defaultDialog(
                    barrierDismissible: false,
                      title: 'Image from',
                      titleStyle: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                      content: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  pickController.imageFromGallery();
                                  Get.back();
                                },
                                child: Text(
                                  'Gallery',
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400),
                                ),
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(80, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.black87),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  pickController.imageFromCamara();
                                  Get.back();
                                },
                                child: Text(
                                  'Camara',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    fixedSize: Size(80, 30),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    backgroundColor: Colors.black87),
                              ),
                            )
                          ],
                        ),
                      ));
                },
                child: Text(
                  'Upload Image',
                  style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.black),
              ),
            ],
          )
        ],
      ),
    );
  }
}
