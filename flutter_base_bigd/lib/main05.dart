import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_bigd/main01.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('层叠组件Stack与Align，Stack与Positioned'),
        ),
        body: HomeContent3(),
      ),
    );
  }
}

//容器中只有一个元素需要定位
class HomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      //栈布局组件
      child: Stack(
        //让所有的内部组件都按照同一锚点定位
        // alignment: Alignment.center,
        //自定义，赋值范围在（-1，1）
        alignment: Alignment(0, 0.2),
        children: [
          Container(
            height: 400,
            width: 300,
            color: Colors.red,
          ),
          Text('我是一个文本'),
        ],
      ),
    );
  }
}

//容器中有多个元素需要定位，Align是定位组件
class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
            Align(
              child: Icon(
                Icons.send,
                size: 60,
                color: Colors.orange,
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
      ),
    );
  }
}

//精确定位，与Alignment的传参效果相同
class HomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 400,
        width: 300,
        color: Colors.red,
        child: Stack(
          children: [
            Positioned(
              left: 10,
              child: Icon(
                Icons.home,
                size: 40,
                color: Colors.white,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 100,
              child: Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
            Positioned(
              child: Icon(
                Icons.send,
                size: 60,
                color: Colors.orange,
              ),
              right: 0,
            ),
          ],
        ),
      ),
    );
  }
}
