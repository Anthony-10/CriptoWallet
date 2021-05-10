import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/model/all_coins/coins.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';

class SearchController extends GetxController{
  CoinRepo _coinRepo;

  SearchController() {
    _coinRepo = Get.find<CoinRepoImpl>();
    print('..............................................');
    //loadCoins();
    searchTextController.addListener(() {
      print("rrrrrrrrrrrrr");
      if (searchTextController.text.length == 0) {
        loadCoins();
      } else {
        searchCoins();
      }
    });
  }

  final searchTextController = TextEditingController();

  RxBool isLoading = false.obs;

  RxList<Coins> coins;

  Map<String, dynamic> search_cryptos = {};

  Widget listCryptosSearch(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, int index) {
          var key = search_cryptos.keys.elementAt(index);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$key".capitalizeFirst,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0)),
              Align(
                  alignment: Alignment.centerRight,
                  child: Text("USD: ${search_cryptos[key]['usd']}",
                      style: TextStyle(fontSize: 15.0))),
            ],
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: search_cryptos.keys.length,
      ),
    );
  }

  loadCoins() async {
    showLoading();

    final result = await _coinRepo.getCoin();
    hideLoading();

    if (result != null) {
      search_cryptos = result as Map<String, dynamic>;
    } else {
      debugPrint("No data received");
    }
  }

  searchCoins() async {
    showLoading();

    final result = await _coinRepo.getSearchCoin(searchTextController.text);

    hideLoading();

    if (result != null) {
      search_cryptos = result;
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