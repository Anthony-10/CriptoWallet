import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:new_crypto_wallet/service/http_service.dart';

const BASE_URL = "https://api.coingecko.com/api/";
//const API_KEY = "";

class HttpServiceImpl implements HttpService {
  Dio _dio;

  @override
  Future<Response> getRequest(String url) async {
    Response response;
    try {
      response = await _dio.get(url);
    } on DioError catch (e) {
      debugPrint(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  initializeInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (
      DioError e,handler,
    ) {
      debugPrint(e.message);
    }, onRequest: (
      request, handler
    ) {
      debugPrint("${request.method} | ${request.path}");
    }, onResponse: (
      response, handler
    ) {
      debugPrint(
          "${response.statusCode} ${response.statusMessage} ${response.data}");
    }));
  }

  @override
  void init() {
    _dio = Dio(BaseOptions(
      baseUrl: BASE_URL,
    ));
    initializeInterceptors();
  }
}
