import 'dart:convert';

import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/model/all_coins/coins.dart';
import 'package:new_crypto_wallet/core/model/major_coins/major_coins.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo.dart';
import 'package:new_crypto_wallet/service/http_service.dart';
import 'package:new_crypto_wallet/service/http_service_impl.dart';

class CoinRepoImpl implements CoinRepo {
  HttpService _httpService;

  CoinRepoImpl() {
    _httpService = Get.put(HttpServiceImpl());
    _httpService.init();
  }

  @override
  Future<List<Coins>> getCoin() async {
    // TODO: implement getCoin a must

    try {
      final response =
          await _httpService.getRequest("/v3/coins/markets?vs_currency=usd");

      final parsedResponse =
          (response.data as List).map((x) => Coins.fromJson(x));

      return parsedResponse.toList();
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Coins>> getSearchCoin(String query) async {
    // TODO: implement getSearchCoin
    try {
      final response = await _httpService
          .getRequest("/v3/simple/price?ids=$query&vs_currencies=usd");

      final parsedResponse =
      (response.data as List).map((x) => Coins.fromJson(x));

      return parsedResponse.toList();
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future <Map<String, dynamic>>  getMajorCoin() async {
    // TODO: implement getMajorCoin
    try {

      print("prcess stars here");

      final response = await _httpService
          .getRequest("/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd");
      print("Mapping data to the model class");
      /*final parsedResponse = MajorCoins.fromJson(response.data);*/

      //Map<String, dynamic> map = json.decode(response.data.toString());
      //List<dynamic> data = map as List;
      //print("About to print the List of data${data.length}");
      final parsedResponse = MajorCoins.fromJson(response.data as Map) ;


      print('hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${parsedResponse.toJson()}');

      return parsedResponse.toJson();
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

}

