import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';
import 'package:new_crypto_wallet/majors_coins/controller/major_coins_controller.dart';

class MajorCoinView extends StatefulWidget {
  const MajorCoinView({Key key}) : super(key: key);

  @override
  _MajorCoinViewState createState() => _MajorCoinViewState();
}

class _MajorCoinViewState extends State<MajorCoinView> {
  final majorcoinscontroller = Get.find<MajorCoinsController>();
  final coinRepoImpl = Get.find<CoinRepoImpl>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        if (majorcoinscontroller.isLoading.isTrue) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (majorcoinscontroller.major_cryptos == null) {
          return Center(child: Text("Check your internet connection"));
        }
        return majorcoinscontroller.listCryptos(context);
      }),
    );
  }
}
