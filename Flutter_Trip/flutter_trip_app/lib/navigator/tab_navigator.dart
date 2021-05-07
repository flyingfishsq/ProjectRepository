import 'package:flutter/material.dart';
import 'package:flutter_trip_app/pages/home_page.dart';
import 'package:flutter_trip_app/pages/my_page.dart';
import 'package:flutter_trip_app/pages/search_page.dart';
import 'package:flutter_trip_app/pages/travel_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabNavigatorState();
}

//在dart中定义一个内部类，只需要在类名前加下划线，State里的泛型就是这个有状态的组件
class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  final _currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [HomePage(), SearchPage(), TravelPage(), MyPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //BottomNavigationBarItem可以分别设置未选中和选中两种状态下的背景图片
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: _activeColor,
              ),
              title: Text(
                '首页',
                style: TextStyle(
                    color: _currentIndex == 0 ? _activeColor : _defaultColor),
              )),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.search,
              color: _activeColor,
            ),
            title: Text(
              '搜索',
              style: TextStyle(
                  color: _currentIndex == 1 ? _activeColor : _defaultColor),
            ),
          )
        ],
      ),
    );
  }
}
