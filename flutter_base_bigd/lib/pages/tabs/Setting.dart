import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  SettingPage({Key key}) : super(key: key);

  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('文本1'),
        ),
        ListTile(
          title: Text('文本2'),
        ),
        ListTile(
          title: Text('文本3'),
        ),
        ListTile(
          title: Text('文本4'),
        ),
        ListTile(
          title: Text('文本5'),
        ),
        ListTile(
          title: Text('文本6'),
        ),
      ],
    );
  }
}
