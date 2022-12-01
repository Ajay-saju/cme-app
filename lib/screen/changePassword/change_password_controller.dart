import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
// TextEditingController userpasswordController =TextEditingController();
 final GlobalKey<FormState> form = GlobalKey<FormState>();
  final TextEditingController pass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();
bool isObscurePass = false;
bool isObscureConfirmPass=false;



}