import 'package:flutter/material.dart';

class BottomSheetDemo extends StatefulWidget {
  BottomSheetDemo({Key? key}) : super(key: key);

  @override
  _BottomSheetDemoState createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  final _bottomSheetScafflodKey = GlobalKey<ScaffoldState>();

  _showBottomSheet() {
    _bottomSheetScafflodKey.currentState!.showBottomSheet((context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(Icons.pause_circle_filled_outlined),
              SizedBox(
                width: 16.0,
              ),
              Text('01:30 / 03:30'),
              Expanded(
                child: Text(
                  'Fix you - ColdPlay',
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

//这样的底部菜单相当于PopupMenu的效果，弹出后就不能点击界面上的其它内容了，与上面一个不同，上面一个不影响界面上的其它内容
  Future _showModelBottomSheet() async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200.0,
            child: Column(
              children: [
                ListTile(
                  title: Text('选项A'),
                  //如果图标显示在左边，就用leading，右边就用trailing
                  leading: Icon(
                    Icons.network_wifi,
                    color: Colors.black54,
                    size: 22.0,
                  ),
                  onTap: () {
                    Navigator.pop(context, "A");
                  },
                ),
                ListTile(
                  title: Text('选项B'),
                  //如果图标显示在左边，就用leading，右边就用trailing
                  leading: Icon(
                    Icons.access_alarm,
                    color: Colors.black54,
                    size: 22.0,
                  ),
                  onTap: () {
                    Navigator.pop(context, "B");
                  },
                ),
                ListTile(
                  title: Text('选项C'),
                  //如果图标显示在左边，就用leading，右边就用trailing
                  leading: Icon(
                    Icons.call,
                    color: Colors.black54,
                    size: 22.0,
                  ),
                  onTap: () {
                    Navigator.pop(context, "C");
                  },
                ),
              ],
            ),
          );
        });

    print(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetScafflodKey,
      appBar: AppBar(
        title: Text('BottomSheetDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: _showBottomSheet,
                  child: Text('打开底部表单1'),
                ),
                FlatButton(
                  onPressed: _showModelBottomSheet,
                  child: Text('打开底部表单2'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
