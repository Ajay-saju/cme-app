import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController{
 final GlobalKey<FormState> accformkey = GlobalKey<FormState>();
  
  TextEditingController mobNumb = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController formobnumb = TextEditingController();
  TextEditingController forregnumb = TextEditingController();
  TextEditingController regName = TextEditingController();
  TextEditingController regmobnum = TextEditingController();
  TextEditingController regno = TextEditingController();
  TextEditingController regpass = TextEditingController();

  bool isObscure = true;
   bool sizetext = false;
    String? dropvalue;

   creatsized() {
    sizetext = true;
    update();
    print("object:$sizetext");
  }

  final dropitems = [
    'Medical',
    'Nursing',
    'Dental',
    'Ayurvedic',
  ];
 DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 20,
            fontFamily: "Nunito",
          ),
        ),
      );

}