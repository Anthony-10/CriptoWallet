import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/model/coins.dart';
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
    //List<Coins> coins;

    try {
      final response =
          await _httpService.getRequest("/v3/coins/markets?vs_currency=usd");

      // if (response.statusCode == 200) {
      //   final parsed = json.decode(response.data).cast<Map<String, dynamic>>();
      //   return parsed.map<Coins>((json) => Coins.fromJson(json)).toList();
      // } else {
      //   throw Exception('Failed to find latest allergy alert');
      // }
// print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
// print(response.data);
      final parsedResponse =
          (response.data as List).map((x) => Coins.fromJson(x));
//           .toList();
//       print("wewewwwwww");
//       print(parsedResponse);
//      print(Coins.fromJson(response.data));
//       return (response.data as List)
//           .map((x) => Coins.fromJson(x))
//           .toList();
      // print(response.data[0]["id"]);

      //final parsedResponse = response.data.map((item)=> Coins.fromJson(item)).toList();

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

      return response.data;
    } on Exception catch (e) {
      print(e);
      return null;
    }
  }
}
