import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/model/common_model.dart';
import 'package:flutter_trip_app/model/grid_nav.dart';
import 'package:flutter_trip_app/model/grid_nav_model.dart';
import 'package:flutter_trip_app/widget/web_view.dart';

//网格卡片
class GridNavWidget extends StatelessWidget {
  final GridNav model;

  const GridNavWidget({Key key, @required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _gridNavItems(context),
    );
  }

  _gridNavItems(BuildContext context) {
    List<Widget> items = [];
    if (model == null) {
      return items;
    }

    if (model.hotel != null) {
      items.add(_gridNavItem(context, model.hotel, true));
    }

    if (model.flight != null) {
      items.add(_gridNavItem(context, model.flight, false));
    }

    if (model.travel != null) {
      items.add(_gridNavItem(context, model.travel, false));
    }

    return items;
  }

  _gridNavItem(BuildContext context, GridNavModel item, bool isFirst) {
    List<Widget> items = [];
    items.add(_mainItem(context, item.mainItem));
    items.add(_doubleItem(context, item.item1, item.item2));
    items.add(_doubleItem(context, item.item3, item.item4));

    //撑满父布局
    List<Widget> expandItems = [];
    items.forEach((element) {
      expandItems.add(Expanded(
        child: element,
        flex: 1,
      ));
    });

    Color startColor = Color(int.parse('0xff' + item.startColor));
    Color endColor = Color(int.parse('0xff' + item.endColor));

    //底图的渐变色
    return Container(
      height: 88,
      margin: isFirst ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          //线性渐变
          gradient: LinearGradient(colors: [startColor, endColor])),
      child: Row(
        children: expandItems,
      ),
    );
  }

  //当前行的第一个item
  _mainItem(BuildContext context, CommonModel model) {
    return _wrapGesture(
        context,
        Stack(
          children: [
            Image.network(
              model.icon,
              fit: BoxFit.contain,
              height: 88,
              width: 120,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              margin: EdgeInsets.only(top: 12),
              child: Text(
                model.title,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
          ],
        ),
        model);
  }

  //上下排列的两个item，isCenter表示当前这个item是不是处于中间，以此控制是否有左右的padding
  _doubleItem(
      BuildContext context, CommonModel topItem, CommonModel bottomItem) {
    return Column(
      children: [
        Expanded(child: _item(context, topItem, true)),
        Expanded(child: _item(context, bottomItem, false)),
      ],
    );
  }

  //isFirst标记是上面的还是下面的item
  _item(BuildContext context, CommonModel item, bool isFirst) {
    //定义一个分割线
    BorderSide bs = BorderSide(width: 0.8, color: Colors.white);

    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        decoration: BoxDecoration(
            border: Border(
          left: bs,
          bottom: isFirst ? bs : BorderSide.none,
        )),
        child: _wrapGesture(
            context,
            Center(
              child: Text(
                item.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            ),
            item),
      ),
    );
  }

  _wrapGesture(BuildContext context, Widget widget, CommonModel model) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                    url: model.url,
                    statusBarColor: model.statusBarColor,
                    title: model.title,
                    hideAppBar: model.hideAppBar,
                    backForbid: false)));
      },
      child: widget,
    );
  }
}
