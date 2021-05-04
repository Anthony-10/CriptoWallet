import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/auth/controller/auth_controller.dart';
import 'package:new_crypto_wallet/home_vew/controller/coins_controller.dart';

class CoinsView extends StatefulWidget {
  @override
  _CoinsViewState createState() => _CoinsViewState();
}

class _CoinsViewState extends State<CoinsView> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CoinController>();

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
                decoration: InputDecoration(
                    icon: Icon(Icons.search), hintText: "Search"),
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
      body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Colors.blue,
                elevation: 10,
                margin: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.circle, size: 70),
                      title: Text('Crypto', style: TextStyle(color: Colors.white)),
                      subtitle: Text('Currency', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
            ),
          Flexible(
            child: Obx(() {
            if (controller.isLoading.isTrue) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (controller.coins != null) {
              return Container(
                margin: EdgeInsets.all(10),
                child: ListView.separated(
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          controller.coins[index].image,
                          width: 40.0,
                        ),
                        Text(
                          controller.coins[index].name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.0),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                                controller.coins[index].currentPrice.toString(),
                                style: TextStyle(fontSize: 20.0)))
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
    ]
      ),
    );
  }
}
