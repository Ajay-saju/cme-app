import 'dart:async';
import 'dart:convert';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/models/questions_ans_model.dart';
import 'package:hslr/screen/test_screen/testscreen.dart';
import 'package:hslr/services/questions_ans_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../online_cmeprog/online_cmeprogram.dart';

class QuestionController extends GetxController {
  late List<CameraDescription> _cameras;
  late CameraController cameraController;
  final prefs = SharedPreferences.getInstance();
  // final firstCamera = _cameras[1];

  var isStopTimer = true.obs;

  Timer? timer;
  XFile? image;
  int remainingSeconds = 1;
  final time = '00.00'.obs;
  final minutes = 1.obs;
  final timerColors = Colors.black.obs;
  List<String> imageList = [];

  @override
  void onInit() async {
    _startTimer(600);
    startPhotoTimer(600);
    _cameras = await availableCameras();

    super.onInit();

    cameraController = CameraController(_cameras[1], ResolutionPreset.max);
    cameraController.initialize().then((_) {
      // if (!mounted) {
      //   return;
      // }
      // setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
    // takePicture();
  }

  @override
  void dispose() {
    cameraController.dispose();
    timer!.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    if (timer != null) {
      timer!.cancel();
      cameraController.dispose();
    }
    super.onClose();
  }

  takePicture() async {
    if (cameraController.value.isInitialized) {
      try {
        image = await cameraController.takePicture();
      } on CameraException catch (e) {
        print(e);
      }

      // var images = await prefs.setStringList('i', image!.path);

      print(
          'kitttttttttttttttttttttttttttttttttttttttttttttttttttiiiiiiiiiiiiiiiiiii');
      // Get.defaultDialog(content: Image.file(File(image!.path)));

      // imageList.add(image!.path);
      // print(imageList.toList());
    }
  }

  void _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    timer = Timer.periodic(duration, (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
        completeTest(isGoingtoTest: false);
      } else {
        minutes.value = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = minutes.toString().padLeft(2, '0') +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
        // print(seconds);
      }
    });
  }

  void startPhotoTimer(int min) {
    const duration = Duration(minutes: 1);
    remainingSeconds = min;
    timer = Timer.periodic(duration, (timer) {
      if (min == 0) {
        cameraController.dispose();
        cameraController.stopImageStream();
        timer.cancel();
      } else {
        takePicture();
        remainingSeconds--;
        print(remainingSeconds.toString());
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
  var optionA = false.obs;
  var optionB = false.obs;
  var optionC = false.obs;
  var optionD = false.obs;
  var selectedOption = ''.obs;

  Map answers = {};
  Map correctAnswer = {};

  void pagechange() {
    if (pageChange > 0) {
      --pageChange;
      update();
    } else {
      print("not able to decrement");
    }
  }

  cancelTest(bool isGoingtoTest) {
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
          'No',
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
            if (timer != null) {
              timer!.cancel();
            }

            isGoingtoTest == true
                ? Get.offAll(TestScreen())
                : Get.offAll(Onlinecmeprogram());
          },
          child: Text(
            'Yes',
            style: TextStyle(
              fontFamily: "Nunito",
            ),
          )),
      title: 'Alert',
      titleStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Nunito",
      ),
      middleText: 'Do you want to cancel the test ?',
      middleTextStyle: TextStyle(
        fontFamily: "Nunito",
      ),
    );
  }

  completeTest({bool? isGoingtoTest, input, correctAns, selectedOptio}) {
    answers[pageChange + 1] = selectedOptio;
    print(answers);
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
            if (timer != null) timer!.cancel();
            isGoingtoTest == true
                ? Get.offAll(TestScreen())
                : Get.offAll(Onlinecmeprogram());
            testResult(correctAns: correctAns, input: input);
          },
          child: Text(
            'OK',
            style: TextStyle(
              fontFamily: "Nunito",
            ),
          )),
      title: 'Are you sure',
      titleStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: "Nunito",
      ),
      middleText: 'Do you want to submit the test paper',
      middleTextStyle: TextStyle(
        fontFamily: "Nunito",
      ),
    );

    Rx<QuestionsAnsList> mcqData = QuestionsAnsList().obs;
    Future<QuestionsAnsList?> getAllMCQdata(String videoId) async {
      final mcqDataService = QuestionAnsService();
      try {
        final response = await mcqDataService.getMCQData(videoId);
        if (response.statusCode == 200) {
          mcqData.value = QuestionsAnsList.fromJson(jsonDecode(response.data));
        }
      } catch (e) {}
    }
  }

  void testResult({input, correctAns}) {
    var count = 0;
    print(input);
    print(correctAns);
    for (int i = 0; i < correctAns.length; i++) {
      if (input[i] == correctAns[i]) {
        count = count + 1;
      }
    }
    if (count >= 10) {
      Get.snackbar(
        "Test Pass",
        "Well done you are pass your test",
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    } else {
      Get.snackbar(
        "Test Faild",
        "Take your test ones more",
        colorText: Colors.white,
        backgroundColor: Colors.black,
      );
    }
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
