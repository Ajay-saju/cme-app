import 'package:dio/dio.dart';
import 'package:hslr/main.dart';

import '../base_api/orginal_api.dart';

class EducationDetalsServ {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));

  Future<Response> getEduDetails() async {
    final mid = await sessionlog.getString('userId');
    final countryId = await sessionlog.getInt('country');
    final councilId = await sessionlog.getString('councilId');
    final stateId = await sessionlog.getString('stateId');

    try {
      var response = await dio.get('GetEduinfo', queryParameters: {
        "memberId": mid,
        "countryId": countryId,
        "councilId": councilId,
        "stateId": stateId
      });
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
