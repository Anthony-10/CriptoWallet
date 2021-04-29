import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';
import 'package:new_crypto_wallet/home_vew/controller/coins_controller.dart';

class CoinsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CoinRepoImpl());
    Get.put(CoinController());

  }

}