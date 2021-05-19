import 'package:flutter/material.dart';

class LoadingContainer extends StatelessWidget {
  //加载结束时需要显示的widget
  //注意这里的一些写法
  final Widget childWidget;
  final bool isLoading;
  final bool cover;

  LoadingContainer(
      {Key key,
      @required this.childWidget,
      @required this.isLoading,
      this.cover = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !cover
        ? !isLoading
            ? childWidget
            : _loadingView
        : Stack(
            children: [childWidget, isLoading ? _loadingView : null],
          );
  }

  Widget get _loadingView {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
