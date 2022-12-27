import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';
import 'package:hslr/main.dart';

class CmeListService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      baseUrl: orginalApi.baseUrl, responseType: ResponseType.plain));
  Future<Response> getCmeList() async {
    final mid = await sessionlog.getString('userId');

    final conId = await sessionlog.getInt('country');
    final stateId = await sessionlog.getString('stateId');
    final counciId = await sessionlog.getString('councilId');
    final roleId = await sessionlog.getString('catId');

    try {
      var response = await dio.get('CMEList', queryParameters: {
        'Mid6': mid,
        'CountryId': conId,
        'StateId': stateId,
        'CouncilId': counciId,
        'RoleId': 2
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
