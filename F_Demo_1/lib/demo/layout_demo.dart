import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //这样返回的小部件背景会撑满整个界面，必须放在Row或者Column中
    // return IconBadge(Icons.computer_outlined);
    //这样小部件就是设定的大小显示
    // return Column(
    //   children: [IconBadge(Icons.computer_outlined)],
    // );

    return Container(
        alignment: Alignment.topLeft,
        child: Column(
          //空间分配在部件的周围
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          //剩余空间平均分配
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconBadge(Icons.computer_outlined),
            IconBadge(Icons.work_outline),
            IconBadge(Icons.card_giftcard),
          ],
        ));
  }
}

class IconBadge extends StatelessWidget {
  IconBadge(
    this.icon, {
    Key key,
    this.size = 48.0,
  }) : super(key: key);

  final IconData icon;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(
        icon,
        size: size,
        color: Colors.white,
      ),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 0.5),
    );
  }
}
