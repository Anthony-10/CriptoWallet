import 'package:dio/dio.dart';
import 'package:new_crypto_wallet/service/http_service.dart';

const BASE_URL = "https://api.coingecko.com/api/v3/coins/";
//const API_KEY = "";

class HttpServiceImpl implements HttpService {
  Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    // TODO: implement getRequest
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  // helps to know about the request, error,response

  initializeInterceptors() {
    _dio.interceptors
        .add(InterceptorsWrapper(onError: (error, errorInterceptorHandler) {
      print(error.message);
    }, onRequest: (request, requestInterceptorHandler) {
      print("${request.method} | ${request.path}");
    }, onResponse: (response, responseInterceptorHandler) {
      print(
          "${response.statusCode} ${response.statusMessage} ${response.data}");
    }));
  }

  @override
  void init() {
    // TODO: implement init
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
    ));

    initializeInterceptors();
  }
}
