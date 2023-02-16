import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';

class CollageListServise {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));
  Future<Response> getCollageList(String universityId) async {
    try {
      var response = await dio.post('getcollege',
          data: FormData.fromMap({'university_Code': universityId}));
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) { 
      rethrow;
    }
  }
}
