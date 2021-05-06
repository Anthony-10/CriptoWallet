import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  final Function function;
  final PageController controller;
  const Categories({Key key, this.function, this.controller}) : super(key: key);
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selectedIndex = 0;
  final List<String> categories = ["All", "Favorite", "Popular", "meme"];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      //color: Colors.white,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.controller.jumpToPage(index);
                });
                widget.function();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 30.0,
                ),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.transparent,
                      ))),
                      child: Text(
                        categories[index],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
