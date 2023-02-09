import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class BaseController {
  // handleError(error) {
  //   if (error is BadRequestException) {
  //     var message = error.message;
  //     DialogHelper.showErrorDialog(description: message);
  //   } else if (error is FetchDataException) {
  //     var message = error.message;
  //     DialogHelper.showErrorDialog(description: message);
  //   } else if (error is ApiNotRespondingException) {
  //     DialogHelper.showErrorDialog(
  //         description: 'Oops! It took longer to respond.');
  //   }
  // }

  showLoading([String? message]) {
    DialogHelper.showLoading(message);
  }

  hideLoading() {
    DialogHelper.hideLoading();
  }
}

class DialogHelper {
  static void showErrorDialog() {}
  static void showLoading([String? message]) {
    Get.dialog(
        Dialog(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(
                    color: Colors.black87,
                    strokeWidth: 2.5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    message ?? "Loading...",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      color: Colors.black87,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        barrierDismissible: false);
  }

  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
