import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  //加载结束时需要显示的widget
  //注意这里的一些写法
  final Widget childWidget;
  final bool isLoading;
  //是否覆盖页面布局，是否在child之上层
  final bool cover;

  LoadingContainer(
      {Key key,
      @required this.childWidget,
      @required this.isLoading,
      this.cover = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //思考这个表达式含义
    return !cover
        ? !isLoading
            ? childWidget
            : _loadingView
        : Stack(
            children: [childWidget, isLoading ? _loadingView : null],
          );
  }

  //这里为什么要加 get
  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
