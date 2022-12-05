import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class QuestionController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    startTimer();
    for (var i = 0; i < 1; i++) {
      // startSecTimer();
    }
    
  }

  @override
  void dispose() {
    isStopTimer.value = false;
  }

  var tabIndex = 0;
  // final prefs =  SharedPreferences.getInstance();
  PageController pageController = PageController(initialPage: 0);
  int pageChange = 0;
  bool optionA = false;
  bool optionB = false;
  bool optionC = false;
  bool optionD = false;
  String selectedOption = '';
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
  static const maxSec = 20;
  static const minMin = 10;
  RxInt min = minMin.obs;
  RxInt seconds = maxSec.obs;
  var isStopTimer = true.obs;
  Timer? countdownTimer;
  Timer? countdownTimerMin;


  void startTimer() {
    countdownTimerMin = Timer.periodic(Duration(minutes: 10), (_) {
      if (min > 0 && isStopTimer == true) {
        min--;
        // startSecTimer();
        print(min);
      } else {
        isStopTimer.value = false;
      }
    });
  }

  startSecTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0 && isStopTimer == true) {
        seconds--;

        print(seconds);
      } else {
        isStopTimer.value = false;
      }
    });
  }
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
