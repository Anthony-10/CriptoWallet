import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';

class CoreBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(CoinRepoImpl());
  }

}