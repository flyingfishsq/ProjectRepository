import 'package:F_Demo_1/demo/alert_dialog_demo.dart';
import 'package:F_Demo_1/demo/bottom_sheet_demo.dart';
import 'package:F_Demo_1/demo/button_demo.dart';
import 'package:F_Demo_1/demo/check_box_demo.dart';
import 'package:F_Demo_1/demo/date_time_demo.dart';
import 'package:F_Demo_1/demo/expansion_panel_demo.dart';
import 'package:F_Demo_1/demo/floating_action_button_demo.dart';
import 'package:F_Demo_1/demo/form_demo.dart';
import 'package:F_Demo_1/demo/popup_menu_demo.dart';
import 'package:F_Demo_1/demo/radio_button_demo.dart';
import 'package:F_Demo_1/demo/simple_dialog_demo.dart';
import 'package:F_Demo_1/demo/slider_demo.dart';
import 'package:F_Demo_1/demo/snack_bar_demo.dart';
import 'package:F_Demo_1/demo/switch_demo.dart';
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
            title: 'FloatingActionButton悬浮按钮',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'Button多种按钮',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'Widget部件',
            page: WidgetDemo(),
          ),
          ListItem(
            title: 'PopupMenu弹出框',
            page: PopupMenuDemo(),
          ),
          ListItem(
            title: 'Form表单',
            page: FormDemo(),
          ),
          ListItem(
            title: 'CheckBox复选框',
            page: CheckBoxDemo(),
          ),
          ListItem(
            title: 'RadioButton单选按钮',
            page: RadioButtonDemo(),
          ),
          ListItem(
            title: 'Switch开关按钮',
            page: SwitchDemo(),
          ),
          ListItem(
            title: 'Slider滑动控件',
            page: SliderDemo(),
          ),
          ListItem(
            title: 'DateTime时间选择控件',
            page: DateTimeDemo(),
          ),
          ListItem(
            title: 'SimpleDialog对话框控件',
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: 'AlertDialog对话框控件',
            page: AlertDialogDemo(),
          ),
          ListItem(
            title: 'BottomSheet底部表单控件',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: 'SnackBar底部通知控件',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: 'ExpansionPanelDemo展开控件',
            page: ExpansionPanelDemo(),
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

class WidgetDemo extends StatelessWidget {
  const WidgetDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetDemo'),
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
