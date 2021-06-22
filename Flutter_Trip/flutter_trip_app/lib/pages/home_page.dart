import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip_app/dao/home_dao.dart';
import 'package:flutter_trip_app/model/common_model.dart';
import 'package:flutter_trip_app/model/grid_nav.dart';
import 'package:flutter_trip_app/model/home_model.dart';
import 'package:flutter_trip_app/model/sales_box.dart';
import 'package:flutter_trip_app/pages/search_page.dart';
import 'package:flutter_trip_app/widget/grid_nav_widget.dart';
import 'package:flutter_trip_app/widget/loading_container.dart';
import 'package:flutter_trip_app/widget/local_nav_widget.dart';
import 'package:flutter_trip_app/widget/sales_box_widget.dart';
import 'package:flutter_trip_app/widget/search_bar.dart';
import 'package:flutter_trip_app/widget/sub_nav_widget.dart';
import 'package:flutter_trip_app/widget/web_view.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

//const常量只能定义在静态代码区内
const double APPBAR_SCROLL_MAX = 100.0;
const String SEARCH_BAR_DEFAULT_TEXT = '网红打卡地 景点 酒店 美食';

class _HomePageState extends State<HomePage> {
  List<String> _imgUrls = [
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn02%2F616%2Fw640h776%2F20180515%2F88d2-hapkuvk8221419.jpg&refer=http%3A%2F%2Fn.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623034496&t=df6df1fec838452d5fc98e55ecc13c68',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180609%2Fe3571d55ec3d419a944119e9db1176b1.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623035542&t=cc411df4106395fd8db9eedf378a65a5',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fphotocdn.sohu.com%2F20120509%2FImg342738868.jpg&refer=http%3A%2F%2Fphotocdn.sohu.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623035685&t=ead4e8d42b599ee6a21431ce1c409a71',
  ];

  List<CommonModel> bannerList = [];

  //初始状态下为透明
  double _appbarAlpha = 0;
  String resultString = '';
  List<CommonModel> localNavList = [];
  GridNav gridNav;
  List<CommonModel> subNavList = [];
  SalesBox salesBox;

  //LoadingView的属性
  bool isLoading = true;

  bool connectionStatus;

  var _subscription;

  ConnectivityResult _state = ConnectivityResult.none;

  @override
  initState() {
    super.initState();

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.mobile) {
        setState(() {
          _state = ConnectivityResult.mobile;
          _handleRefresh();
          Fluttertoast.showToast(
            msg: "移动网络连接",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        });

        // I am connected to a mobile network.
      } else if (result == ConnectivityResult.wifi) {
        setState(() {
          _state = ConnectivityResult.wifi;
          _handleRefresh();
          Fluttertoast.showToast(
            msg: "wifi网络连接",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        });

        // I am connected to a wifi network.
      } else {
        setState(() {
          _state = ConnectivityResult.none;
          Fluttertoast.showToast(
            msg: "无网络连接",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          );
        });
      }
    });

