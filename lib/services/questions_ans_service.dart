import 'package:dio/dio.dart';
import 'package:hslr/base_api/orginal_api.dart';
import 'package:hslr/main.dart';

class QuestionAnsService {
  static OrginalApi orginalApi = OrginalApi();
  final dio = Dio(BaseOptions(
      connectTimeout: 58000000,
      receiveTimeout: 6000000,
      baseUrl: orginalApi.baseUrl,
      responseType: ResponseType.json));
  Future<Response> getMCQData(String videoId) async {
    try {
      print(videoId.toString());
      Response response = await dio.get('GetQuestionAll', queryParameters: {
        "CountryId": sessionlog.getInt('country'),
        "StateId": sessionlog.getString('stateId'),
        "CouncilId": sessionlog.getString('councilId'),
        "VideoId": videoId,
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
