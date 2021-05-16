import 'package:F_Demo_1/demo/gridview_builder_demo.dart';
import 'package:flutter/material.dart';

class ViewDemo extends StatelessWidget {
  const ViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return PageViewDemo();

    //使用PageView.builder按需生成页面
    // return PageViewBuilderDemo();

    //使用GridView生成网格视图，GridView默认是纵向排列，主轴是垂直的
    // return GridViewDemo();

    //使用GridView生成网格视图
    // return GridViewExtendDemo();

    //使用GridView生成网格视图
    return GridViewBuilderDemo();
  }
}
