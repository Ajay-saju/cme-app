import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';

class UserLoginService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      baseUrl: orginalApi.baseUrl,
      responseType: ResponseType.json));
  Future<Response> userLogin(uid, pass) async {
    try {
      Response response = await dio
          .post('User_Log', queryParameters: {"Uid": uid, 'password': pass});
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
