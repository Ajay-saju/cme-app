import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/profile_tab/profile_tab.dart';
import '../../main.dart';
import '../../models/college_list_model.dart';
import '../../models/get_edu_details_model.dart';
import '../../models/get_eduid_list.model.dart';
import '../../services/add_edu_data_servise.dart';
import '../../services/collage_list_servise.dart';
import '../../services/edit_edu_data_servise.dart';
import '../../services/education_details_service.dart';
import '../../services/get_eduid_list_servise.dart';
import '../loading_class/loading_class.dart';

class ProfileTabController extends GetxController {
  final GlobalKey<FormState> profileTabFormkey = GlobalKey<FormState>();
  final GlobalKey<FormState> addEduFormKey = GlobalKey<FormState>();

  final memName = TextEditingController();
  final memPhoneno = TextEditingController();
  final memCouncilno = TextEditingController();
  final memCouncilName = TextEditingController();
  final degreeController = TextEditingController();
  final universityController = TextEditingController();
  final collegeController = TextEditingController();

  var isLoading = true.obs;

  var isEditable = false.obs;
  bool isReadOnly = false;
  bool isReadOnly1 = true;
  bool isReadOnly2 = true;
  bool isReadOnly3 = true;

  var userNames = [].obs;

  var collegeCode = '';
  var corseCode = '';
  var universityCode = '';
  String? month;
  String? year;

  List<UniversityList> universityList = [];
  List<CollegeList>? collegeList = [];
  List<SpecialtyList> specialtyList = [];

  Rx<GetEduDEtails> eduList = GetEduDEtails().obs;
  Future<GetEduDEtails?> getEduList() async {
    isLoading.value = true;
    print('working education list...');
    final ediListService = EducationDetalsServ();

    try {
      final response = await ediListService.getEduDetails();

      var jsonFile = jsonDecode(response.data);
      if (response.statusCode == 200) {
        log(response.data);
        eduList.value = GetEduDEtails.fromJson(jsonFile);
        isLoading.value = false;
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  Rx<GetEducationIdList?> eduIdList = GetEducationIdList().obs;
  Future getEduIdList() async {
    isLoading.value = true;
    final eduIdListServise = EduIdListServise();

    try {
      final response = await eduIdListServise.getAllIdList();
      log(response.data);
      var jsonFile = jsonDecode(response.data);

      if (response.statusCode == 200) {
        isLoading.value = false;
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

  Future getInitialCollageList({required String universityId}) async {
    final collegeListServise = CollageListServise();
    try {
      final response = await collegeListServise.getCollageList(universityId);
      if (response.statusCode == 200) {
        log(response.data);
        var jsonFile = jsonDecode(response.data);
        getCollegeList.value = GetCollegeList.fromJson(jsonFile);

        collegeList = getCollegeList.value.collegeList;

        print(getCollegeList.value.collegeList![0].collegeName);
      }
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
    update();
  }

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
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
    update();
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
    update();
  }

  Future editEducationDetails(
      {required String courseId,
      required String month,
      required String year,
      required String universityId,
      required String collegeId}) async {
    DialogHelper.showLoading();

    final editEduData = EditEduData();
    // OrginalApi orginalApi = OrginalApi();
    // final dio = Dio(BaseOptions(
    //     baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));
    var eduData = {
      'Memberid': sessionlog.getString('userId').toString(),
      'yearofPassing': year,
      'CourseCode': courseId,
      'monthofPassing': month,
      'universitycode': universityId,
      'collegecode': collegeId,
      'UserName': sessionlog.getString('log_name').toString()
    };
    print(eduData);

    try {
      var response = await editEduData.editEduDta(eduData);
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
    update();
  }
}
