import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  final String title;
  final String image;

  const ScreenA({this.title, this.image});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints.expand(),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment(0.0, -0.5),
    child: Text(
      title,
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0, color: Colors.amberAccent),
    ),
    )
    );
  }
}
