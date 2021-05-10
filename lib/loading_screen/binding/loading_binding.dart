import 'package:get/get.dart';
import 'package:new_crypto_wallet/loading_screen/controller/loading_comntroller.dart';

class LoadingBoding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(LoadingController());
  }

}