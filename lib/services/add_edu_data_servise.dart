import 'package:dio/dio.dart';

import '../base_api/orginal_api.dart';
import '../main.dart';

class AddEduDataServise {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));

  Future<Response> postNewEduData(
      {required String universityId,
      required String collageCode,
      required String courseId
      // required Map<String, dynamic> data
      }) async {
    try {
      var response = await dio.post('SaveAddNewEduinfoNew',
          data: FormData.fromMap(
            {
            "countryId": sessionlog.getInt('country').toString(),
            "stateId": sessionlog.getString('stateId').toString(),
            "councilId": sessionlog.getString('councilId').toString(),
            "memberid": sessionlog.getString('userId'),
            "courseCode": courseId,
            "universitycode": universityId,
            "collegecode": collageCode,
            "createdby": sessionlog.getString('log_name'),
            "updatedby": sessionlog.getString('log_name'),
          }
          ));
      return response;
    } on DioError catch (e) {
      print(e.message);
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
