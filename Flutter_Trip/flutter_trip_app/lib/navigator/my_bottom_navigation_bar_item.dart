import 'package:flutter/material.dart';

//自己尝试封装，不太会
class MyBottomNavigationBarItem extends StatefulWidget {
  final IconData iconN;
  final IconData iconP;
  final Color colorN;
  final Color colorP;
  final String titleText;
  final int index;

  int currentIndex;

  MyBottomNavigationBarItem(
      @required this.iconN,
      @required this.iconP,
      @required this.colorN,
      @required this.colorP,
      @required this.titleText,
      @required this.index) {
    BottomNavigationBarItem(
        icon: Icon(
          iconN,
          color: colorN,
        ),
        activeIcon: Icon(
          iconP,
          color: colorP,
        ),
        title: Text(
          titleText,
          style: TextStyle(color: currentIndex == index ? colorN : colorP),
        ));
  }

  @override
  State<StatefulWidget> createState() {
    return _MyBottomNavigationBarItemState();
  }
}

class _MyBottomNavigationBarItemState extends State<MyBottomNavigationBarItem>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
