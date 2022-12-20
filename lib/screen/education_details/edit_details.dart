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
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: eduController.degree,
                                  isExpanded: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Image.asset(
                                      'assets/Dropdownb.png',
                                      color: Colors.black87,
                                    ),
                                  ),
                                  hint: Text(
                                    "  Degree",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        color: Colors.black87),
                                  ),
                                  items: eduController.degreeItem
                                      .map(eduController.buildMenuItem)
                                      .toList(),
                                  onChanged: (value) {
                                    eduController.degree = value;
                                    eduController.update();
                                  }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: eduController.college,
                                  isExpanded: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Image.asset(
                                      'assets/Dropdownb.png',
                                      color: Colors.black87,
                                    ),
                                  ),
                                  hint: Text(
                                    "  College",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        color: Colors.black87),
                                  ),
                                  items: eduController.collegeItem
                                      .map(eduController.buildMenuItem)
                                      .toList(),
                                  onChanged: (value) {
                                    eduController.college = value;
                                    eduController.update();
                                  }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: eduController.university,
                                  isExpanded: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Image.asset(
                                      'assets/Dropdownb.png',
                                      color: Colors.black87,
                                    ),
                                  ),
                                  hint: Text(
                                    "  University",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        color: Colors.black87),
                                  ),
                                  items: eduController.universityItem
                                      .map(eduController.buildMenuItem)
                                      .toList(),
                                  onChanged: (value) {
                                    eduController.university = value;
                                    eduController.update();
                                  }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: eduController.month,
                                  isExpanded: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Image.asset(
                                      'assets/Dropdownb.png',
                                      color: Colors.black87,
                                    ),
                                  ),
                                  hint: Text(
                                    "  Select month",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        color: Colors.black87),
                                  ),
                                  items: eduController.months
                                      .map(eduController.buildMenuItem)
                                      .toList(),
                                  onChanged: (value) {
                                    eduController.month = value;
                                    eduController.update();
                                  }),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
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
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                  value: eduController.year,
                                  isExpanded: true,
                                  icon: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Image.asset(
                                      'assets/Dropdownb.png',
                                      color: Colors.black87,
                                    ),
                                  ),
                                  hint: Text(
                                    "  Select year",
                                    style: TextStyle(
                                        fontFamily: "Nunito",
                                        color: Colors.black87),
                                  ),
                                  items: eduController.years
                                      .map(eduController.buildMenuItem)
                                      .toList(),
                                  onChanged: (value) {
                                    eduController.year = value;
                                    eduController.update();
                                  }),
                            ),
                          ),
                        ),
                      ),
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

  Padding costomeDropDown({required List<String> items, required String item}) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        child: DropdownButtonFormField(
            itemHeight: null,
            isExpanded: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8),
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
              "  Degree",
              style: TextStyle(
                  fontSize: 16, fontFamily: "Nunito", color: Colors.black87),
            ),
            items: items.map(eduController.buildMenuItem).toList(),
            onChanged: (value) {
              item = value.toString();
              eduController.update();
            }),
      ),
    );
  }
}
