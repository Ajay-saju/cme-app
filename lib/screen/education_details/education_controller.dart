import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/base_api/orginal_api.dart';
import 'package:hslr/main.dart';
import 'package:hslr/screen/education_details/education_screen.dart';

import '../../models/get_eduid_list.model.dart';
import '../../services/get_eduid_list_servise.dart';

class EducationController extends GetxController {
  final GlobalKey<FormState> addEduFormKey = GlobalKey<FormState>();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController universityController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  // final GlobalKey<FormState> editEduFormKey = GlobalKey<FormState>();

  var userData = [].obs;
  var userNames = [].obs;
  var searchedItems = [].obs;
  var searchItem = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getEduIdList();
  }

  var tabIndex = 0;
  var collegeCode = '';
  var corseCode = '';
  var universityCode = '';
  String? degree;
  String? college;
  String? university;
  String? month;
  String? year;
  List<UniversityList> universityList = [];
  List<CollegeList>? collegeList = [];
  List<SpecialtyList> specialtyList = [];
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

  DropdownMenuItem<String> buildMenuItemYear(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: "Nunito",
          ),
        ),
      );

  DropdownMenuItem<UniversityList> buildMenuItem(var item) =>
      DropdownMenuItem<UniversityList>(
        value: item,
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

  DropdownMenuItem<SpecialtyList> buildMenuItemCource(var item) =>
      DropdownMenuItem<SpecialtyList>(
        value: item,
        child: Text(
          item.specialtyName,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            fontFamily: "Nunito",
          ),
        ),
      );
  DropdownMenuItem<CollegeList> buildMenuItemCollege(var item) =>
      DropdownMenuItem<CollegeList>(
        value: item,
        child: Text(
          item.collegeName,
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
        specialtyList = eduIdList.value!.specialtyList!;
        for (var i = 0; i < specialtyList.length; i++) {
          userNames.add(specialtyList[i].specialtyName);
        }
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Future addEducationDetails(
      {required String course,
      required String month,
      required String year,
      required String university,
      required String college}) async {
    OrginalApi orginalApi = OrginalApi();
    final dio = Dio(BaseOptions(
        baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));
    var eduData = {
      'Memberid': sessionlog.getString('userId').toString(),
      'yearofPassing': year,
      'CourseCode': course,
      'monthofPassing': month,
      'universitycode': university,
      'collegecode': college,
      'UserName': sessionlog.getString('log_name').toString()
    };
    print(eduData);

    try {
      var response = await dio.post('SaveAddUpdateEduinfoNew', data: eduData);
      if (response.statusCode == 200) {
        await
            //  Get.defaultDialog(
            //     title: "Success",
            //     middleText: 'Save Details successfully',
            //     onConfirm: () {
            //       Get.off(EducationDetailsScreen());
            //     });
            Get.snackbar('Success', 'Save Details successfully',
                colorText: Colors.white,
                backgroundColor: Colors.black,
                duration: Duration(seconds: 3));

        Timer(Duration(seconds: 2), () async {
          Get.off(EducationDetailsScreen());
        });
      }
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  searchItemMethod() {
    print(userData.toString());
    searchedItems.value = userNames
        .where((element) =>
            element.toLowerCase().contains(searchItem.toLowerCase()))
        .toList();
    update();
  }
}
