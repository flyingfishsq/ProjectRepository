import 'package:F_Demo_1/demo/alert_dialog_demo.dart';
import 'package:F_Demo_1/demo/bottom_sheet_demo.dart';
import 'package:F_Demo_1/demo/button_demo.dart';
import 'package:F_Demo_1/demo/check_box_demo.dart';
import 'package:F_Demo_1/demo/chip_demo.dart';
import 'package:F_Demo_1/demo/data_table_demo.dart';
import 'package:F_Demo_1/demo/date_time_demo.dart';
import 'package:F_Demo_1/demo/expansion_panel_demo.dart';
import 'package:F_Demo_1/demo/floating_action_button_demo.dart';
import 'package:F_Demo_1/demo/form_demo.dart';
import 'package:F_Demo_1/demo/paginated_data_table_demo.dart';
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
            title: '1. FloatingActionButton悬浮按钮',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: '2. Button多种按钮',
            page: ButtonDemo(),
          ),
          ListItem(
            title: '3. Widget部件',
            page: WidgetDemo(),
          ),
          ListItem(
            title: '4. PopupMenu弹出框',
            page: PopupMenuDemo(),
          ),
          ListItem(
            title: '5. Form表单',
            page: FormDemo(),
          ),
          ListItem(
            title: '6. CheckBox复选框',
            page: CheckBoxDemo(),
          ),
          ListItem(
            title: '7. RadioButton单选按钮',
            page: RadioButtonDemo(),
          ),
          ListItem(
            title: '8. Switch开关按钮',
            page: SwitchDemo(),
          ),
          ListItem(
            title: '9. Slider滑动控件',
            page: SliderDemo(),
          ),
          ListItem(
            title: '10. DateTime时间选择控件',
            page: DateTimeDemo(),
          ),
          ListItem(
            title: '11. SimpleDialog对话框控件',
            page: SimpleDialogDemo(),
          ),
          ListItem(
            title: '12. AlertDialog对话框控件',
            page: AlertDialogDemo(),
          ),
          ListItem(
            title: '13. BottomSheet底部表单控件',
            page: BottomSheetDemo(),
          ),
          ListItem(
            title: '14. SnackBar底部通知控件',
            page: SnackBarDemo(),
          ),
          ListItem(
            title: '15. ExpansionPanel展开控件',
            page: ExpansionPanelDemo(),
          ),
          ListItem(
            title: '16. Chip标签控件',
            page: ChipDemo(),
          ),
          ListItem(
            title: '17. DataTable表格控件',
            page: DataTableDemo(),
          ),
          ListItem(
            title: '17. PaginatedDataTable可分页表格控件',
            page: PaginatedDataTableDemo(),
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
