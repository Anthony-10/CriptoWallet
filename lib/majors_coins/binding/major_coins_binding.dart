import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';
import 'package:new_crypto_wallet/majors_coins/controller/major_coins_controller.dart';

class MajorCoinsViewBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CoinRepoImpl());
    Get.put(MajorCoinsController());
  }

}