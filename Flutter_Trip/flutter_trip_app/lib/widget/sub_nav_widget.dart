import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/model/common_model.dart';
import 'package:flutter_trip_app/model/grid_nav_model.dart';
import 'package:flutter_trip_app/widget/web_view.dart';

class SubNavWidget extends StatelessWidget {
  final List<CommonModel> subNavList;

  const SubNavWidget({Key key, @required this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: _items(context),
      ),
    );
  }

  _items(BuildContext context) {
    if (subNavList == null) return null;
    List<Widget> items = [];

    //遍历数据列表的同时返回组件列表
    subNavList.forEach((element) {
      items.add(_item(context, element));
    });
    //约定最多显示两行，用公式计算第一行显示的数量
    int separate = (subNavList.length / 2 + 0.5).toInt();

    return Column(
      children: [
        Row(
          //平均排列
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, separate),
        ),
        //两行之间有间隔
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            //平均排列
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.sublist(separate, subNavList.length),
          ),
        ),
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel model) {
    //item平分布局的大小，因为图片和文字没有上下对齐
    return Expanded(
        flex: 1,
        child: GestureDetector(
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
          child: Column(
            children: [
              Image.network(
                model.icon,
                width: 18.0,
                height: 18.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  model.title,
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
        ));
  }
}
