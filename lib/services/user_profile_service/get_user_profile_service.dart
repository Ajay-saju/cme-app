import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';

class GetUserDetailsService {
  static OrginalApi orginalApi = OrginalApi();

  final dio = Dio(BaseOptions(responseType: ResponseType.plain));

  Future<Response> getUserProfile(String mid) async {
    try {
      print('working...............');
      Response response = await dio.get(
          'https://digiapi.smartschoolsystem.co/api/EMEDNew/getpersonaldetails',
          queryParameters: {"Mid": mid});
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}