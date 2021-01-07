import 'package:flutter/material.dart';

//返回值是个枚举
enum Option {
  A,
  B,
  C,
  D,
  E,
  F,
  G,
}

class SimpleDialogDemo extends StatefulWidget {
  SimpleDialogDemo({Key key}) : super(key: key);

  @override
  _SimpleDialogDemoState createState() => _SimpleDialogDemoState();
}

class _SimpleDialogDemoState extends State<SimpleDialogDemo> {
  String _choice = 'Nothing';

  Future _showSimpleDialog() async {
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDialog'),
            children: [
              SimpleDialogOption(
                child: Text('星期一'),
                onPressed: () {
                  //返回（dialog消失）
                  Navigator.pop(context, Option.A);
                },
              ),
              SimpleDialogOption(
                child: Text('星期二'),
                onPressed: () {
                  Navigator.pop(context, Option.B);
                },
              ),
              SimpleDialogOption(
                child: Text('星期三'),
                onPressed: () {
                  Navigator.pop(context, Option.C);
                },
              ),
              SimpleDialogOption(
                child: Text('星期四'),
                onPressed: () {
                  Navigator.pop(context, Option.D);
                },
              ),
              SimpleDialogOption(
                child: Text('星期五'),
                onPressed: () {
                  Navigator.pop(context, Option.E);
                },
              ),
              SimpleDialogOption(
                child: Text('星期六'),
                onPressed: () {
                  Navigator.pop(context, Option.F);
                },
              ),
              SimpleDialogOption(
                child: Text('星期日'),
                onPressed: () {
                  Navigator.pop(context, Option.G);
                },
              ),
            ],
          );
        });

    switch (option) {
      case Option.A:
        setState(() {
          _choice = '星期一';
        });
        break;
      case Option.B:
        setState(() {
          _choice = '星期二';
        });
        break;
      case Option.C:
        setState(() {
          _choice = '星期三';
        });
        break;
      case Option.D:
        setState(() {
          _choice = '星期四';
        });
        break;
      case Option.E:
        setState(() {
          _choice = '星期五';
        });
        break;
      case Option.F:
        setState(() {
          _choice = '星期六';
        });
        break;
      case Option.G:
        setState(() {
          _choice = '星期日';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDialogDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('你选择的是$_choice'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.format_list_numbered),
        onPressed: _showSimpleDialog,
      ),
    );
  }
}
