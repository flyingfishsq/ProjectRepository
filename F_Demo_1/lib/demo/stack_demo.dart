import 'package:flutter/material.dart';

class StackDemo extends StatelessWidget {
  const StackDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      //里面的小部件是分层叠加的
      children: [
        //SizedBox的学习
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
              //注意这个alignment的位置
              alignment: Alignment(-1.0, 0.5),
              //看下这个常量的定义会发现实际上就是用一对坐标来确定位置
              // alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 0.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(
                Icons.ac_unit,
                color: Colors.white,
                size: 48.0,
              )),
        ),
        //这个SizedBox作为两个SizedBox之间的间隔
        SizedBox(
          height: 32.0,
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 0.5),
                // borderRadius: BorderRadius.circular(8.0),
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  Color.fromRGBO(7, 162, 155, 1.0),
                  Color.fromRGBO(215, 54, 255, 1.0),
                ]),
              ),
              child: Icon(
                Icons.brightness_2,
                color: Colors.white,
                size: 48.0,
              )),
        ),
        Positioned(
            right: 20.0,
            bottom: 20.0,
            child: Icon(
              Icons.queue_play_next,
              color: Colors.white,
              size: 24.0,
            )),
        Positioned(
            right: 40.0,
            bottom: 40.0,
            child: Icon(
              Icons.queue_play_next,
              color: Colors.white,
              size: 24.0,
            )),
        Positioned(
            right: 20.0,
            bottom: 60.0,
            child: Icon(
              Icons.queue_play_next,
              color: Colors.white,
              size: 24.0,
            )),
      ],
    );
  }
}
