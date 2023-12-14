import 'package:dio/dio.dart';
import 'package:movies/app/app.logger.dart';

class ApiService {
  final String _baseUrl = "https://api.themoviedb.org/3";
  final logger = getLogger("ApiService");
  Future<Dio> launchDio({bool? isMultiform = false}) async {
    String accessToken =
        "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZTdlMjAwOTg3YWZlN2ExODU4MzUyODZjMWMxZGQyNiIsInN1YiI6IjY1NzllZTRmN2VjZDI4MDEwMWQyZDY0MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3dnMC49NQ4lOzLD_nPSIkQKJV2MfJy7Hr0J2UUmcjOY";
    Dio dio = Dio();
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    dio.options.headers['Content-Type'] =
        isMultiform == true ? 'multipart/form-data' : 'application/json';
    dio.options.headers["accept"] = 'application/json';
    dio.options.headers["Authorization"] = 'Bearer $accessToken';

    dio.options.followRedirects = false;
    dio.options.validateStatus = (status) {
      if (status != null) {
        return status < 500;
      } else {
        return false;
      }
    };
    return dio;
  }

  Future<Response<dynamic>?> get(
      {required String endPoint, Map<String, dynamic>? params}) async {
    params = _addApiKeyToParams(params);
    try {
      Dio dio = await launchDio();
      final response =
          await dio.get('$_baseUrl/$endPoint', queryParameters: params);
      return response;
    } catch (e) {
      logger.e(e);
      return null;
    }
  }

  _addApiKeyToParams(Map<String, dynamic>? params) {
    if (params != null) {
      params['api_key'] = "1e7e200987afe7a185835286c1c1dd26";
    }
    return params;
  }
}
