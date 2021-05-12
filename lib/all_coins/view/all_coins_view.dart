import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/all_coins/controller/all_coins_controller.dart';

class AllCoinsView extends StatefulWidget {
  const AllCoinsView({Key key}) : super(key: key);

  @override
  _AllCoinsViewState createState() => _AllCoinsViewState();
}

class _AllCoinsViewState extends State<AllCoinsView> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AllCoinsController>();

    return Scaffold(
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.coins != null) {
            return Container(
              margin: EdgeInsets.all(10),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.coins[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: Text("USD: ${
                              controller.coins[index].currentPrice.toString()}",
                              style: TextStyle(fontSize: 15.0)))
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: controller.coins.length,
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
