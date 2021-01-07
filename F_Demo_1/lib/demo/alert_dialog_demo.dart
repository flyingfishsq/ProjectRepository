import 'package:flutter/material.dart';

enum Action {
  Ok,
  Cancel,
}

class AlertDialogDemo extends StatefulWidget {
  AlertDialogDemo({Key key}) : super(key: key);

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';

  Future _showAlertDialog() async {
    final action = await showDialog(
        //只有点击按钮才能关闭
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('提示'),
            content: Text('您将要复制文字'),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, Action.Ok);
                  },
                  child: Text('确定')),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, Action.Cancel);
                  },
                  child: Text('取消')),
            ],
          );
        });

    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = '确定';
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = '取消';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('你选择的是$_choice'),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(child: Text('点击'), onPressed: _showAlertDialog),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
