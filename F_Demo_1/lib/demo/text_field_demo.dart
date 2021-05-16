import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key key}) : super(key: key);

  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  //把对TextField的设置都放在Controller中
  final textEditingController = TextEditingController();

  void initState() {
    super.initState();
    textEditingController.text = "你好，世界";
    textEditingController.addListener(() {
      debugPrint('input:${textEditingController.text}');
    });
  }

  //使用textEditingController结束后将其占用的资源释放
  @override
  void dispose() {
    //哪些东西需要释放？
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,

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
      // //焦点变化或者文字变化会触发这个回调
      // //value表示文本框中的字符串
      // onChanged: (value) {
      //   debugPrint('input:$value');
      // },
      //点击虚拟键盘的确定按钮会触发这个回调
      onSubmitted: (value) {
        debugPrint('submit:$value');
      },
    );
  }
}
