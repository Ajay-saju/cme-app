import 'package:dio/dio.dart';
import 'package:hslr/main.dart';

import '../base_api/orginal_api.dart';

class AllCmeVideoService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));
  Future<Response> getAllVideo() async {
    final cat_id = sessionlog.getString('catId');
    try {
      var response = await dio
          .get('GetCmeVideos', queryParameters: {"CategoryId": cat_id});
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
