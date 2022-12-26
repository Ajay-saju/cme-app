import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:hslr/main.dart';
import 'package:hslr/models/get_reciepts.dart';
import 'package:hslr/services/user_payment_service.dart';

class PaymentController extends GetxController {
  Rx<GetPayment> getpaymentList = GetPayment().obs;
  Future<GetPayment?> getRecieptList() async {
    final mId = await sessionlog.getString('userId');
    final getPaymentService = GetPaymentService();

    try {
      final response = await getPaymentService.getPaymentDetails(mId);
      log(response.statusCode.toString());
      var jsonFile = jsonDecode(response.data);
      if (response.statusCode == 200) {
        getpaymentList.value = GetPayment.fromJson(jsonFile);
        print(getpaymentList.value.userData1![0].date);
      }
    } catch (e) {}
  }
}
