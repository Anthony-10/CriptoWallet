import 'package:get/get.dart';
import 'package:new_crypto_wallet/favorite_add/controller/favorite_coins.dart';

class FavoriteCoinBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FavoriteCoinController());
  }
}