    // loadData();
    _handleRefresh();
    // _handleRefresh2();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  //改进的结合RefreshLoadIndicator需要的Future
  Future<Null> _handleRefresh() async {
    if (_state != ConnectivityResult.none) {
      try {
        HomeModel model = await HomeDao.fetch();
        setState(() {
          bannerList = model.bannerList;
          localNavList = model.localNavList;
          gridNav = model.gridNav;
          subNavList = model.subNavList;
          salesBox = model.salesBox;
          isLoading = false;
          resultString = json.encode(model);
        });
      } catch (e) {
        setState(() {
          isLoading = false;
          resultString = e.toString();
        });
      }
    } else {
      Fluttertoast.showToast(
        msg: "网络连接错误",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
    return null;
  }

  Future<Null> _handleRefresh2() async {
    try {
      isLoading = false;
      var s = await HomeDao.fetchData(
          "http://60.170.27.134:8898/BBService/YDZFService.asmx/HBSPList",
          '15',
          '1');
      resultString = s;
    } catch (e) {
      isLoading = false;
      resultString = e.toString();
    }
    return null;
  }

  // loadData() {
  //   //异步数据使用then
  //   HomeDao.fetch().then((value) {
  //     setState(() {
  //       bannerList = value.bannerList;
  //       localNavList = value.localNavList;
  //       gridNav = value.gridNav;
  //       subNavList = value.subNavList;
  //       salesBox = value.salesBox;
  //       isLoading = false;
  //       //把对象转换成json字符串
  //       resultString = json.encode(value);
  //     });
  //   }).catchError((e) {
  //     //获得出错返回后的操作，这是Future提供的方法
  //     setState(() {
  //       isLoading = false;
  //       resultString = e.toString();
  //     });
  //   });
  // }

  //另一种写法
  // loadData() async {
  //   try {
  //     HomeModel model = await HomeDao.fetch();
  //     setState(() {
  //       resultString = json.encode(model);
  //     });
  //   } catch (e) {
  //     setState(() {
  //       resultString = e.toString();
  //     });
  //   }
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Center(
  //       //自上而下的线性布局，相当于LinearLayout
  //       child: Column(
  //         children: [
  //           //使用Container来控制组件的大小
  //           Container(
  //             height: 160.0,
  //             child: Swiper(
  //               itemBuilder: (context, index) =>
  //                   Image.network(_imgUrls[index], fit: BoxFit.contain),
  //               itemCount: _imgUrls.length,
  //               autoplay: true,
  //               // viewportFraction: 0.9,
  //               // scale: 0.9,
  //               //指示器
  //               pagination: SwiperPagination(
  //                   builder: DotSwiperPaginationBuilder(
  //                       activeColor: Colors.grey, size: 8.0, activeSize: 8.0,space: 4.0)),
  //               controller: SwiperController(),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }

  //这个页面相当于是个ScrollView，就不能写在Container里限制大小了，应该用Flutter中类似ScrollView作用的ListView
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      //Stack相当于FrameLayout，子元素按照代码的顺序一层层覆盖
      body: LoadingContainer(
        childWidget: Stack(
          children: [
            //去除在刘海屏手机上的头部空白，应该测试下
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              //监听某个组件的滚动事件，就把组件作为child传入NotificationListener

              //自带下拉刷新控件
              child: RefreshIndicator(
                /**
                 *  scrollNotification.depth == 0是表示监听的child的深度，怎么理解呢？例如我们监听的child是一个ListView，但是ListView里面又包含一层Banner，这时候就会监听两个scroll的滚动事件，depth是给到我们选择性的监听指定widget
                 *  这里的深度是指当前需要监听scroll事件的控件在能执行scroll事件的控件栈中的层级深度，本例中Swiper的层级是1而不是2，虽然它的外层还有控件Container
                 */
                child: NotificationListener(
                  onNotification: (scrollNotification) {
                    if (scrollNotification is ScrollStartNotification &&
                        scrollNotification.depth == 0) {
                      print('Scrolling has started');
                    } else if (scrollNotification is ScrollEndNotification &&
                        scrollNotification.depth == 0) {
                      print("Scrolling has ended");
                    } else if (scrollNotification is ScrollUpdateNotification &&
                        scrollNotification.depth == 0) {
                      //这里是为了避免当距离为0的时候也执行这段代码，应该测试一下
                      _onScroll(scrollNotification.metrics.pixels);
                    }
                    // Return true to cancel the notification bubbling.
                    return;
                  },
                  child: _listView,
                ),
                onRefresh: _handleRefresh,
                // onRefresh: _handleRefresh2,
              ),
            ),
            _appBar,
          ],
        ),
        isLoading: isLoading,
      ),
    );
  }

