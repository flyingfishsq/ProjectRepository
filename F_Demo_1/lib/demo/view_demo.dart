import 'package:F_Demo_1/demo/pageview_builder_demo.dart';
import 'package:flutter/material.dart';

class ViewDemo extends StatelessWidget {
  const ViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return PageViewDemo();

    //使用PageView.builder按需生成页面
    return PageViewBuilderDemo();
  }
}
