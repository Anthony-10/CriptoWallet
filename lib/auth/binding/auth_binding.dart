import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
  }
}
