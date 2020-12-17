import 'dart:ui';

import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  BasicDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//使用TextSpan的嵌套
    return RichTextDemo();
  }
}

class TextDemo extends StatelessWidget {
  TextDemo({Key key}) : super(key: key);

  final String _author = "酒剑仙";
  final String _title = "行酒诗";
  //以变量形式定义一个style
  final TextStyle _textStyle = TextStyle(fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Text(
      "《 $_title 》\n -$_author \n 御剑乘风来,除魔天地间。有酒乐逍遥,无酒我亦癞。一饮尽江河,再饮吞日月。干杯醉不倒,唯我酒剑仙",
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({Key key}) : super(key: key);

  final String _author = "酒剑仙";
  final String _title = "行酒诗";

  @override
  Widget build(BuildContext context) {
    //使用TextSpan的嵌套
    return RichText(
        text: TextSpan(
            text:
                "《 $_title 》\n -$_author \n 御剑乘风来,除魔天地间。有酒乐逍遥,无酒我亦癞。一饮尽江河,再饮吞日月。干杯醉不倒,唯我酒剑仙",
            style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontSize: 34.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w100),
            children: [
          TextSpan(
            text: "\n仙剑奇侠传",
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 17.0,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w100),
          )
        ]));
  }
}
