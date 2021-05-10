import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';
import 'package:new_crypto_wallet/search_coins/controller/search_controller.dart';

class SearchBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CoinRepoImpl());
    Get.put(SearchController());
  }

}