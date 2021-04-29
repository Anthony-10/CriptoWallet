import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_crypto_wallet/home_add/view/search_coin_view.dart';
import 'package:new_crypto_wallet/home_vew/controller/coins_controller.dart';
import 'package:new_crypto_wallet/home_vew/view/coins_view.dart';

class BottomNav extends StatefulWidget {

  @override
  _BottomNavState createState() => _BottomNavState();
}


class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    CoinsView(),
    CoinsSearchView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final controller = Get.find<CoinController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
