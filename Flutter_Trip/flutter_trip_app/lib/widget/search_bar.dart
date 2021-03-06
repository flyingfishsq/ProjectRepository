import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//SearchBarType三种状态的枚举：首页状态下普通的样式，首页状态下高亮的样式，搜索界面下的样式
//测试提交
enum SearchBarType { home, homeLight, normal }

//注意这里的写法
class SearchBar extends StatefulWidget {
  final bool enabled; //是否禁止搜索
  final bool hideLeft; //隐藏左边按钮
  final SearchBarType searchBarType;
  final String hint;
  final String defaultText;

  final void Function() leftButtonClick;
  final void Function() rightButtonClick;
  final void Function() speakClick;
  final void Function() inputBoxClick;
  final ValueChanged<String> onChanged;

  SearchBar(
      {Key key,
      this.enabled = true,
      this.hideLeft,
      this.searchBarType = SearchBarType.normal,
      this.hint,
      this.defaultText,
      this.leftButtonClick,
      this.rightButtonClick,
      this.speakClick,
      this.inputBoxClick,
      this.onChanged})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  //是否显示清除搜索栏中内容的按钮
  bool showClear = false;

  //获取输入框中文字的变化
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    //这里是控制逻辑从语音输入跳转到搜索页时，由语音输入带过来的搜索文字要显示出来
    if (widget.defaultText != null) {
      setState(() {
        _controller.text = widget.defaultText;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.searchBarType == SearchBarType.normal
        ? _genNormalSearch()
        : _genHomeSearch();
  }

  Widget _genNormalSearch() {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          _wrapTap(
            //样式
            Container(
              padding: EdgeInsets.all(4),
              child: widget?.hideLeft ?? false
                  ? null
                  : Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 26,
                    ),
            ),
            //点击逻辑，把这个回调传给callback
            widget.leftButtonClick,
          ),
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
              child: Text(
                '搜索',
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),
            ),
            //把这个回调传给callback
            widget.rightButtonClick,
          ),
        ],
      ),
    );
  }

  Widget _genHomeSearch() {
    return Container(
      padding: EdgeInsets.all(4),
      child: Row(
        children: [
          _wrapTap(
            //样式
            Container(
              padding: EdgeInsets.all(4),
              child: Row(
                children: [
                  Text(
                    '上海',
                    //根据首页背景色来设置字体颜色
                    style: TextStyle(color: _homeFontColor(), fontSize: 16),
                  ),
                  Icon(
                    Icons.expand_more,
                    color: _homeFontColor(),
                    size: 26,
                  ),
                ],
              ),
            ),
            //点击逻辑，把这个回调传给callback
            widget.leftButtonClick,
          ),
          Expanded(
            flex: 1,
            child: _inputBox(),
          ),
          _wrapTap(
            Container(
              padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
              child: Icon(
                Icons.comment,
                color: _homeFontColor(),
                size: 26,
              ),
            ),
            //把这个回调传给callback
            widget.rightButtonClick,
          ),
        ],
      ),
    );
  }

  Widget _inputBox() {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse('0xffEDEDED'));
    }
    return Container(
      height: 30,
      padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
      decoration: BoxDecoration(
          color: inputBoxColor,
          borderRadius: BorderRadius.circular(
              widget.searchBarType == SearchBarType.normal ? 5 : 15)),
      child: Row(
        children: [
          Icon(
            Icons.search,
            size: 20,
            color: widget.searchBarType == SearchBarType.normal
                ? Color(0xffA9A9A9)
                : Colors.blue,
          ),
          Expanded(
              flex: 1,
              //根据常量创建不同的显示
              child: widget.searchBarType == SearchBarType.normal
                  ? TextField(
                      controller: _controller,
                      onChanged: _onChanged,
                      autofocus: true,
                      //输入框内文字的样式
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                      //输入框的样式
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                        border: InputBorder.none,
                        hintText: widget.hint ?? '',
                        hintStyle: TextStyle(fontSize: 16),
                      ),
                    )
                  : _wrapTap(
                      Container(
                        child: Text(
                          widget.defaultText,
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      widget.inputBoxClick)),
          //有输入文字的时候显示清除按钮，没有输入文字的时候显示语音按钮
          !showClear
              ? _wrapTap(
                  Icon(
                    Icons.mic,
                    size: 22,
                    color: widget.searchBarType == SearchBarType.normal
                        ? Colors.blue
                        : Colors.grey,
                  ),
                  widget.speakClick)
              : _wrapTap(
                  Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.grey,
                  ),
                  //设置点击逻辑
                  () {
                    setState(() {
                      _controller.clear();
                    });
                    _onChanged('');
                  },
                ),
        ],
      ),
    );
  }

  _wrapTap(Widget child, void Function() callback) {
    return GestureDetector(
      onTap: () {
        if (callback != null) callback();
      },
      child: child,
    );
  }

  _onChanged(String text) {
    if (text.length > 0) {
      setState(() {
        showClear = true;
      });
    } else {
      setState(() {
        showClear = false;
      });
    }
    if (widget.onChanged != null) {
      widget.onChanged(text);
    }
  }

  _homeFontColor() {
    return widget.searchBarType == SearchBarType.homeLight
        ? Colors.black54
        : Colors.white;
  }
}
