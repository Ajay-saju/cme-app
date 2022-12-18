import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';

class UserLogIdService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));

  Future<Response> getUserUid(String no, String pin) async {
    try {
      Response response = await dio
          .get('User_Log', queryParameters: {'Uid': no, 'password': pin});
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
