import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/dashboard/dashboard.dart';
import 'package:hslr/screen/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionController extends GetxController {
  PageController pageController = PageController(initialPage: 0);
  int pageChange = 0;
  bool optionA = false;
  bool optionB = false;
  bool optionC = false;
  bool optionD = false;

  void pagechange() {
    if (pageChange > 0) {
      --pageChange;
      update();
    } else {
      print("not able to decrement");
    }
  }

  List<Question> questionlist = [
    Question(
        question: "Coracobrachialis is pierced by which never?",
        optionA: "Axillary",
        optionB: "Median",
        optionC: "Musculocutaneous",
        optionD: "Ulnar"),
    Question(
        question: "Another Question?",
        optionA: "optionA",
        optionB: "optionB",
        optionC: "optionC",
        optionD: "optionD")
  ];
}

class Question {
  String question;
  String optionA;
  String optionB;
  String optionC;
  String optionD;

  Question({
    required this.question,
    required this.optionA,
    required this.optionB,
    required this.optionC,
    required this.optionD,
  });
}
