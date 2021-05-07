import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/all_coins/controller/all_coins_controller.dart';
import 'package:new_crypto_wallet/all_coins/view/all_coins_view.dart';
import 'package:new_crypto_wallet/core/widget/categories.dart';
import 'package:new_crypto_wallet/favorite_add/view/favorite_coin_view.dart';
import 'package:new_crypto_wallet/home_vew/controller/coins_controller.dart';
import 'package:new_crypto_wallet/majors_coins/controller/major_coins_controller.dart';
import 'package:new_crypto_wallet/majors_coins/view/major_coins_view.dart';

class CoinsView extends StatefulWidget {
  @override
  _CoinsViewState createState() => _CoinsViewState();
}

class _CoinsViewState extends State<CoinsView> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final allcoinscontroller = Get.find<AllCoinsController>();
    final coincontroller = Get.find<CoinController>();
    final majorcoinscontroller = Get.find<MajorCoinsController>();

    int selectedPage=0;
    final PageController controller = PageController(initialPage: selectedPage);

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: !isSearching
            ? Center(
                child: Text(
                'Coins',
                style: TextStyle(color: Colors.black),
              ))
            : TextField(
                //controller: allcoinscontroller.searchTextController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search), hintText: "Search"),
              ),
        actions: <Widget>[
          isSearching
              ? IconButton(
                  icon: Icon(Icons.cancel),
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                    });
                  })
              : IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      isSearching = !isSearching;
                    });
                  }),
        ],
      ),
      body: Column(children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            color: Colors.black,
            elevation: 10,
            margin: EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text('Crypto Wallet',
                      style: TextStyle(color: Colors.white)),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Align(
                    alignment: Alignment(-0.8, 0.1),
                    child: Text(
                      "300.00 KSH",
                      textAlign: TextAlign.left,
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    )),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.account_balance_wallet,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                        Text('Deposit', style: TextStyle(color: Colors.white))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            icon: Icon(Icons.account_balance_wallet_outlined,
                                color: Colors.white),
                            onPressed: () {}),
                        Text('WithDraw', style: TextStyle(color: Colors.white))
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                            icon: Icon(Icons.account_balance_sharp,
                                color: Colors.white),
                            onPressed: () {}),
                        Text(
                          'Transfer',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Categories(function: (){
          print(selectedPage);
        },controller: controller,),
        Expanded(
          child: Container(
            child: PageView(
              physics:new NeverScrollableScrollPhysics(),
              controller: controller,
              children: [
                AllCoinsView(),
                FavoriteCoinsView(),
                MajorCoinView(),
                Text("two"),
                Text("three"),
              ],
            ),
          ),
        )
        // Flexible(
        //   child: controller.,
        // child: Obx(() {
        //   if (controller.isLoading.isTrue) {
        //     return Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   } else if (controller.coins != null) {
        //     return Container(
        //       margin: EdgeInsets.all(10),
        //       child: ListView.separated(
        //         physics: BouncingScrollPhysics(),
        //         itemBuilder: (context, index) {
        //           return Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               Image.network(
        //                 controller.coins[index].image,
        //                 width: 40.0,
        //               ),
        //               Text(
        //                 controller.coins[index].name,
        //                 style: TextStyle(
        //                     fontWeight: FontWeight.bold, fontSize: 15.0),
        //               ),
        //               Align(
        //                   alignment: Alignment.centerRight,
        //                   child: Text(
        //                       controller.coins[index].currentPrice.toString(),
        //                       style: TextStyle(fontSize: 20.0)))
        //             ],
        //           );
        //         },
        //         separatorBuilder: (context, index) => Divider(),
        //         itemCount: controller.coins.length,
        //       ),
        //     );
        //   } else {
        //     return Center(child: Text("Check your internet connection"));
        //   }
        // }),
        //),
      ]),
    );
  }
}
