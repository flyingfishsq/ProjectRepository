import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  const AnimationDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  AnimationDemoHome({Key key}) : super(key: key);

  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

//注意这里的with
class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation;
  Animation animationColor;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      // value: 32.0,
      // lowerBound: 32.0,
      // upperBound: 100.0,
      duration: Duration(milliseconds: 1000),
      //防止屏幕之外的动画消耗多余资源
      vsync: this,
    );

    curve =
        CurvedAnimation(parent: animationController, curve: Curves.easeInCubic);

    //设置动画范围值（数字，颜色），替代AnimationController中的设置
    animation = Tween(
      begin: 32.0,
      end: 100.0,
    ).animate(curve);

    animationColor = ColorTween(
      end: Colors.red,
      begin: Colors.pink[100],
    ).animate(curve);

    // animationController.addListener(() {
    //   //这个方法就是重绘部件，相当于invalidate
    //   setState(() {});
    //   //每输出一次就表示显示了一帧画面，输出这些数字的次数取决于设置的动画持续时间和设备每秒显示的帧数（刷新率）
    //   print('${animationController.value}');
    // });

    // animationController.forward();
    //监听动画的运行状态
    animationController.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        animationController.reverse();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: ActionChip(
      //   label: Text('${animationController.value}'),
      //   onPressed: () {
      //     //动画向前播放
      //     animationController.forward();
      //   },
      // ),

      // child: IconButton(
      //     icon: Icon(Icons.favorite),
      //     // iconSize: animationController.value,
      //     iconSize: animation.value,
      //     color: animationColor.value,
      //     onPressed: () {
      //       animationController.forward();
      //     }),

      //使用自定义可以自行重绘的小图标动画
      child: AnimatedHeart(
        animations: [
          animation,
          animationColor,
        ],
        controller: animationController,
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    this.animations,
    this.controller,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.favorite),
        // iconSize: animationController.value,
        iconSize: animations[0].value,
        color: animations[1].value,
        onPressed: () {
          controller.forward();
        });
  }
}
