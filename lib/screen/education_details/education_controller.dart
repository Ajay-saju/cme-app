import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/base_api/orginal_api.dart';
import 'package:hslr/main.dart';
import 'package:hslr/screen/education_details/education_screen.dart';
import 'package:hslr/screen/loading_class/loading_class.dart';
import 'package:hslr/screen/profile_tab/profile_tab.dart';
import 'package:hslr/services/add_edu_data_servise.dart';
import 'package:hslr/services/collage_list_servise.dart';
import '../../models/college_list_model.dart';
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

        // collegeList = eduIdList.value!.collegeList!;

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

  Rx<GetCollegeList> getCollegeList = GetCollegeList().obs;
  getCollageCode({required String universityId}) async {
    DialogHelper.showLoading();
    final collegeListServise = CollageListServise();
    try {
      final response = await collegeListServise.getCollageList(universityId);
      if (response.statusCode == 200) {
        DialogHelper.hideLoading();
        log(response.data);
        var jsonFile = jsonDecode(response.data);
        getCollegeList.value = GetCollegeList.fromJson(jsonFile);

        collegeList = getCollegeList.value.collegeList;

        print(getCollegeList.value.collegeList![0].collegeName);
      }
    } catch (e) {}
  }

  Future addNewEduData(
      {required String universityId,
      required String collageCode,
      required String courseId}) async {
    final addEduDataServise = AddEduDataServise();
    DialogHelper.showLoading();

    // Map<String, dynamic> newEduData;
    var newEduData = {
      "countryId": sessionlog.getInt('country').toString(),
      "stateId": sessionlog.getString('stateId').toString(),
      "councilId": sessionlog.getString('councilId').toString(),
      "memberid": sessionlog.getString('userId'),
      "courseCode": courseId,
      "universitycode": universityId,
      "collegecode": collageCode,
      "createdby": sessionlog.getString('log_name'),
      "updatedby": sessionlog.getString('log_name'),
    };
    print(newEduData);
    try {
      var response = await addEduDataServise.postNewEduData(
        collageCode: collageCode,
        courseId: corseCode,
        universityId: universityId,
      );
      if (response.statusCode == 200) {
        log(response.data);
        DialogHelper.hideLoading();
        await 
        Get.defaultDialog(
            barrierDismissible: false,
            title: "Success",
            middleTextStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            titleStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'Save Details successfully',
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.offAll(ProfileScreenTab());
                },
                child: Text('Ok'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              )
            ]);
      }
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future editEducationDetails(
      {required String course,
      required String month,
      required String year,
      required String university,
      required String college}) async {
    DialogHelper.showLoading();
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
      print(response.data.toString());
      if (response.statusCode == 200) {
        DialogHelper.hideLoading();
        await Get.defaultDialog(
            barrierDismissible: false,
            title: "Success",
            middleTextStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            titleStyle: TextStyle(
              fontFamily: "Nunito",
              color: Colors.black87,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            middleText: 'Save Details successfully',
            actions: [
              ElevatedButton(
                onPressed: () {
                  Get.off(EducationDetailsScreen());
                },
                child: Text('Ok'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    )),
              )
            ]
            // onConfirm: () {
            //
            // }
            );
        // Get.snackbar('Success', 'Save Details successfully',
        //     colorText: Colors.white,
        //     backgroundColor: Colors.black,
        //     duration: Duration(seconds: 3));

        // Timer(Duration(seconds: 2), () async {
        //   Get.off(EducationDetailsScreen());
        // });
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
