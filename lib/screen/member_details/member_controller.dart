import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemberDetailsController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final memName = TextEditingController();
  TextEditingController councilName = TextEditingController();
  TextEditingController membmobile = TextEditingController();
  TextEditingController membstate = TextEditingController();
  TextEditingController membdistr = TextEditingController();
  TextEditingController changepass = TextEditingController();
  TextEditingController regno = TextEditingController();
  TextEditingController regpass = TextEditingController();

  bool isObscure = true;
  bool sizechangepass = false;
  String? speciality;
  String? program;

  var specialitylist = [
    'test1',
    'test2',
    'test3',
    'test4',
    'test5',
    'test6',
  ];

  var programlist = [
    'test1',
    'test2',
    'test3',
    'test4',
    'test5',
    'test6',
  ];
  // sizepass() {
  //   sizechangepass = true;
  //   update();
  //   print("object:$sizechangepass");
  // }
}
