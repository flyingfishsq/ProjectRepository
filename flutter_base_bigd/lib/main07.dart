import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Wrap可以实现流布局，单行（列）的Wrap跟Column（Row）的表现几乎一致，
// 但Column和Row是单行单列的，Wrap则突破了这个限制，mainAxis上空间不足时，则向crossAxis上去扩展显示
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
          title: Text('Wrap组件'),
        ),
        body: HomeContent1(),
      ),
    );
  }
}

class HomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 500,
      color: Colors.lightGreenAccent,
      child: Padding(
        padding: EdgeInsets.all(4),
        //可以根据父控件宽高自动调整
        child: Wrap(
          //主轴参数
          direction: Axis.horizontal,
          //主轴对齐方式
          alignment: WrapAlignment.spaceEvenly,
          //副轴对齐方式
          runAlignment: WrapAlignment.center,
          //主轴间距
          spacing: 8,
          //副轴间距
          runSpacing: 12,
          children: [
            MyButton('漠北追击'),
            MyButton('追虎擒龙'),
            MyButton('银色溜冰鞋'),
            MyButton('祝你好运2020'),
            MyButton('美国叛徒：轴心莎莉的审判'),
            MyButton('新鲜博物馆之进击的大秦'),
            MyButton('沃尔夫冈'),
            MyButton('办公室之主'),
            MyButton('抵抗行动'),
            MyButton('秘密访客'),
          ],
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String str;

  MyButton(this.str, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        textColor: Theme.of(context).accentColor,
        child: Text(str),
        onPressed: () {});
  }
}
