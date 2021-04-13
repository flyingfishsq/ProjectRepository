import 'package:F_Demo_1/demo/stack_demo.dart';
import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //这样返回的小部件背景会撑满整个界面，必须放在Row或者Column中
    // return IconBadge(Icons.computer_outlined);
    //这样小部件就是设定的大小显示
    // return Column(
    //   children: [IconBadge(Icons.computer_outlined)],
    // );

    return Container(
        // alignment: Alignment.topLeft,
        // alignment: Alignment.center,
        child:

//Row与Column的学习
            //     Row(
            //   //空间分配在部件的周围
            //   // mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   //剩余空间平均分配
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   //副轴上的位置
            //   // crossAxisAlignment: CrossAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.stretch,
            //   children: [
            //     IconBadge(Icons.computer_outlined),
            //     IconBadge(
            //       Icons.work_outline,
            //       size: 64.0,
            //     ),
            //     IconBadge(Icons.card_giftcard),
            //   ],
            // ),

            Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // //SizedBox的学习
        // SizedBox(
        //   width: 200.0,
        //   height: 300.0,
        //   child: Container(
        //       //注意这个alignment的位置
        //       alignment: Alignment(-1.0, 0.5),
        //       //看下这个常量的定义会发现实际上就是用一对坐标来确定位置
        //       // alignment: Alignment.topCenter,
        //       decoration: BoxDecoration(
        //         color: Color.fromRGBO(3, 54, 255, 0.5),
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //       child: Icon(
        //         Icons.ac_unit,
        //         color: Colors.white,
        //         size: 48.0,
        //       )),
        // ),
        // //这个SizedBox作为两个SizedBox之间的间隔
        // SizedBox(
        //   height: 32.0,
        // ),
        // SizedBox(
        //   width: 100.0,
        //   height: 100.0,
        //   child: Container(
        //       decoration: BoxDecoration(
        //         color: Color.fromRGBO(3, 54, 255, 0.5),
        //         borderRadius: BorderRadius.circular(8.0),
        //       ),
        //       child: Icon(
        //         Icons.brightness_2,
        //         color: Colors.white,
        //         size: 48.0,
        //       )),
        // ),

//Stack的学习，Stack表示一摞小部件
        StackDemo(),

        //AspectRatio的学习，可以设置子部件的宽高比例
        // AspectRatioDemo(),

        //ConstrainedBox的学习，可以设置子部件的受限宽高
        // ConstrainedBoxDemo(),
      ],
    ));
  }
}

class IconBadge extends StatelessWidget {
  IconBadge(
    this.icon, {
    Key? key,
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
