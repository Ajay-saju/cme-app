import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? degree;
  String? college;
  String? university;
  String? month;
  String? year;

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

  

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            fontFamily: "Nunito",
          ),
        ),
      );
}
