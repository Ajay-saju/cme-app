import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hslr/screen/test_screen/razor_credentials.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';

class TestScreenController extends GetxController {
  bool isLoading = true;
  bool isClicked = true;
  bool dropOne = false;
  bool dropTwo = false;

  String? dropvalue;
  String? speciality;

  final dropOneItems = [
    'PG NEET',
    'PG CET',
    'test1',
    'test2',
    'test3',
    'test4',
    'test5',
    'test6',
  ];
  final dropTwoItmes = ['dummy', 'dummy'];

  String keyId = "rzp_test_9rG7ClR4bO47u9";
  String keySecret = "3wQnashnGoeS56aVWfpSYOZ7";

  final _razorpay = Razorpay();
  // final dio = Dio(BaseOptions(
  //     baseUrl: 'https://api.razorpay.com/v1/',
  //     responseType: ResponseType.plain));
  @override
  void onInit() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);

    super.onInit();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(response);
    // verifySignature(
    //   signature: response.signature,
    //   paymentId: response.paymentId,
    //   orderId: response.orderId,
    // );
  }

  void _handlePaymentError(PaymentSuccessResponse response) {
    print(response);
    Get.defaultDialog(title: 'Error');
    Get.snackbar('Error', response.toString());
  }

  void _handleExternalWallet(PaymentSuccessResponse response) {
    print(response);
  }

  void createOrder() async {
    isLoading = true;
    String username = keyId;
    String password = keySecret;
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$username:$password'))}';

    Map<String, dynamic> body = {
      "amount": 2000 * 100,
      "currency": "INR",
      "receipt": "rcptid_11"
    };

    var res = await http.post(
      Uri.https("api.razorpay.com", "v1/orders"),
      headers: <String, String>{
        "Content-Type": "application/json",
        'authorization': basicAuth,
      },
      body: jsonEncode(body),
    );
    if (res.statusCode == 200) {
      openGateway(jsonDecode(res.body)['id']);
      isLoading = false;
    }

    print(res.body);

    // try {
    //   var response = await dio.post(
    //     'orders',
    //     data: jsonEncode(body),
    //     queryParameters: <String, String>{
    //       "Content-Type": "application/json",
    //       'authorization': basicAuth,
    //     },
    //   );
    // } catch (e) {

    // }

    //   var res = await dio.post(
    //     'orders',
    //     data: jsonEncode(body),
    //     queryParameters: <String, String>{
    //       "Content-Type": "application/json",
    //       'authorization': basicAuth,
    //     },
    //   );
    //   if (res.statusCode == 200) {
    //     openGateway(jsonDecode(res.data)['id']);
    //   }
    //   print(res.data);
  }

  void checkOut() {}

  void openGateway(String orderId) {
    print('working payment gateway');
    var options = {
      'key': keyId,
      'amount': 2000 * 100, //in the smallest currency sub-unit.
      'name': 'CME',
      'order_id': orderId, // Generate order_id using Orders API
      'description': 'Course Fee',
      // 'timeout': 60*8, // in seconds
      'prefill': {'contact': '9123456789', 'email': 'gaurav.kumar@example.com'}
    };
    _razorpay.open(options);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
            fontFamily: "Nunito",
          ),
        ),
      );
}
