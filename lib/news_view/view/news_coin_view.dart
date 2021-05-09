import 'package:flutter/material.dart';

class NewsCoinView extends StatefulWidget {
  const NewsCoinView({Key key}) : super(key: key);

  @override
  _NewsCoinViewState createState() => _NewsCoinViewState();
}

class _NewsCoinViewState extends State<NewsCoinView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Text('NewsCoins'));
  }
}
