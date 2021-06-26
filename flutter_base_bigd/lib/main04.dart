//Padding，Column，Row，Expanded组件

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_base_bigd/res/listData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Padding,Column,Row,Expanded组件'),
        ),
        body: HomeContent4(),
      ),
    );
  }
}

class HomeContent1 extends StatelessWidget {
  List<Widget> _getWidget() {
    return listData.map((e) {
      return Padding(
        padding: EdgeInsets.all(8),
        child: Image.network(
          e['imageUrl'],
          fit: BoxFit.fitHeight,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(8),
      crossAxisCount: 2,
      children: _getWidget(),
    );
  }
}

class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return IconContainer(
//      Icons.access_alarm,
//      width: 80,
//      height: 80,
//      bgColor: Colors.blue,
//      iconColor: Colors.white,
//      iconSize: 24,
//    );

//    return Container(
//      width: 350,
//      height: 200,
//      color: Colors.pink,
//      child: Row(
//        //在水平方向上的布局方式
////      mainAxisAlignment: MainAxisAlignment.spaceAround,
//        //均匀分配空白区域
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        //设置在次轴上的布局方式，相对于外层组件
//        crossAxisAlignment: CrossAxisAlignment.end,
//        children: [
//          IconContainer(
//            Icons.access_alarm,
//            width: 80,
//            height: 80,
//            bgColor: Colors.red,
//            iconColor: Colors.white,
//            iconSize: 24,
//          ),
//          IconContainer(
//            Icons.search,
//            width: 80,
//            height: 80,
//            bgColor: Colors.yellow,
//            iconColor: Colors.white,
//            iconSize: 24,
//          ),
//          IconContainer(
//            Icons.access_alarm,
//            width: 80,
//            height: 80,
//            bgColor: Colors.blue,
//            iconColor: Colors.white,
//            iconSize: 24,
//          ),
//        ],
//      ),
//    );

    return Container(
      width: 200,
      height: 350,
      color: Colors.pink,
      child: Column(
        //在水平方向上的布局方式
//      mainAxisAlignment: MainAxisAlignment.spaceAround,
        //均匀分配空白区域
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //设置在次轴上的布局方式，相对于外层组件
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconContainer(
            Icons.access_alarm,
            width: 80,
            height: 80,
            bgColor: Colors.red,
            iconColor: Colors.white,
            iconSize: 24,
          ),
          IconContainer(
            Icons.search,
            width: 80,
            height: 80,
            bgColor: Colors.yellow,
            iconColor: Colors.white,
            iconSize: 24,
          ),
          IconContainer(
            Icons.access_alarm,
            width: 80,
            height: 80,
            bgColor: Colors.blue,
            iconColor: Colors.white,
            iconSize: 24,
          ),
        ],
      ),
    );
  }
}

class HomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Expanded的flex表示把固定长度从总长上减去后的长度，它占几份
        Expanded(
          flex: 1,
          child: IconContainer(
            Icons.access_alarm,
            width: 80,
            height: 80,
            bgColor: Colors.red,
            iconColor: Colors.white,
            iconSize: 24,
          ),
        ),
        Expanded(
          flex: 3,
          child: IconContainer(
            Icons.search,
            width: 80,
            height: 80,
            bgColor: Colors.yellow,
            iconColor: Colors.white,
            iconSize: 24,
          ),
        ),
        IconContainer(
          Icons.access_alarm,
          width: 80,
          height: 80,
          bgColor: Colors.blue,
          iconColor: Colors.white,
          iconSize: 24,
        ),
      ],
    );
  }
}

class HomeContent4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(14),
          margin: EdgeInsets.all(4),
          width: MediaQuery.of(context).size.width,
          height: 100,
          color: Colors.green,
          child: Text(
            '你好，Flutter',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(4),
                  child: IconContainer(Icons.ac_unit,height: 160,bgColor: Colors.amberAccent,),
                ),
              ),
              Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: IconContainer(
                        Icons.search,
                        width: 100,
                        height: 80,
                        bgColor: Colors.black38,
                        iconSize: 25,
                      ),
                    ),
                    flex: 1,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: IconContainer(
                        Icons.alarm,
                        width: 100,
                        height: 80,
                        bgColor: Colors.deepOrangeAccent,
                        iconSize: 25,
                      ),
                    ),
                    flex: 1,
                  ),
                ],
              ),
            ],
          ),
          height: 160,
        ),
      ],
    );
  }
}

//自定义组件
class IconContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color bgColor;
  final IconData icon;
  final Color iconColor;
  final double iconSize;

  IconContainer(
    this.icon, {
    this.width = 100,
    this.height = 100,
    this.bgColor = Colors.red,
    this.iconColor = Colors.white,
    this.iconSize = 50,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.height,
      width: this.width,
      color: this.bgColor,
      child: Center(
        child: Icon(
          this.icon,
          color: this.iconColor,
          size: this.iconSize == null ? this.width / 2 : this.iconSize,
        ),
      ),
    );
  }
}
