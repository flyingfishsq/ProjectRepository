import 'package:flutter/material.dart';

// ignore: camel_case_types
class BottomNavigationBar_Demo extends StatefulWidget {
  BottomNavigationBar_Demo({Key? key}) : super(key: key);

  @override
  _BottomNavigationBar_DemoState createState() =>
      _BottomNavigationBar_DemoState();
}

// ignore: camel_case_types
class _BottomNavigationBar_DemoState extends State<BottomNavigationBar_Demo> {
  int _currentIndex = 0;

  void _onTapHandler(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //默认选中的第一个item
      currentIndex: _currentIndex,
      onTap: _onTapHandler,
      //当items的数目大于四，图标会变成全白色，因为此时底部导航栏的类型改变了，需要添加一个type属性
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      unselectedItemColor: Colors.black45,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: "History"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "List"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "My"),
      ],
    );
  }
}
