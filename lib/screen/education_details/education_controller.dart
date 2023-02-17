// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hslr/main.dart';
// import 'package:hslr/screen/loading_class/loading_class.dart';
// import 'package:hslr/screen/profile_tab/profile_tab.dart';
// import 'package:hslr/services/add_edu_data_servise.dart';
// import 'package:hslr/services/collage_list_servise.dart';
// import '../../models/college_list_model.dart';
// import '../../models/get_eduid_list.model.dart';
// import '../../services/edit_edu_data_servise.dart';
// import '../../services/get_eduid_list_servise.dart';

// class EducationController extends GetxController {
//   final GlobalKey<FormState> addEduFormKey = GlobalKey<FormState>();
//   final TextEditingController degreeController = TextEditingController();
//   final TextEditingController universityController = TextEditingController();
//   final TextEditingController collegeController = TextEditingController();
//   // final GlobalKey<FormState> editEduFormKey = GlobalKey<FormState>();

//   var userData = [].obs;
//   var userNames = [].obs;
//   var searchedItems = [].obs;
//   var searchItem = ''.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     getEduIdList();
//   }

//   var tabIndex = 0;
//   var collegeCode = '';
//   var corseCode = '';
//   var universityCode = '';
//   String? degree;
//   String? college;
//   String? university;
//   String? month;
//   String? year;
  
//   final degreeItem = [
//     'Degree 1',
//     'Degree 2',
//     'Degree 3',
//     'Degree 4',
//   ];
//   final collegeItem = [
//     "college1",
//     "college2",
//     "college3",
//     "college4",
//     "college5",
//   ];
//   final universityItem = [
//     "University1",
//     "University2",
//     "University3",
//     "University4",
//     "University5",
//   ];
//   final months = [
//     'January',
//     'February',
//     'March',
//     'April',
//     'May',
//     'June',
//     'July',
//     'August',
//     'September',
//     'October',
//     'November',
//     'December'
//   ];
//   final years = [
//     '2000',
//     '2001',
//     '2002',
//     '2003',
//     '2004',
//   ];

//   DropdownMenuItem<String> buildMenuItemYear(String item) => DropdownMenuItem(
//         value: item,
//         child: Text(
//           item,
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//             fontFamily: "Nunito",
//           ),
//         ),
//       );

//   DropdownMenuItem<UniversityList> buildMenuItem(var item) =>
//       DropdownMenuItem<UniversityList>(
//         value: item,
//         child: Text(
//           item.universitName,
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//             fontFamily: "Nunito",
//           ),
//         ),
//       );

//   DropdownMenuItem<SpecialtyList> buildMenuItemCource(var item) =>
//       DropdownMenuItem<SpecialtyList>(
//         value: item,
//         child: Text(
//           item.specialtyName,
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//             fontFamily: "Nunito",
//           ),
//         ),
//       );
//   DropdownMenuItem<CollegeList> buildMenuItemCollege(var item) =>
//       DropdownMenuItem<CollegeList>(
//         value: item,
//         child: Text(
//           item.collegeName,
//           style: TextStyle(
//             color: Colors.black87,
//             fontWeight: FontWeight.w400,
//             fontSize: 16,
//             fontFamily: "Nunito",
//           ),
//         ),
//       );
  

  

  
//   searchItemMethod() {
//     print(userData.toString());
//     searchedItems.value = userNames
//         .where((element) =>
//             element.toLowerCase().contains(searchItem.toLowerCase()))
//         .toList();
//     update();
//   }
// }
