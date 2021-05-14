import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  WebView(
      {this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webViewRef = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  @override
  void initState() {
    super.initState();
    //防止页面重复打开
    webViewRef.close();
    //监听url变化
    _onUrlChanged = webViewRef.onUrlChanged.listen((event) {});
    //监听网页加载情况
    _onStateChanged = webViewRef.onStateChanged.listen((event) {
      switch (event.type) {
        case WebViewState.startLoad:
          break;
        default:
          break;
      }
    });
    //监听网页加载错误的情况
    _onHttpError = webViewRef.onHttpError.listen((WebViewHttpError event) {
      print(event);
    });
  }

  @override
  void dispose() {
    super.dispose();
    //取消和释放监听
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    webViewRef.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    //设置初始化颜色
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    return Scaffold(
      body: Column(
        children: [
          //把String类型的颜色转换成int类型，一个完整的颜色是八位16进制数
          _appBar(Color(int.parse('0xff' + statusBarColorStr)), backButtonColor),
          //appBar底下的布局被撑满
          Expanded(
              child: WebviewScaffold(
            url: widget.url,
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            //设置初始化界面，相当于有个加载进度
            initialChild: Container(
              color: Colors.white,
              child: Text('加载中...'),
            ),
          )),
        ],
      ),
    );
  }

  Widget _appBar(Color bgColor, Color backBtnColor) {
    //注意这里通过widget获取自定义的这个widget的成员变量
    if (widget.hideAppBar ?? false) {
      return Container(
        color: bgColor,
        height: 30,
      );
    }

    return Container(
      //appBar撑满屏幕的宽度
      child: FractionallySizedBox(
        //设置成宽度的撑满
        widthFactor: 1,
        child: Stack(
          children: [
            //可触摸的按钮
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 10.0),
                child: Icon(
                  Icons.close,
                  color: backBtnColor,
                  size: 26.0,
                ),
              ),
            ),
            //居中的标题
            Positioned(
              left: 0.0,
              right: 0.0,
              child: Center(
                child: Text(
                  widget.title ?? '',
                  style: TextStyle(color: backBtnColor, fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
