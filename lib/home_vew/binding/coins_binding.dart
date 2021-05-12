import 'package:get/get.dart';
import 'package:new_crypto_wallet/home_vew/controller/coins_controller.dart';

class CoinsBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(CoinController());
  }

}