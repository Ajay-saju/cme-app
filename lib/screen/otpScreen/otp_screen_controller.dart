import 'dart:async';

import 'package:get/get.dart';

class OptScreenController extends GetxController {
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

  static const maxSeconds = 60;
  Timer? countdownTimer;
  String enterdOtp = '';

  RxInt seconds = maxSeconds.obs;
  var isStopTimer = true.obs;
  var isVisible = false.obs;
  var isTimerVisible=true.obs;
  void startTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0 && isStopTimer == true) {
        seconds--;
        isVisible.value = false;
        print(seconds);
      } else {
        isStopTimer.value = false;
        isVisible.value = true;
        isStopTimer.value = false;
      }
    });
    update();
  }

  

  
}
