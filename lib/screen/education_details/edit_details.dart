import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:hslr/models/get_eduid_list.model.dart';
import 'package:hslr/screen/education_details/education_controller.dart';
import 'package:hslr/screen/education_details/education_screen.dart';

import '../dashboard/dashboard_controller.dart';

class EditEduDetails extends StatefulWidget {
  final index;

  const EditEduDetails({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<EditEduDetails> createState() => _EditEduDetailsState();
}

class _EditEduDetailsState extends State<EditEduDetails> {
  final eduController = Get.find<EducationController>();
  final dashControll = Get.find<DashboardController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eduController.collegeController.text =
        dashControll.eduList.value.result![widget.index].cOLLEGE.toString();
    eduController.universityController.text =
        dashControll.eduList.value.result![widget.index].uNIVERSITY.toString();
    eduController.degreeController.text =
        dashControll.eduList.value.result![widget.index].dEGREE.toString();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eduController.degreeController.clear();
    eduController.universityController.clear();
    eduController.collegeController.clear();
  }

  @override
  Widget build(BuildContext context) {
    print(eduController.universityController.toString());
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
                      Form(
                          child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  'Degree',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "Nunito",
                                      color: Colors.black87),
                                ),
                                Spacer(),
                                Container(
                                  width: context.width * 0.55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.black87)),
                                  child: TypeAheadFormField(
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return eduController
                                              .degreeController.text;
                                        }
                                      },
                                      hideOnError: true,
                                      hideSuggestionsOnKeyboardHide: false,
                                      hideKeyboardOnDrag: true,
                                      textFieldConfiguration:
                                          TextFieldConfiguration(

                                              // cursorHeight: 20,
                                              cursorColor: Colors.black87,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 11,
                                                    right: 15),
                                                hintText: 'Select Course',
                                              ),
                                              controller: eduController
                                                  .degreeController),
                                      suggestionsCallback: (pattern) {
                                        return eduController.specialtyList
                                            .where((element) => element
                                                .specialtyName!
                                                .toLowerCase()
                                                .contains(
                                                    pattern.toLowerCase()));
                                      },
                                      itemBuilder:
                                          (context, SpecialtyList suggestion) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              Text(suggestion.specialtyName!),
                                        );
                                      },
                                      onSuggestionSelected:
                                          (SpecialtyList suggestion) {
                                        eduController.degreeController.text =
                                            suggestion.specialtyName!;
                                        eduController.corseCode =
                                            suggestion.specialtyId!.toString();
                                      }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  'Select University',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "Nunito",
                                      color: Colors.black87),
                                ),
                                Spacer(),
                                Container(
                                  width: context.width * 0.55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.black87)),
                                  child: TypeAheadFormField(
                                      validator: (value) {
                                        // if(value==null){
                                        //   eduController.universityCode =
                                        //       suggestion.universitCode!
                                        // }
                                      },
                                      hideOnError: true,
                                      hideSuggestionsOnKeyboardHide: false,
                                      hideKeyboardOnDrag: true,
                                      textFieldConfiguration:
                                          TextFieldConfiguration(

                                              // cursorHeight: 20,
                                              cursorColor: Colors.black87,
                                              decoration: new InputDecoration(
                                                border: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                enabledBorder: InputBorder.none,
                                                errorBorder: InputBorder.none,
                                                disabledBorder:
                                                    InputBorder.none,
                                                contentPadding: EdgeInsets.only(
                                                    left: 15,
                                                    bottom: 11,
                                                    top: 11,
                                                    right: 15),
                                                hintText: 'Select University',
                                              ),
                                              controller: eduController
                                                  .universityController),
                                      suggestionsCallback: (pattern) {
                                        return eduController.universityList
                                            .where((element) => element
                                                .universitName!
                                                .toLowerCase()
                                                .contains(
                                                    pattern.toLowerCase()));
                                      },
                                      itemBuilder:
                                          (context, UniversityList suggestion) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child:
                                              Text(suggestion.universitName!),
                                        );
                                      },
                                      onSuggestionSelected:
                                          (UniversityList suggestion) {
                                        eduController.getCollageCode(
                                            universityId:
                                                suggestion.universitCode!);
                                        eduController.universityController
                                            .text = suggestion.universitName!;
                                        eduController.universityCode =
                                            suggestion.universitCode!;
                                      }),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              children: [
                                Text(
                                  'College',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "Nunito",
                                      color: Colors.black87),
                                ),
                                Spacer(),
                                Container(
                                  width: context.width * 0.55,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.black87)),
                                  child: TypeAheadField(
                                    hideOnError: true,
                                    hideSuggestionsOnKeyboardHide: false,
                                    hideKeyboardOnDrag: true,
                                    textFieldConfiguration:
                                        TextFieldConfiguration(
                                            cursorColor: Colors.black87,
                                            decoration: new InputDecoration(
                                              border: InputBorder.none,
                                              focusedBorder: InputBorder.none,
                                              enabledBorder: InputBorder.none,
                                              errorBorder: InputBorder.none,
                                              disabledBorder: InputBorder.none,
                                              contentPadding: EdgeInsets.only(
                                                  left: 15,
                                                  bottom: 11,
                                                  top: 11,
                                                  right: 15),
                                              hintText: "Select Collage",
                                            ),
                                            controller: eduController
                                                .collegeController),
                                    suggestionsCallback: (pattern) {
                                      return eduController.collegeList!.where(
                                          (element) => element.collegeName!
                                              .toLowerCase()
                                              .contains(pattern.toLowerCase()));
                                    },
                                    itemBuilder:
                                        (context, CollegeList suggestion) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(suggestion.collegeName!),
                                      );
                                    },
                                    onSuggestionSelected:
                                        (CollegeList suggestion) {
                                      eduController.collegeController.text =
                                          suggestion.collegeName!;
                                      eduController.collegeCode =
                                          suggestion.collegeCode!;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                                  await eduController.editEducationDetails(
                                    college: eduController.collegeCode,
                                    course: eduController.corseCode,
                                    month: eduController.month.toString(),
                                    year: eduController.year.toString(),
                                    university: eduController.universityCode,
                                  );
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
      // required String selectedBox,
      required String text,
      required String? item,
      required List<dynamic> items,
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
            child: DropdownButtonFormField<UniversityList>(
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
                items: items.map((item) {
                  return eduController.buildMenuItem(item);
                }).toList(),
                onChanged: (value) {
                  item = value.toString();
                  var id = value!.universitCode;
                  print(id.toString());
                  print('==============================');
                  eduController.update();
                }),
          ),
        ],
      ),
    );
  }

  Padding customeDropDownTextCource(
      {required BuildContext context,
      required String text,
      required String? item,
      required List<dynamic> items,
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
            child: DropdownButtonFormField<SpecialtyList>(
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
                items: items.map((item) {
                  return eduController.buildMenuItemCource(item);
                }).toList(),
                onChanged: (value) {
                  item = value.toString();
                  var id = value!.specialtyId;
                  print(id.toString());
                  print('==============================');
                  eduController.update();
                }),
          ),
        ],
      ),
    );
  }

  Padding customeDropDownTextCollege(
      {required BuildContext context,
      required String text,
      required String? item,
      required List<dynamic> items,
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
            child: DropdownButtonFormField<CollegeList>(
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
                items: items.map((item) {
                  return eduController.buildMenuItemCollege(item);
                }).toList(),
                onChanged: (value) {
                  item = value.toString();
                  var id = value!.collegeCode;
                  print(id.toString());
                  print('==============================');
                  eduController.update();
                }),
          ),
        ],
      ),
    );
  }

  Padding customeDropDownTextMonth(
      {required BuildContext context,
      required String text,
      required String? item,
      required List<dynamic> items,
      required String? hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
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
                  hintText ?? 'Select Month',
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Nunito",
                      color: Colors.black87),
                ),
                items: eduController.months.map((item) {
                  return eduController.buildMenuItemYear(item);
                }).toList(),
                onChanged: (value) {
                  eduController.month = value.toString();
                  eduController.update();
                }),
          ),
        ],
      ),
    );
  }
}
