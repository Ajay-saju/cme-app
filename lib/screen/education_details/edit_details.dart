import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/education_details/education_controller.dart';
import 'package:hslr/screen/education_details/education_screen.dart';

class EditEduDetails extends StatefulWidget {
  const EditEduDetails({Key? key}) : super(key: key);

  @override
  State<EditEduDetails> createState() => _EditEduDetailsState();
}

class _EditEduDetailsState extends State<EditEduDetails> {
  final eduController = Get.find<EducationController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<EducationController>(builder: ((_) {
      return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: Colors.white, //Color(0xff63c3fe),
            body: SafeArea(
              child: Form(
                // key: eduController.formkey,
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
                                  "Edit Education Details",
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
                      // costomeDropDown(
                      //   item: eduController.degree!,
                      //   items: eduController.degreeItem,
                      // ),

                      Form(
                          // key: eduController.editEduFormKey,
                          child: Column(
                        children: [
                          customeDropDownText(
                            context: context,
                            hintText: 'DM (Cl.Haem)',
                            item: eduController.degree,
                            items: eduController.degreeItem,
                            text: 'Degree',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          customeDropDownText(
                            context: context,
                            hintText: 'February',
                            item: eduController.month,
                            items: eduController.months,
                            text: 'Yearof\nPassing',
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Spacer(),
                                Container(
                                  width: context.width * 0.55,
                                  child: DropdownButtonFormField(
                                      validator: (value) => value == null
                                          ? 'field required'
                                          : null,
                                      itemHeight: null,
                                      isExpanded: true,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 7),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                              color: Colors.black),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: const BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "Nunito",
                                          color: Colors.black87),
                                      hint: Text(
                                        '2022',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Nunito",
                                            color: Colors.black87),
                                      ),
                                      items: eduController.years
                                          .map(eduController.buildMenuItem)
                                          .toList(),
                                      onChanged: (value) {
                                        eduController.year = value.toString();
                                        eduController.update();
                                      }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          customeDropDownText(
                              context: context,
                              hintText: 'The Royal College of Radiologist',
                              item: eduController.university,
                              items: eduController.universityItem,
                              text: 'University\nName'),
                          SizedBox(
                            height: 15,
                          ),
                          customeDropDownText(
                              context: context,
                              hintText: 'RCP U.K',
                              item: eduController.college,
                              items: eduController.collegeItem,
                              text: 'College'),
                        ],
                      )),

                      SizedBox(
                        height: 40,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Get.off(EducationDetailsScreen());
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                                child: Text(
                                  'Cancel',
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                )),
                            ElevatedButton(
                                onPressed: () async {
                                  await Get.snackbar(
                                      'Success', 'Edit Details successfully',
                                      colorText: Colors.white,
                                      backgroundColor: Colors.black,
                                      duration: Duration(seconds: 3));

                                  Timer(Duration(seconds: 2), () async {
                                    Get.off(EducationDetailsScreen());
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    )),
                                child: Text(
                                  'Save',
                                  style: TextStyle(
                                      fontFamily: "Nunito",
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
      );
    }));
  }

  Padding customeDropDownText(
      {required BuildContext context,
      required String text,
      required String? item,
      required List<String> items,
      required String hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 17, fontFamily: "Nunito", color: Colors.black87),
          ),
          Spacer(),
          Container(
            width: context.width * 0.55,
            child: DropdownButtonFormField(
                validator: (value) => value == null ? 'field required' : null,
                itemHeight: null,
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(color: Colors.black),
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
                ),
                style: TextStyle(
                    fontSize: 17, fontFamily: "Nunito", color: Colors.black87),
                hint: Text(
                  hintText,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Nunito",
                      color: Colors.black87),
                ),
                items: items.map(eduController.buildMenuItem).toList(),
                onChanged: (value) {
                  item = value.toString();
                  eduController.update();
                }),
          ),
        ],
      ),
    );
  }
}
