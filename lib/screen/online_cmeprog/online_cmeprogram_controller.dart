import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hslr/models/questions_ans_model.dart';
import 'package:hslr/services/all_cme_video_service.dart';
import 'package:hslr/services/questions_ans_service.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../models/all_cme_video_model.dart';
import '../quiz/question.dart';

class CmeProgramController extends GetxController {
  String keyId = "rzp_test_9rG7ClR4bO47u9";
  String keySecret = "3wQnashnGoeS56aVWfpSYOZ7";
  bool isLoading = true;
  bool isClicked = true;
  final _razorpay = Razorpay();

  @override
  void onInit() {
    super.onInit();
    getAllVideos();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
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
  }

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

  Rx<AllCmeVideos?> allCmeVideos = AllCmeVideos().obs;
  Future getAllVideos() async {
    final allCmeVideoService = AllCmeVideoService();

    try {
      var response = await allCmeVideoService.getAllVideo();
      if (response.statusCode == 200) {
        allCmeVideos.value = AllCmeVideos.fromJson(jsonDecode(response.data));
        print(allCmeVideos.value!.videoList![0].speakerName);
      }
    } catch (e) {}
    update();
  }

  final memName = TextEditingController();
  TextEditingController councilName = TextEditingController();
  TextEditingController membmobile = TextEditingController();
  TextEditingController membstate = TextEditingController();
  TextEditingController membdistr = TextEditingController();
  TextEditingController changepass = TextEditingController();
  TextEditingController regno = TextEditingController();
  TextEditingController regpass = TextEditingController();

  bool isObscure = true;
  bool sizechangepass = false;
  String? speciality;
  String? program;

  var specialitylist = [
    'test1',
    'test2',
    'test3',
    'test4',
    'test5',
    'test6',
  ];

  var programlist = [
    'test1',
    'test2',
    'test3',
    'test4',
    'test5',
    'test6',
  ];

  Rx<QuestionsAnsList?> questions = QuestionsAnsList().obs;
  var que = [];

  Future getAllQuestionsData(videoId) async {
    QuestionAnsService questionAnsService = QuestionAnsService();
    var selectedQus;
    try {
      var response = await questionAnsService.getMCQData(videoId);
      if (response.statusCode == 200) {
        questions.value = QuestionsAnsList.fromJson(response.data);
        selectedQus = selectedQues(quesList: questions.value!.qAList!.toList());
        // if (selectedQus != null) {
        //   Get.to(Question(
        //     correctAnswer: correctAnswer,
        //     quesList: finalQuesAns,
        //     isGoingtoTest: false,
        //   ));
        // }
      }
    } catch (e) {
      print(e.toString());
    }
    update();
  }

  List selectedQues({required List quesList}) {
    List tempp = [];
    final _random = new Random();
    var temp = quesList.shuffle(_random);
    for (int i = 0; i < 15; i++) {
      tempp.add(quesList[i]);
    }
    correctAnswers(quesList: tempp);
    return createQuesData(quesList: tempp);
  }

  Map correctAnswer = {};
  correctAnswers({required List quesList}) {
    for (int i = 0; i < quesList.length; i++) {
      correctAnswer[i + 1] = quesList[i].aNS;
    }
    print(correctAnswer);
  }

  var finalQuesAns;
  createQuesData({required List quesList}) {
    var temp = [];
    for (var i = 0; i < quesList.length; i++) {
      temp.add(quesList[i].qN.split('\r'));
    }

    finalQuesAns = temp;
    Get.to(Question(
      correctAnswer: correctAnswer,
      quesList: finalQuesAns,
      isGoingtoTest: false,
    ));
  }
}
