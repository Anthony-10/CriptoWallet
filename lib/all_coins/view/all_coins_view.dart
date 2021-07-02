
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/all_coins/controller/add_coins_controller.dart';
import 'package:new_crypto_wallet/all_coins/controller/all_coins_controller.dart';

class AllCoinsView extends StatefulWidget {
  const AllCoinsView({Key key}) : super(key: key);

  @override
  _AllCoinsViewState createState() => _AllCoinsViewState();
}

class _AllCoinsViewState extends State<AllCoinsView> {
 // Timer timer;
  final allCoinsController = Get.find<AllCoinsController>();

/*  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer = Timer.periodic(
        Duration(seconds: 10), (Timer t) => allCoinsController.loadCoins());
  }*/

  @override
  Widget build(BuildContext context) {
    final allCoinsController = Get.find<AllCoinsController>();
    final addCoinsController = Get.find<AddCoinsController>();

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (allCoinsController.isLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (allCoinsController.coins != null) {
            return Container(
              margin: EdgeInsets.all(10),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          allCoinsController.coins[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        Obx(
                          () => Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                  "USD: ${allCoinsController.coins[index].currentPrice.toString()}",
                                  style: TextStyle(fontSize: 15.0))),
                        )
                      ],
                    ),
                    onTap: () {
                      addCoinsController.addCoins(
                          allCoinsController.coins[index].name,
                          allCoinsController.coins[index].currentPrice);
                    },
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: allCoinsController.coins.length,
              ),
            );
          } else {
            return Center(child: Text("Check your internet connection"));
          }
        }),
      ),
    );
  }
}
