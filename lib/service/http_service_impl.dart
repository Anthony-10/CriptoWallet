import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:new_crypto_wallet/service/http_service.dart';

const BASE_URL = "https://api.coingecko.com/api/";
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
      debugPrint(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  // helps to know about the request, error,response

  void initializeInterceptors() {
    _dio.interceptors
        .add(InterceptorsWrapper(onError: (error, errorInterceptorHandler) {
      debugPrint(error.message);
    }, onRequest: (request, requestInterceptorHandler) {
      debugPrint("${request.method} | ${request.path}");
    }, onResponse: (response, responseInterceptorHandler) {
      debugPrint(
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
