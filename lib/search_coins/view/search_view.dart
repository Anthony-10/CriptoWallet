import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/core/repository/coin_repo_impl.dart';
import 'package:new_crypto_wallet/search_coins/controller/search_controller.dart';


class SearchCoinView extends StatefulWidget {
  const SearchCoinView({Key key}) : super(key: key);

  @override
  _SearchCoinViewState createState() => _SearchCoinViewState();
}

class _SearchCoinViewState extends State<SearchCoinView> {
  // final searchcoinscontroller = Get.find<SearchController>();
  // final coinRepoImpl = Get.find<CoinRepoImpl>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text("wewe")
    // return SafeArea(child: Obx(() {
    //   if (searchcoinscontroller.isLoading.isTrue) {
    //     return Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   }
    //   if (searchcoinscontroller.search_cryptos == null) {
    //     return Center(child: Text("Check your internet connection"));
    //   }
    //   return searchcoinscontroller.listCryptosSearch(context);
    // }),
    );
  }
}
