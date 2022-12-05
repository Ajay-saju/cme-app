import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  @override
  void onInit() {
    isStopTimer.value = true;
    startTimer();

    super.onInit();
  }

  @override
  void dispose() {
    isStopTimer.value = false;
    startTimer();
  }
var tabIndex = 0;
  // final prefs =  SharedPreferences.getInstance();
  PageController pageController = PageController(initialPage: 0);
  int pageChange = 0;
  bool optionA = false;
  bool optionB = false;
  bool optionC = false;
  bool optionD = false;
 String selectedOption ='' ;
// List<Ans> answers=[
//   Ans(answer: '')
// ];


  Map answers = {};

  void pagechange() {
    if (pageChange > 0) {
      --pageChange;
      update();
    } else {
      print("not able to decrement");
    }
  }

  static const maxSeconds = 10;
  Timer? countdownTimer;
  String enterdOtp = '';

  RxInt seconds = maxSeconds.obs;
  var isStopTimer = true.obs;
  var isVisible = false.obs;

  void startTimer() {
    countdownTimer = Timer.periodic(Duration(minutes: 1), (_) {
      if (seconds > 0 && isStopTimer == true) {
        seconds--;
        isVisible.value = false;
        print(seconds);
      } else {
        isVisible.value = true;
        isStopTimer.value = false;
      }
    });
    update();
  }

  List<Question> questionlist = [
    Question(
        question: "Coracobrachialis is pierced by which never?",
        optionA: "Axillary",
        optionB: "Median",
        optionC: "Musculocutaneous",
        optionD: "Ulnar"),
    Question(
        question: "Another Question 2?",
        optionA: "optionA",
        optionB: "optionB",
        optionC: "optionC",
        optionD: "optionD"),
    Question(
        question: "Another Question3 ?",
        optionA: "optionA",
        optionB: "optionB",
        optionC: "optionC",
        optionD: "optionD"),
    Question(
        question: "Another Question4 ?",
        optionA: "optionA",
        optionB: "optionB",
        optionC: "optionC",
        optionD: "optionD"),
    Question(
        question: "Another Question5 ?",
        optionA: "optionA",
        optionB: "optionB",
        optionC: "optionC",
        optionD: "optionD"),
    Question(
        question: "Another Question6 ?",
        optionA: "optionA",
        optionB: "optionB",
        optionC: "optionC",
        optionD: "optionD"),
    Question(
        question: "Another Question7 ?",
        optionA: "optionA",
        optionB: "optionB",
        optionC: "optionC",
        optionD: "optionD"),
    Question(
        question: "Another Question8 ?",
        optionA: "optionA",
        optionB: "optionB",
        optionC: "optionC",
        optionD: "optionD"),
    Question(
        question: "Another Question9 ?",
        optionA: "optionA",
        optionB: "optionB",
        optionC: "optionC",
        optionD: "optionD"),
    Question(
        question: "Another Question10 ?",
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

class Ans {
  var answer;
  Ans({required this.answer});
}
