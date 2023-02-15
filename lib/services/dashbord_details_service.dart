import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';
import 'package:hslr/main.dart';

class DashbordService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));
  Future<Response> getDashboardData() async {
    final userId = await sessionlog.getString('userId');
    final catId = await sessionlog.getString('catId');
    try {
      var response = await dio.get('User_Dashboard_details',
          queryParameters: {'Mid': userId, 'CategoryId': catId});
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
