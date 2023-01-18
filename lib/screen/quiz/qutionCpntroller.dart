import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/screen/test_screen/testscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../online_cmeprog/online_cmeprogram.dart';

class QuestionController extends GetxController {
  late List<CameraDescription> _cameras;
  late CameraController cameraController;
  final prefs = SharedPreferences.getInstance();
  // final firstCamera = _cameras[1];
  var isSelectedOptionA = 0.obs;
  var isSelectedOptionB = 0.obs;
  var isSelectedOptionC = 0.obs;
  var isSelectedOptionD = 0.obs;

  var isStopTimer = true.obs;
  Timer? timer;
  XFile? image;

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
    super.dispose();
    if (timer != null) {
      timer!.cancel();
      cameraController.dispose();
    }
  }

  @override
  void onClose() {
    super.onClose();
    if (timer != null) {
      timer!.cancel();
      cameraController.dispose();
    }
  }

  changeSelectedOPtion(isSelectedOption) {
    if (isSelectedOption == 0) {
      isSelectedOption.value = 1;
    } else {
      isSelectedOption.value = 0;
    }
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

  int remainingSecond = 1;
  var isCancelTest = false;
  void _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSecond = seconds;
    timer = Timer.periodic(duration, (timer) {
      if (remainingSecond == 0) {
        timer.cancel();
        if (isCancelTest == false) {
          completeTest(isGoingtoTest: false);
        }
      } else {
        minutes.value = remainingSecond ~/ 60;
        int seconds = (remainingSecond % 60);
        time.value = minutes.toString().padLeft(2, '0') +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSecond--;
        // print(seconds);
      }
    });
  }

  void startPhotoTimer(int min) {
    int remainingSeconds = 1;
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

  var tabIndex = 0.obs;
  // final prefs =  SharedPreferences.getInstance();
  PageController pageController = PageController(initialPage: 0);
  int pageChange = 0;
  var optionA = false.obs;
  var optionB = false.obs;
  var optionC = false.obs;
  var optionD = false.obs;
  var selectedOption = ''.obs;
  var isSelected = false.obs;

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
            remainingSecond = 0;
            isCancelTest = true;

            // if (timer != null) {
            //   remainingSecond = 0;
            //   timer!.cancel();
            //   if (timer!.isActive) {
            //     print('timer is active');
            //   }
            //   print(timer!.isActive);
            //   cameraController.dispose();
            // }

            isGoingtoTest == isGoingtoTest
                ? Get.offAll(Onlinecmeprogram())
                : Get.offAll(TestScreen());
          },
          child: Text(
            'Yes',
            style: TextStyle(
              fontFamily: "Nunito",
            ),
          )),
      title: 'Are you sure ?',
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

  completeTest({bool? isGoingtoTest, input, correctAns, selectedOption}) {
    answers[pageChange + 1] = selectedOption;
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
            testResult(
                correctAns: correctAns, input: input, isGOingto: isGoingtoTest);
            timer!.cancel();
            remainingSecond = 0;
            isCancelTest = true;
            // cameraController.stopImageStream();
            // cameraController.dispose();
            // if (timer != null){

            // } timer!.cancel();
            // isGoingtoTest == true
            //     ? Get.offAll(TestScreen())
            //     : Get.offAll(Onlinecmeprogram());
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
  }

  // Rx<QuestionsAnsList> mcqData = QuestionsAnsList().obs;
  //   Future<QuestionsAnsList?> getAllMCQdata(String videoId) async {
  //     final mcqDataService = QuestionAnsService();
  //     try {
  //       final response = await mcqDataService.getMCQData(videoId);
  //       if (response.statusCode == 200) {
  //         mcqData.value = QuestionsAnsList.fromJson(jsonDecode(response.data));
  //       }
  //     } catch (e) {}
  //   }

  void testResult({input, correctAns, isGOingto}) {
    var count = 0;
    print(input);
    print(correctAns);
    if (correctAns == null) {
      return;
    } else {
      for (int i = 0; i < correctAns.length; i++) {
        if (input[i] == correctAns[i]) {
          count = count + 1;
        }
      }
    }

    if (count >= 10) {
      Get.defaultDialog(
        titleStyle: TextStyle(
          fontFamily: "Nunito",
        ),
        middleTextStyle: TextStyle(
          fontFamily: "Nunito",
        ),
        title: 'Congratulations',
        middleText:
            'Test pass Successfully\n you are get credit point 1\n you scored $count marks',
        confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: () {
              // if (timer != null) {
              //   timer!.cancel();
              // }
              isGOingto == true
                  ? Get.offAll(TestScreen())
                  : Get.offAll(Onlinecmeprogram());
            },
            child: Text(
              'OK',
              style: TextStyle(
                fontFamily: "Nunito",
              ),
            )),
      );
    } else {
      Get.defaultDialog(
        title: "Test Faild",
        middleText: "Take your test ones more\n you scored $count marks",

        confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: () {
              if (timer != null) timer!.cancel();
              isGOingto == true
                  ? Get.offAll(TestScreen())
                  : Get.offAll(Onlinecmeprogram());
            },
            child: Text(
              'OK',
              style: TextStyle(
                fontFamily: "Nunito",
              ),
            )),

        // colorText: Colors.white,
        // backgroundColor: Colors.black,
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
