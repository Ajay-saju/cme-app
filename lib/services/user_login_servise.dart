import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';

class UserLoginService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      connectTimeout: 58000000,
      receiveTimeout: 6000,
      baseUrl: orginalApi.baseUrl,
      responseType: ResponseType.json));
  Future<Response> userLogin(uid, pass, catId) async {
    try {
      Response response = await dio.get('User_Log',
          queryParameters: {"Uid": uid, 'password': pass, 'CategoryId': catId});
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
