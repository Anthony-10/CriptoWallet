import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/model/all_coins/coins.dart';
import 'package:new_crypto_wallet/core/model/major_coins/major_coins.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';

class MajorCoinsController extends GetxController {
  CoinRepo _coinRepo;

  MajorCoinsController() {
    _coinRepo = Get.find<CoinRepoImpl>();
    print('..............................................');
    loadCoins();
  }

  //final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;

  MajorCoins majorCoins=new MajorCoins();

  Map<String, dynamic> cryptos = {};


  Widget listCryptos(BuildContext context){
    return ListView.builder(
      itemCount: cryptos.keys.length,
        itemBuilder: (context, int index)/*Text("data${cryptos[cryptos.keys.elementAt(index)]["ethereum"]['usd']}")*/
        {
          var key = cryptos.keys.elementAt(index);
          return ListTile(title: Text("$key"),subtitle: Text("USD: ${cryptos[key]['usd']}"),);
        });
  }

  loadCoins() async {
    showLoading();

    final result = await _coinRepo.getMajorCoin();
    hideLoading();
print('nnnnnnnnnnnnnnn${result}');
    if (result != null) {
      cryptos = result;
      print(cryptos.toString()+"00000000222222222222222222555555500000000000000000000");
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