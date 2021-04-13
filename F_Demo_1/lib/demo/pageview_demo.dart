import 'package:flutter/material.dart';

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      //pageSnapping为true表示页面会在滑动超过一半的时候自动吸附，为false表示页面会在任意位置停留
      // pageSnapping: false,
      pageSnapping: true,
      //把children的顺序倒置
      // reverse: true,
      //可以设置pageview的滚动方向，即设置为水平方向的pageview或垂直方向的pageview
      scrollDirection: Axis.vertical,
      onPageChanged: (currentPage) => debugPrint('Page:$currentPage'),

      //控制PageView上的页面
      controller: PageController(
          //initialPage表示切换到这个PageView的时候，首次显示是第几个页面
          initialPage: 1,
          //keepPage默认为true表示会记住用户上次滚动到的是哪个页面
          keepPage: false,
          //页面占用可视界面的比例，默认是1
          viewportFraction: 0.85),

      children: [
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'One',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'Two',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'Three',
            style: TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
