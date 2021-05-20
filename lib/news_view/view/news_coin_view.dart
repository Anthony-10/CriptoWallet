import 'package:flutter/material.dart';

class NewsCoinView extends StatefulWidget {
  const NewsCoinView({Key key}) : super(key: key);

  @override
  _NewsCoinViewState createState() => _NewsCoinViewState();
}

class _NewsCoinViewState extends State<NewsCoinView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Center(child: Text('Will Be Updated Soon', style: TextStyle(fontSize: 25.0),)));
  }
}
