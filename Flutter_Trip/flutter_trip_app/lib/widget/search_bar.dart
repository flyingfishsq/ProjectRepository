import 'package:flutter/material.dart';

//SearchBarType三种状态的枚举：首页状态下普通的样式，首页状态下高亮的样式，搜索界面下的样式
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
      this.enabled,
      this.hideLeft,
      this.searchBarType,
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
      child: Row(
        children: [
          _wrapTap(
            Container(
              child: widget?.hideLeft ?? false
                  ? null
                  : Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey,
                      size: 26,
                    ),
            ),
            //把这个回调传给callback
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

  Widget _genHomeSearch() {}

  Widget _inputBox() {
    Color inputBoxColor;
    if (widget.searchBarType == SearchBarType.home) {
      inputBoxColor = Colors.white;
    } else {
      inputBoxColor = Color(int.parse('0xffEDEDED'));
    }
    return Container(
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
              child: widget.searchBarType == SearchBarType.normal
                  ? TextField(
                      controller: _controller,
                      onChanged: _onChanged,
                      autofocus: true,
                      //输入框内文字的样式
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w300),
                      //输入框的样式
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        border: InputBorder.none,
                        hintText: widget.hint ?? '',
                        hintStyle: TextStyle(fontSize: 16),
                      ),
                    )
                  : _wrapTap(
                      Container(
                        child: Text(
                          widget.defaultText,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ),
                      widget.inputBoxClick)),
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
}
