import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';

class UserPickService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));
  Future<Response> getProfilePick(
      {required mid, required contryId, required councilId, required stateId}) async {
    try {
      var response = await dio.get('getphoto', queryParameters: {
        'Mid1': mid,
        'CountryId': contryId,
        'StateId': stateId,
        'CouncilId': councilId
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
