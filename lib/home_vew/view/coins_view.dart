import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/home_vew/controller/coins_controller.dart';

class CoinsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Coins'),
      ),
      body: Obx(() {
        return controller.isLoading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                margin: EdgeInsets.all(10),
                child: ListView.separated(
                    itemBuilder: (context, index){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.coins[index].name),
                          Text(controller.coins[index].currentPrice.toString())
                        ],
                      );
                    },
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: controller.coins.length),
              );
      }),
    );
  }
}
