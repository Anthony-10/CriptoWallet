import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/widget/bottom_nav/bottom_nav_controller.dart';

class BottomNavBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(BottomNavController());
  }
}