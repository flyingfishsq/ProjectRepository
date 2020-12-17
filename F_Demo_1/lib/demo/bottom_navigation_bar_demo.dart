import 'package:flutter/material.dart';

class BottomNavigationBar_Demo extends StatefulWidget {
  BottomNavigationBar_Demo({Key key}) : super(key: key);

  @override
  _BottomNavigationBar_DemoState createState() =>
      _BottomNavigationBar_DemoState();
}

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
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.explore),
            title: Text("Explore")),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.history),
            title: Text("History")),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.list),
            title: Text("List")),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            icon: Icon(Icons.person),
            title: Text("My")),
      ],
    );
  }
}
