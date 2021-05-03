import 'package:flutter/material.dart';


class FavoriteCoinsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Center(child: Text("Favorite", style: TextStyle(color: Colors.black)))
      ),
      body: Container(),
    );
  }
}
