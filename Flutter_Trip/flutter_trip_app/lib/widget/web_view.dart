import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

//点击返回的时候，出现不是返回到Flutter首页，而是携程主页web的情况，在这里做地址判定跳转控制
const List<String> WHITE_LIST_URLS = [
  'm.ctrip.com/',
  'm.ctrip.com/html5/',
  'm.ctrip.com/html5'
];

class WebView extends StatefulWidget {
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  //backForbid不一定有值，设置一个默认值
  WebView(
      {this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid = false});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final webViewRef = FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;

  bool exiting = false;

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
          if (_isToMain(event.url) && !exiting) {
            //是否禁止返回，是的话就重新加载当前页面
            if (widget.backForbid) {
              webViewRef.launch(widget.url);
            } else {
              Navigator.pop(context);
              exiting = true;
            }
          }
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

  //url在白名单中，则强制返回Flutter首页
  bool _isToMain(String url) {
    bool contain = false;
    for (final value in WHITE_LIST_URLS) {
      //非空调用
      if (url?.endsWith(value) ?? false) {
        contain = true;
        break;
      }
    }
    return contain;
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
          _appBar(
              Color(int.parse('0xff' + statusBarColorStr)), backButtonColor),
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
              child: Center(
                child: Text('加载中...'),
              ),
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
