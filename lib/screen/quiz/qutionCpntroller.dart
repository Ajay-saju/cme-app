import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/test_screen/testscreen.dart';
import '../online_cmeprog/online_cmeprogram.dart';

class QuestionController extends GetxController {
  var isStopTimer = true.obs;
  Timer? timer;
  int remainingSeconds = 1;
  final time = '00.00'.obs;
  final minutes = 1.obs;
  final timerColors = Colors.black.obs;

  @override
  void onReady() {
    _startTimer(600);
    super.onReady();
  }

  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
      // completeTest();
    }
    super.onClose();
  }

  void _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, ( timer) {
      if (remainingSeconds == 0) {
        completeTest(false);
        timer.cancel();
      } else {
        minutes.value = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = minutes.toString().padLeft(2, '0') +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });
  }

  Color timerColorsChange() {
    List<Color> colors = <Color>[Colors.red, Colors.green, Colors.amber];
    if (minutes.value < 11 && minutes.value > 7 || minutes.value == 00) {
      timerColors.value = colors[1];
    } else if (minutes.value < 6 && minutes.value > 3) {
      timerColors.value = colors[2];
    } else if (minutes.value < 3 && minutes.value > 0) {
      timerColors.value = colors[0];
    }
    return timerColors.value;
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

  completeTest(bool isGoingtoTest) {
    Get.defaultDialog(
      barrierDismissible: false,
      cancel: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            )),
        onPressed: () {
          Get.back();
        },
        child: Text(
          'Cancel',
          style: TextStyle(
            fontFamily: "Nunito",
          ),
        ),
      ),
      confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              )),
          onPressed: () {
            isGoingtoTest == true
                ? Get.offAll(TestScreen())
                : Get.offAll(Onlinecmeprogram());
          },
          child: Text(
            'OK',
            style: TextStyle(
              fontFamily: "Nunito",
            ),
          )),
      title: 'Complete',
      titleStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Nunito",
      ),
      middleText: 'Test Completed Successfully',
      middleTextStyle: TextStyle(
        fontFamily: "Nunito",
      ),
    );
  }

  // void startTimer() {
  //   countdownTimerMin = Timer.periodic(Duration(minutes: 1), (_) {
  //     startSecTimer();
  //     if (min > 0 && isStopTimer == true) {

  //       min--;
  //       print(min);
  //     } else {
  //       isStopTimer.value = false;
  //     }
  //   });
  // }

  // startSecTimer() {
  //   countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
  //     if (seconds > 0 && min > 0) {
  //       seconds--;

  //       print(seconds);
  //     }
  //     if(seconds == 0 ){

  //       min --;

  //     }
  //      else {
  //       isStopTimer.value = false;
  //     }
  //   });
  // }
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
