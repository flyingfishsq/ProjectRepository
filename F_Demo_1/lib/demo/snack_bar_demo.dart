import 'package:flutter/material.dart';

class SnackBarDemo extends StatefulWidget {
  SnackBarDemo({Key? key}) : super(key: key);

  @override
  _SnackBarDemoState createState() => _SnackBarDemoState();
}

class _SnackBarDemoState extends State<SnackBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBarDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SnackBarButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SnackBarButton extends StatelessWidget {
  const SnackBarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            '正在读取...',
          ),
          action: SnackBarAction(
            label: 'Ok',
            onPressed: () {},
          ),
        ));
      },
      child: Text('显示SnackBar'),
    );
  }
}
