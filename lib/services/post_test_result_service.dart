import 'package:dio/dio.dart';

import '../base_api/orginal_api.dart';

class PostTestResultService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));

  Future<Response> postResult(data) async {
    try {
      Response responce = await dio.post('SaveTest', data: data);
      return responce;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
