import 'package:get/get.dart';
import 'package:new_crypto_wallet/home_add/controller/search_coins.dart';

class SearchCoinBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SearchCoinController());
  }

}