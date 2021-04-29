import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/model/coins.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';

class CoinController extends GetxController {
  CoinRepo _coinRepo;

  CoinController() {
    _coinRepo = Get.find<CoinRepoImpl>();
    loadCoins();
  }

  RxBool isLoading = false.obs;

  RxList<Coins> coins;

  loadCoins() async {
    showLoading();

    final result = await _coinRepo.getCoin();
   // print("kkkkkkkkkkkkkkkkkkkkkkkkkkk$result");

    hideLoading();

    if (result!= null) {
      coins = result.obs;
    } else {
      debugPrint("No data recieved");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
