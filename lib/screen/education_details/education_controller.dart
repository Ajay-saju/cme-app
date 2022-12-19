import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EducationController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String? dropvalue;
  final dropitems = [
    'Medical',
    'Nursing',
    'Dental',
    'Ayurvedic',
  ];
}
