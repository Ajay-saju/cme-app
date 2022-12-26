import 'package:dio/dio.dart';

import '../base_api/orginal_api.dart';

class GetPaymentService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));

  Future<Response> getPaymentDetails(mid) {
    try {
      var response = dio.get('getRecipt', queryParameters: {"Mid3": mid});
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
