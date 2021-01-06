import 'package:F_Demo_1/demo/button_demo.dart';
import 'package:F_Demo_1/demo/check_box_demo.dart';
import 'package:F_Demo_1/demo/floating_action_button_demo.dart';
import 'package:F_Demo_1/demo/form_demo.dart';
import 'package:F_Demo_1/demo/popup_menu_demo.dart';
import 'package:F_Demo_1/demo/radio_button_demo.dart';
import 'package:flutter/material.dart';

class MaterialComponents extends StatelessWidget {
  const MaterialComponents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Components'),
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          ListItem(
            title: 'FloatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'Button',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'Weiget',
            page: WeidgetDemo(),
          ),
          ListItem(
            title: 'PopupMenu',
            page: PopupMenuDemo(),
          ),
          ListItem(
            title: 'Form',
            page: FormDemo(),
          ),
          ListItem(
            title: 'CheckBox',
            page: CheckBoxDemo(),
          ),
          ListItem(
            title: 'RadioButton',
            page: RadioButtonDemo(),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({this.title, this.page, key}) : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

class WeidgetDemo extends StatelessWidget {
  const WeidgetDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeigetDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
