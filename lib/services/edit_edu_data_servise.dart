import 'package:dio/dio.dart';

import '../base_api/orginal_api.dart';

class EditEduData {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));

  Future<Response> editEduDta(var eduData) async {
    try {
      var response = await dio.post('SaveAddUpdateEduinfoNew',
          data: FormData.fromMap(eduData));
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
