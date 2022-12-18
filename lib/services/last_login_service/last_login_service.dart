import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';

class UserLastLoginService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));

  Future<Response> getUserLastLoginData(mid2) async {
    try {
      print(orginalApi.baseUrl + 'getLastlogin/$mid2');

      Response response =
          await dio.get('getLastlogin', queryParameters: {'Mid2': mid2});
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    }
  }
}
