import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  const FormDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //从main中的app中获取primaryColor
      // body: ThemeDemo(),

      //单独设置primaryColor替代原来的主题颜色
      // body: Theme(
      //   //单独设置primaryColor替代原来的主题颜色
      //   data: ThemeData(primaryColor: Colors.black26.withOpacity(0.5)),
      //   child: ThemeDemo(),
      // ),

      //覆盖某些特定的主题颜色的设置
      body: Theme(
        data: Theme.of(context)
            .copyWith(primaryColor: Colors.black26.withOpacity(0.5)),
        // child: ThemeDemo(),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [TextFieldDemo()],
          ),
        ),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: '标题',
        labelStyle: TextStyle(fontSize: 28.0, color: Colors.redAccent),
        hintText: '请输入标题',
        //去除下划线边框
        // border: InputBorder.none,
        //四周都有边框
        border: OutlineInputBorder(),
        //让文本框带有背景色
        filled: true,
        fillColor: Colors.red[100],
      ),
      //焦点变化或者文字变化会触发这个回调
      //value表示文本框中的字符串
      onChanged: (value) {
        debugPrint('input:$value');
      },
      //点击虚拟键盘的确定按钮会触发这个回调
      onSubmitted: (value) {
        debugPrint('submit:$value');
      },
    );
  }
}
