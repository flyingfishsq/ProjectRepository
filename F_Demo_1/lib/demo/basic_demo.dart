import 'dart:ui';

import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  BasicDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//使用TextSpan的嵌套
    // return RichTextDemo();

    return Container(
      color: Colors.yellow[50],
      //容器默认是撑满屏幕，如果想设置尺寸，要放在Row或者Column中
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              Icons.pool,
              size: 32.0,
              color: Colors.white,
            ),
            // color: Color.fromRGBO(3, 54, 255, 0.5),
            //分别设置各边的padding
            // padding: EdgeInsets.only(left: 24.0, right: 24.0),
            padding: EdgeInsets.all(16.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0, height: 90.0,
            decoration: BoxDecoration(
              //这个颜色设置不能与Container的颜色设置同时设置，会有冲突
              color: Color.fromRGBO(3, 54, 255, 0.8),

              //单独设置边框
              // border: Border(
              //   top: BorderSide(
              //       color: Colors.indigoAccent[100],
              //       width: 3.0,
              //       style: BorderStyle.solid),
              //   bottom: BorderSide(
              //       color: Colors.indigoAccent[100],
              //       width: 3.0,
              //       style: BorderStyle.solid),
              // ),

              //四边统一设置边框
              border: Border.all(
                color: Colors.indigoAccent[100],
                width: 3.0,
                style: BorderStyle.solid,
              ),

              //四角统一设置圆角边框
              // borderRadius: BorderRadius.circular(16.0)
              //各角单独设置圆角边框
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0)),
              boxShadow: [
                //向右偏移的阴影
                // BoxShadow(
                //   offset: Offset(6.0, 6.0),
                //   color: Color.fromRGBO(3, 54, 255, 1.0),
                //   //阴影的模糊程度，值越大越模糊
                //   blurRadius: 20.0,
                //   //阴影的扩散程度，正数表示在标准值上扩大，负数表示在标准值上缩小
                //   spreadRadius: -2.0,
                // ),

                //向底部偏移的阴影，使其具有按钮的立体效果
                BoxShadow(
                  offset: Offset(0.0, 12.0),
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  //阴影的模糊程度，值越大越模糊
                  blurRadius: 16.0,
                  //阴影的扩散程度，正数表示在标准值上扩大，负数表示在标准值上缩小
                  spreadRadius: -2.0,
                ),
              ],
              //这个阴影形状的设置不能与边框的Radius.circular同时设置，会有冲突
              //这个使用起来更简单，能同时设置边框和阴影，但后者设置起来更灵活
              // shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
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
      "《 $_title 》\n -$_author \n 御剑乘风来,除魔天地间。有酒乐逍遥,无酒我亦癞。一饮尽江河,再饮吞日月。千杯醉不倒,唯我酒剑仙",
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
                "《 $_title 》\n -$_author \n 御剑乘风来,除魔天地间。有酒乐逍遥,无酒我亦癞。一饮尽江河,再饮吞日月。千杯醉不倒,唯我酒剑仙",
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
