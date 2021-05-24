import 'package:get/get.dart';
import 'package:new_crypto_wallet/all_coins/controller/add_coins_controller.dart';
import 'package:new_crypto_wallet/all_coins/controller/all_coins_controller.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';

class AllCoinsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CoinRepoImpl());
    Get.put(AddCoinsController());
    Get.put(AllCoinsController());
  }
}
