import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
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
              //padding: EdgeInsets.only(top: 20, ),
              //padding: EdgeInsets.all(20),
              child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 10, right: 20, left: 20, bottom: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            allCoinsController.coins[index].name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),
                          ),
                          Obx(
                            () => Text(
                                "USD: ${allCoinsController.coins[index].currentPrice.toString()}",
                                style: TextStyle(fontSize: 15.0)),
                          )
                        ],
                      ),
                    ),
                    secondaryActions: [
                      IconSlideAction(
                        caption: 'Favorite',
                        color: Colors.amberAccent,
                        icon: Icons.favorite,
                        onTap: () {
                          addCoinsController.addCoins(
                              allCoinsController.coins[index].name,
                              allCoinsController.coins[index].currentPrice);
                        },
                      )
                    ],
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
