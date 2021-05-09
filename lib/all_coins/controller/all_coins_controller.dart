import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/model/all_coins/coins.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';

class AllCoinsController extends GetxController {
  CoinRepo _coinRepo;

  AllCoinsController() {
    _coinRepo = Get.find<CoinRepoImpl>();
    print('..............................................');
    loadCoins();
    // searchTextController.addListener(() {
    //   print("rrrrrrrrrrrrr");
    //   if (searchTextController.text.length == 0) {
    //     loadCoins();
    //   } else {
    //     searchCoins();
    //   }
    // });
  }

  //final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;

  RxList<Coins> coins;

  loadCoins() async {
    showLoading();

    final result = await _coinRepo.getCoin();
    print("weeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    hideLoading();

    if (result != null) {
      coins = result.obs;
    } else {
      debugPrint("No data received");
    }
  }

  // searchCoins() async {
  //   showLoading();
  //
  //   final result = await _coinRepo.getSearchCoin(searchTextController.text);
  //
  //   hideLoading();
  //
  //   if (result != null) {
  //     coins = result.obs;
  //   } else {
  //     debugPrint("No data received");
  //   }
  // }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}