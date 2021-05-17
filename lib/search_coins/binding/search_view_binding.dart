import 'package:get/get.dart';
import 'package:new_crypto_wallet/search_coins/controller/search_controller.dart';

class SearchBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(SearchController());
  }

}