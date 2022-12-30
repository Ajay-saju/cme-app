import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';

class UserRegistrationServise {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));

  Future<Response> crateNewUser(
    String userName,
    String number,
    String regno,
    String catId,
    String password,
  ) async {
    var formData = FormData.fromMap({
      'LoginName': userName,
      'MobileNumber': number,
      'RegNo': regno,
      'CategoryId': catId,
      'Password': password
    });
    try {
      var response = await dio.post('SaveNewReg', data: formData);
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
