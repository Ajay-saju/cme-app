import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hslr/screen/change_profile_pick/profile_pick_controller.dart';

class ChangeProfilePicture extends StatelessWidget {
  ChangeProfilePicture({Key? key}) : super(key: key);

  final pickController = Get.put(ProfileController());

  Image profilePick() {
    if (pickController.fileImage.value != '')
      return Image.file(File(pickController.fileImage.value));
    else
      return Image.asset('assets/profile.png');
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
                child: Obx(() => 
                     CircleAvatar(
                        radius: 100,
                        backgroundImage:
                            profilePick().image,
                      )
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  Get.defaultDialog(
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
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(80, 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.amber),
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
                                  fontSize: 13, fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(80, 30),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.amber),
                          ),
                        )
                      ],
                    ),
                  ));
                },
                child: Text(
                  'Upload Image',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(350, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.amber),
              ),
            ],
          )
        ],
      ),
    );
  }
}
