import 'package:dio/dio.dart';

import '../base_api/orginal_api.dart';

class EduIdListServise {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));
  Future<Response> getAllIdList() async {
    try {
      var response = dio.get(
        'AddEduList',
      );
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
