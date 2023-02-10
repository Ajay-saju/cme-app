import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hslr/base_api/orginal_api.dart';

class GetUserDetailsService {
  static OrginalApi orginalApi = OrginalApi();

  final dio = Dio(BaseOptions(
      connectTimeout: 58000000,
      receiveTimeout: 6000,
      baseUrl: orginalApi.baseUrl,
      responseType: ResponseType.plain));

  Future<Response> getUserProfile(String mid) async {
    try {
      print('working...............');
      Response response = await dio.get('getpersonaldetails', queryParameters: {
        "memberid": mid,
        'countryId': 1,
        'stateId': 2,
        'councilId': 2
      });
      print(response.toString());
      return response;
    } on DioError catch (e) {
      print(e.message);
      Get.defaultDialog(
          title: 'Something is wrong',
          middleText: "Please try again",
          middleTextStyle: TextStyle(
            fontFamily: "Nunito",
            color: Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          titleStyle: TextStyle(
            fontFamily: "Nunito",
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ));
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
