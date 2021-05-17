import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';

class MajorCoinsController extends GetxController {
  CoinRepo _coinRepo;

  MajorCoinsController() {
    _coinRepo = Get.find<CoinRepoImpl>();
    print('..............................................');
    loadCoins();
  }

  RxBool isLoading = false.obs;

  Map<String, dynamic> major_cryptos = {};

  Widget listCryptos(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, int index) {
          var key = major_cryptos.keys.elementAt(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$key".capitalizeFirst,
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text("USD: ${major_cryptos[key]['usd']}",
                      style: TextStyle(fontSize: 15.0))),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: major_cryptos.keys.length,
      ),
    );
  }

  loadCoins() async {
    showLoading();

    final result = await _coinRepo.getMajorCoin();
    hideLoading();
    if (result != null) {
      major_cryptos = result;
    } else {
      debugPrint("No data received");
    }
  }

  showLoading() {
    isLoading.toggle();
  }

  hideLoading() {
    isLoading.toggle();
  }
}
