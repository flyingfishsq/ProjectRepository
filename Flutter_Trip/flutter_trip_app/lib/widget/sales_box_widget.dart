import 'package:flutter/material.dart';
import 'package:flutter_trip_app/model/common_model.dart';
import 'package:flutter_trip_app/model/sales_box.dart';
import 'package:flutter_trip_app/widget/web_view.dart';

//底部卡片
class SalesBoxWidget extends StatelessWidget {
  final SalesBox salesBox;

  const SalesBoxWidget({Key key, @required this.salesBox}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: _items(context),
    );
  }

  _items(BuildContext context) {
    if (salesBox == null) return null;
    List<Widget> items = [];
    items.add(_doubleItem(
        context, salesBox.bigCard1, salesBox.bigCard2, true, false));
    items.add(_doubleItem(
        context, salesBox.smallCard1, salesBox.smallCard2, false, false));
    items.add(_doubleItem(
        context, salesBox.smallCard3, salesBox.smallCard4, false, true));

    return Column(
      children: [
        //第一行的更多
        Container(
          height: 44,
          margin: EdgeInsets.only(left: 8),
          decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Color(0xfff2f2f2))),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                salesBox.icon,
                height: 16,
                fit: BoxFit.fill,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffff4e63),
                      Color(0xffff6cc9),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WebView(
                                  url: salesBox.moreUrl,
                                  title: "更多活动",
                                )));
                  },
                  child: Text(
                    '获取更多福利 >',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(0, 1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(1, 2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(2, 3),
        ),
      ],
    );
  }

  Widget _doubleItem(BuildContext context, CommonModel modelLeft,
      CommonModel modelRight, bool isBig, bool isLast) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _item(context, modelLeft, isBig, true, isLast),
        _item(context, modelRight, isBig, false, isLast),
      ],
    );
  }

  Widget _item(BuildContext context, CommonModel model, bool isBig, bool isLeft,
      bool isLast) {
    BorderSide borderSide = BorderSide(width: 1, color: Color(0xfff2f2f2));
    //item平分布局的大小，因为图片和文字没有上下对齐
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
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                right: isLeft ? borderSide : BorderSide.none,
                bottom: isLast ? BorderSide.none : borderSide)),
        child: Image.network(
          model.icon,
          fit: BoxFit.fill,
          //获取屏幕的宽和高
          width: MediaQuery.of(context).size.width / 2 - 16,
          height: isBig ? 130 : 80,
        ),
      ),
    );
  }
}
