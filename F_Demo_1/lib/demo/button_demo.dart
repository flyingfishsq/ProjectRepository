import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text('FlatButton'),
          //渐墨的效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        // SizedBox(
        //   width: 8.0,
        // ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          onPressed: () {},
          label: Text('FlatButton'),
          //渐墨的效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        //超距会报错
        SizedBox(
          width: 8.0,
        ),
        // RaisedButton.icon(
        //   icon: Icon(Icons.add),
        //   onPressed: () {},
        //   label: Text('RaisedButton'),
        //   //渐墨的效果
        //   splashColor: Colors.white,
        //   color: Colors.pinkAccent,
        //   elevation: 8.0,
        //   textColor: Theme.of(context).accentColor,
        //   textTheme: ButtonTextTheme.accent,
        // ),

        //为按钮设置单个主题
        // Theme(
        //   data: Theme.of(context).copyWith(
        //       buttonColor: Theme.of(context).accentColor,
        //       buttonTheme: ButtonThemeData(
        //         textTheme: ButtonTextTheme.primary,
        //         //设置圆角矩形
        //         // shape: BeveledRectangleBorder(
        //         //   borderRadius: BorderRadius.circular(5.0),
        //         // ),
        //         //设置长椭圆形
        //         shape: StadiumBorder(),
        //       )),
        //   child: RaisedButton.icon(
        //     icon: Icon(Icons.add),
        //     onPressed: () {},
        //     label: Text('RaisedButton'),
        //     //渐墨的效果
        //     splashColor: Colors.white,
        //     // color: Colors.pinkAccent,
        //     // elevation: 8.0,
        //     // textColor: Theme.of(context).accentColor,
        //     // textTheme: ButtonTextTheme.accent,
        //   ),
        // )
      ],
    );

    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text('FlatButton'),
          //渐墨的效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        // SizedBox(
        //   width: 8.0,
        // ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          onPressed: () {},
          label: Text('FlatButton'),
          //渐墨的效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        //超距会报错
        SizedBox(
          width: 8.0,
        ),
        // RaisedButton.icon(
        //   icon: Icon(Icons.add),
        //   onPressed: () {},
        //   label: Text('RaisedButton'),
        //   //渐墨的效果
        //   splashColor: Colors.white,
        //   color: Colors.pinkAccent,
        //   elevation: 8.0,
        //   textColor: Theme.of(context).accentColor,
        //   textTheme: ButtonTextTheme.accent,
        // ),

        //为按钮设置单个主题
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                //设置圆角矩形
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                //设置长椭圆形
                shape: StadiumBorder(),
              )),
          child: RaisedButton.icon(
            icon: Icon(Icons.add),
            onPressed: () {},
            label: Text('RaisedButton'),
            //渐墨的效果
            splashColor: Colors.white,
            // color: Colors.pinkAccent,
            // elevation: 8.0,
            // textColor: Theme.of(context).accentColor,
            // textTheme: ButtonTextTheme.accent,
          ),
        )
      ],
    );

    //带有描边的按钮
    final Widget outLineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //为按钮设置单个主题
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                //设置圆角矩形
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                //设置长椭圆形
                shape: StadiumBorder(),
              )),
          child: OutlineButton(
            onPressed: () {},
            child: Text('OutlineButton'),
            //渐墨的效果
            splashColor: Colors.grey,
            textColor: Colors.black54,
            //普通状态下边框的颜色
            borderSide: BorderSide(
              color: Colors.black,
            ),
            //点击后，高亮状态下边框的颜色
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          onPressed: () {},
          label: Text('OutlineButton'),
          //渐墨的效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        //超距会报错
        SizedBox(
          width: 8.0,
        ),
      ],
    );

    //固定宽度的按钮
    final Widget fixedWidthButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //为按钮设置单个主题
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                //设置圆角矩形
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                //设置长椭圆形
                shape: StadiumBorder(),
              )),
          //只需要把按钮放在Container里，以Container的宽度约束按钮宽度
          child: Container(
            width: 220.0,
            child: OutlineButton(
              onPressed: () {},
              child: Text('FixedWidthButtonDemo'),
              //渐墨的效果
              splashColor: Colors.grey,
              textColor: Colors.black54,
              //普通状态下边框的颜色
              borderSide: BorderSide(
                color: Colors.black,
              ),
              //点击后，高亮状态下边框的颜色
              highlightedBorderColor: Colors.grey,
            ),
          ),
        ),
      ],
    );

    //占满宽度的按钮
    final Widget expandedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //为按钮设置单个主题
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                //设置圆角矩形
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                //设置长椭圆形
                shape: StadiumBorder(),
              )),
          //只需要把按钮放在Expanded里，
          child: Expanded(
            child: OutlineButton(
              onPressed: () {},
              child: Text('占满宽度的按钮'),
              //渐墨的效果
              splashColor: Colors.grey,
              textColor: Colors.black54,
              //普通状态下边框的颜色
              borderSide: BorderSide(
                color: Colors.black,
              ),
              //点击后，高亮状态下边框的颜色
              highlightedBorderColor: Colors.grey,
            ),
          ),
        ),
      ],
    );

    //占满宽度的按钮
    final Widget ratioExpandedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //为按钮设置单个主题
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                //设置圆角矩形
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                //设置长椭圆形
                shape: StadiumBorder(),
              )),
          //只需要把按钮放在Expanded里，
          child: Expanded(
            child: OutlineButton(
              onPressed: () {},
              child: Text('以比例1占满宽度的按钮'),
              //渐墨的效果
              splashColor: Colors.grey,
              textColor: Colors.black54,
              //普通状态下边框的颜色
              borderSide: BorderSide(
                color: Colors.black,
              ),
              //点击后，高亮状态下边框的颜色
              highlightedBorderColor: Colors.grey,
            ),
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton(
            onPressed: () {},
            child: Text('以比例2占满宽度的按钮'),
            //渐墨的效果
            splashColor: Colors.grey,
            textColor: Colors.black54,
            //普通状态下边框的颜色
            borderSide: BorderSide(
              color: Colors.black,
            ),
            //点击后，高亮状态下边框的颜色
            highlightedBorderColor: Colors.grey,
          ),
        ),
      ],
    );

    //一组并排显示的按钮，这里有显示bug，1.如果不放在Expanded中，会报超出显示范围的错，2，如果放在Expanded中，明明是一行排列却变成了两列排列，为什么？
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ButtonBar(
            children: [
              Theme(
                data: Theme.of(context).copyWith(
                    buttonColor: Theme.of(context).accentColor,
                    buttonTheme: ButtonThemeData(
                      textTheme: ButtonTextTheme.primary,
                      //设置圆角矩形
                      // shape: BeveledRectangleBorder(
                      //   borderRadius: BorderRadius.circular(5.0),
                      // ),
                      //设置长椭圆形
                      shape: StadiumBorder(),
                    )),
                //只需要把按钮放在Expanded里，
                child: OutlineButton(
                  onPressed: () {},
                  child: Text('以比例1占满宽度的按钮，多余文字缺省'),
                  //渐墨的效果
                  splashColor: Colors.grey,
                  textColor: Colors.black54,
                  //普通状态下边框的颜色
                  borderSide: BorderSide(
                    color: Colors.black,
                  ),
                  //点击后，高亮状态下边框的颜色
                  highlightedBorderColor: Colors.grey,
                ),
              ),
              OutlineButton(
                onPressed: () {},
                child: Text('以比例2占满宽度的按钮，多余文字缺省'),
                //渐墨的效果
                splashColor: Colors.grey,
                textColor: Colors.black54,
                //普通状态下边框的颜色
                borderSide: BorderSide(
                  color: Colors.black,
                ),
                //点击后，高亮状态下边框的颜色
                highlightedBorderColor: Colors.grey,
              ),
            ],
          ),
        ),
        //为按钮设置单个主题
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            flatButtonDemo,
            raisedButtonDemo,
            outLineButtonDemo,
            fixedWidthButtonDemo,
            expandedButtonDemo,
            ratioExpandedButtonDemo,
            buttonBarDemo,
          ],
        ),
      ),
    );
  }
}
