import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileTabController extends GetxController {
  final GlobalKey<FormState> profileTabFormkey = GlobalKey<FormState>();

  final memName = TextEditingController();
  final memPhoneno = TextEditingController();
  final memCouncilno = TextEditingController();
  final memCouncilName= TextEditingController();
   bool isObscure = true;
}
