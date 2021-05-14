import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/model/common_model.dart';
import 'package:flutter_trip_app/model/grid_nav_model.dart';

class LocalNavWidget extends StatelessWidget {
  final List<CommonModel> localNavList;

  const LocalNavWidget({Key key, @required this.localNavList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.zero,
            topRight: Radius.zero,
            bottomLeft: Radius.circular(5.0),
            bottomRight: Radius.circular(5.0)),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (localNavList == null) return null;
    List<Widget> items = [];

    //遍历数据列表的同时返回组件列表
    localNavList.forEach((element) {
      items.add(_item(context, element));
    });

    //用一个列布局把所有icon排一起
    return Row(
      //平均排列
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context, CommonModel model) {
    return GestureDetector(
      onTap: () {

      },
      child: Column(
        children: [
          Image.network(
            model.icon,
            width: 28.0,
            height: 28.0,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 12.0),
          ),
        ],
      ),
    );
  }
}
