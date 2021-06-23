import 'package:flutter/material.dart';
import 'package:flutter_trip_app/dao/search_dao.dart';
import 'package:flutter_trip_app/model/search_item.dart';
import 'package:flutter_trip_app/model/search_model.dart';
import 'package:flutter_trip_app/widget/search_bar.dart';
import 'package:flutter_trip_app/widget/web_view.dart';

const String URL =
    'https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=';

const TYPES = [
  'channelgroup',
  'channellgs',
  'channelplane',
  'channeltrain',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];

class SearchPage extends StatefulWidget {
  final bool hideLeft;
  final String searchUrl;
  final String keyword;
  final String hint;

  //给searchUrl设置默认值，避免在未赋值时出错
  const SearchPage(
      {Key key, this.hideLeft, this.searchUrl = URL, this.keyword, this.hint})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel searchModel;
  String keyword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Column(
        children: [
          _appBar(),

          //如果不用MediaQuery包围，ListView的顶部会有空白
          MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child:
                //ListView需要设置高度，这里要撑满除去顶部菜单的所有空间，则通过Expanded来改进
                Expanded(
              flex: 1,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int position) {
                  return _item(position);
                },
                itemCount: searchModel?.data?.length ??
                    0, //如果searchModel为空或data成员变量为空，则返回0，否则返回实际值
              ),
            ),
          ),

          //通过创建单个item的方法来创建ListView
        ],
      ),
    );
  }

  //bug：有些时候虚拟键盘的删除按钮点击无效
  _onTextChange(text) {
    keyword = text;
    //用户点击了清除按钮
    if (text.length == 0) {
      setState(() {
        //把搜索结果置空
        searchModel = null;
      });
      return;
    }
    String url = widget.searchUrl + text;
    SearchDao.fetch(url, text).then((SearchModel model) {
      if (model.keyword == keyword) {
        setState(() {
          searchModel = model;
        });
      }
    }).catchError((e) {
      print(e);
    });
  }

  //上面有空白
  _appBar() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            //自上而下的线性渐变
            gradient: LinearGradient(
                colors: [Color(0x66000000), Colors.transparent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          //高度20就是状态栏的高度，把状态栏的高度空出来，80是自身高度
          child: Container(
            padding: EdgeInsets.only(top: 20),
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: SearchBar(
              hideLeft: widget.hideLeft,
              defaultText: widget.keyword,
              hint: widget.hint,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTextChange,
            ),
          ),
        ),
      ],
    );
  }

  Widget _item(int position) {
    if (searchModel == null || searchModel.data == null) return null;
    SearchItem item = searchModel.data[position];
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(url: item.url, title: '详情')));
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(2),
              child: Image(
                height: 32,
                width: 32,
                image: AssetImage(_typeImage(item.type)),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 300,
                  //字符串为空对象的时候返回空字符串
                  child: _title(item),
                ),
                Container(
                  width: 300,
                  margin: EdgeInsets.only(top: 4),
                  child: _subTitle(item),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  //根据类型匹配到文件路径
  String _typeImage(String type) {
    if (type == null) return 'images/type_travelgroup.png';

    String path = 'travelgroup';
    for (final val in TYPES) {
      if (type.contains(val)) {
        path = val;
        break;
      }
    }
    return 'images/type_$path.png';
  }

  _title(SearchItem item) {
    if (item == null) return null;

    //TextSpan是用来显示富文本的一个辅助类
    List<TextSpan> spans = [];
    spans.addAll(_keywordTextSpans(item.word, searchModel.keyword));

    spans.add(TextSpan(
        text: '  ' + (item.districtname ?? '') + (item.zonename ?? ''),
        style: TextStyle(fontSize: 16, color: Colors.grey)));
    return RichText(
      text: TextSpan(children: spans),
    );
  }

  _subTitle(SearchItem item) {
    return RichText(
      text: TextSpan(children: [
        TextSpan(
            text: item.price ?? '',
            style: TextStyle(fontSize: 16, color: Colors.orange)),
        TextSpan(
            text: '  '+(item.star ?? ''),
            style: TextStyle(fontSize: 14, color: Colors.grey)),
      ]),
    );
  }

  //以搜索关键字为断点，把字符串拆分
  Iterable<TextSpan> _keywordTextSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    if (word == null || word.length == 0) return spans;

    List<String> arr = word.split(keyword);
    TextStyle normalStyle = TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keywordStyle = TextStyle(fontSize: 16, color: Colors.orange);

    // wordwoc split w [,ord,oc]
    for (int i = 0; i < arr.length; i++) {
      //根据奇数位还是偶数位
      if ((i + 1) % 2 == 0) {
        spans.add(TextSpan(text: keyword, style: keywordStyle));
      }
      String val = arr[i];
      //不是空字符串
      if (val != null && val.length > 0) {
        spans.add(TextSpan(text: val, style: normalStyle));
      }
    }
    return spans;
  }
}
