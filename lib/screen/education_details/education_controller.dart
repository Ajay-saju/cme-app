import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/get_eduid_list.model.dart';
import '../../services/get_eduid_list_servise.dart';

class EducationController extends GetxController {
  final GlobalKey<FormState> addEduFormKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> editEduFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getEduIdList();
  }

  var tabIndex = 0;

  String? degree;
  String? college;
  String? university;
  String? month;
  String? year;
  List<UniversityList>? universityList = [];
  var collegeList = [];
  var courseList = [];
  final degreeItem = [
    'Degree 1',
    'Degree 2',
    'Degree 3',
    'Degree 4',
  ];
  final collegeItem = [
    "college1",
    "college2",
    "college3",
    "college4",
    "college5",
  ];
  final universityItem = [
    "University1",
    "University2",
    "University3",
    "University4",
    "University5",
  ];
  final months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  final years = [
    '2000',
    '2001',
    '2002',
    '2003',
    '2004',
  ];

  DropdownMenuItem<String> buildMenuItem(var item) => DropdownMenuItem(
        value: item.universitName,
        child: Text(
          item.universitName,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: "Nunito",
          ),
        ),
      );

  Rx<GetEducationIdList?> eduIdList = GetEducationIdList().obs;
  getEduIdList() async {
    final eduIdListServise = EduIdListServise();

    try {
      final response = await eduIdListServise.getAllIdList();
      log(response.data);
      var jsonFile = jsonDecode(response.data);

      if (response.statusCode == 200) {
        eduIdList.value = GetEducationIdList.fromJson(jsonFile);

        universityList = eduIdList.value!.universityList!;
        collegeList = eduIdList.value!.collegeList!;
        courseList = eduIdList.value!.courseList!;
        var lists = courseList.map((item) => item['Course_Name']);
      }
    } catch (e) {}
  }
}