  //传入滑动的距离
  void _onScroll(double offset) {
    // print('滑动距离为  ' + offset.toString());
    //滑动偏移距离除以设置的最大滑动距离
    double alpha = offset / APPBAR_SCROLL_MAX;

    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      _appbarAlpha = alpha;
    });
  }

  Widget get _listView {
    return ListView(
      children: [
        _banner,
        Padding(
          padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          child: LocalNavWidget(localNavList: localNavList),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          child: GridNavWidget(model: gridNav),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          child: SubNavWidget(subNavList: subNavList),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
          child: SalesBoxWidget(salesBox: salesBox),
        ),
        //测试数据
        // Container(
        //   height: 800.0,
        //   child: ListTile(
        //     title: Text(resultString),
        //   ),
        // ),
      ],
    );
  }

  Widget get _appBar {
    //1.第一步实现，标题随滑动改变透明度
    //让一个控件可以具有透明度，就把它作为child传入Opacity中
    // return Opacity(
    //   opacity: _appbarAlpha,
    //   child: Container(
    //     height: 80.0,
    //     decoration: BoxDecoration(color: Colors.white),
    //     child: Center(
    //       child: Padding(
    //         padding: EdgeInsets.only(top: 20.0),
    //         child: Text('首页'),
    //       ),
    //     ),
    //   ),
    // );

    //2.第二步实现，改为实际需要的SearchBar
    // return SearchBar(
    //   searchBarType:
    //   _appbarAlpha > 0.2 ? SearchBarType.homeLight : SearchBarType.home,
    //   inputBoxClick: _jumpToSearch,
    //   speakClick: _jumpToSpeak,
    //   defaultText: SEARCH_BAR_DEFAULT_TEXT,
    //   leftButtonClick: () {},
    // );

    //3.第三步实现，自己修改的SearchBar
    // return Opacity(
    //   opacity: _appbarAlpha,
    //   child: Container(
    //     height: 80.0,
    //     decoration: BoxDecoration(color: Colors.white),
    //     child: Center(
    //       child: Padding(
    //         padding: EdgeInsets.only(top: 20.0),
    //         child: SearchBar(
    //           searchBarType: _appbarAlpha > 0.2
    //               ? SearchBarType.homeLight
    //               : SearchBarType.home,
    //           inputBoxClick: _jumpToSearch,
    //           speakClick: _jumpToSpeak,
    //           defaultText: SEARCH_BAR_DEFAULT_TEXT,
    //           leftButtonClick: () {},
    //         ),
    //       ),
    //     ),
    //   ),
    // );

    //4.第四步实现，带透明度的SearchBar
    //这个比较关键，需要好好理解
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              //AppBar渐变遮罩背景
              colors: [Color(0x66000000), Colors.transparent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            height: 80.0,
            decoration: BoxDecoration(
              color:
                  Color.fromARGB((_appbarAlpha * 255).toInt(), 255, 255, 255),
            ),
            child: SearchBar(
              searchBarType: _appbarAlpha > 0.2
                  ? SearchBarType.homeLight
                  : SearchBarType.home,
              inputBoxClick: _jumpToSearch,
              speakClick: _jumpToSpeak,
              defaultText: SEARCH_BAR_DEFAULT_TEXT,
              leftButtonClick: () {},
            ),
          ),
        ),
        Container(
          height: _appbarAlpha > 0.2 ? 0.5 : 0,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0.5)]),
        ),
      ],
    );
  }

  Widget get _banner {
    //使用Container来控制组件的大小
    return Container(
      height: 160.0,
      child: Swiper(
        //测试图片加载
        // itemBuilder: (context, index) =>
        //     Image.network(_imgUrls[index], fit: BoxFit.fill),
        // itemCount: _imgUrls.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WebView(
                        url: bannerList[index].url,
                        statusBarColor: bannerList[index].statusBarColor,
                        title: bannerList[index].title,
                        hideAppBar: bannerList[index].hideAppBar,
                        backForbid: false)));
          },
          child: Image.network(bannerList[index].icon, fit: BoxFit.fill),
        ),
        itemCount: bannerList.length,
        autoplay: true,
        // viewportFraction: 0.9,
        // scale: 0.9,
        //指示器
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                activeColor: Colors.blueAccent,
                size: 8.0,
                activeSize: 8.0,
                space: 4.0)),
        controller: SwiperController(),
      ),
    );
  }

  void _jumpToSearch() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SearchPage(
        hint: SEARCH_BAR_DEFAULT_TEXT,
      );
    }));
  }

  void _jumpToSpeak() {}

  Future<Null> checkInternet() async {
    try {
      String host = "google.com"; //判断国内外，谷歌还是百度
      host = "baidu.com";
      final result = await InternetAddress.lookup(host);
      print("result-- $result");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          connectionStatus = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        connectionStatus = false;
      });
    }
  }
}
