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
  int _currentIndex = 0;

  final PageController _controller = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          HomePage(),
          SearchPage(
            hideLeft: true,
          ),
          TravelPage(),
          MyPage()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            //改变成员变量的值，放在setState中
            _currentIndex = index;
          });
        },
        //非常重要的设置，保证按钮的图片不会因选中或未选中而发生大小的改变，以及底部文字的显示与隐藏
        type: BottomNavigationBarType.fixed,
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
              Icons.search_rounded,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.search_rounded,
              color: _activeColor,
            ),
            title: Text(
              '搜索',
              style: TextStyle(
                  color: _currentIndex == 1 ? _activeColor : _defaultColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.photo_camera,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.photo_camera,
              color: _activeColor,
            ),
            title: Text(
              '旅拍',
              style: TextStyle(
                  color: _currentIndex == 2 ? _activeColor : _defaultColor),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: _defaultColor,
            ),
            activeIcon: Icon(
              Icons.account_circle,
              color: _activeColor,
            ),
            title: Text(
              '我的',
              style: TextStyle(
                  color: _currentIndex == 3 ? _activeColor : _defaultColor),
            ),
          ),
        ],
      ),
    );
  }
}
