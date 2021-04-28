import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/model/coins.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo.dart';
import 'package:new_crypto_wallet/service/http_service.dart';
import 'package:new_crypto_wallet/service/http_service_impl.dart';

class CoinRepoImpl implements CoinRepo{

  HttpService _httpService;

    CoinRepoImpl(){
      _httpService = Get.put(HttpServiceImpl());
      _httpService.init();
    }

  @override
  Future<List<Coins>> getCoin() async {
    // TODO: implement getCoin
    try {
      final response = await _httpService.getRequest("/v3/coins/markets?vs_currency=usd");

      return response.data;


    } on Exception catch (e) {
      print(e);
      return null;
    }
  }

  @override
  Future<List<Coins>> getSearchCoin(String query) {
    // TODO: implement getSearchCoin
    throw UnimplementedError();
  }

}