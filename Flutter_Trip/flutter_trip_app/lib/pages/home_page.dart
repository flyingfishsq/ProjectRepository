import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip_app/dao/home_dao.dart';
import 'package:flutter_trip_app/model/common_model.dart';
import 'package:flutter_trip_app/widget/local_nav_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

//const常量只能定义在静态代码区内
const double APPBAR_SCROLL_MAX = 100.0;

class _HomePageState extends State<HomePage> {
  List<String> _imgUrls = [
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fn.sinaimg.cn%2Fsinacn02%2F616%2Fw640h776%2F20180515%2F88d2-hapkuvk8221419.jpg&refer=http%3A%2F%2Fn.sinaimg.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623034496&t=df6df1fec838452d5fc98e55ecc13c68',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2F5b0988e595225.cdn.sohucs.com%2Fimages%2F20180609%2Fe3571d55ec3d419a944119e9db1176b1.jpeg&refer=http%3A%2F%2F5b0988e595225.cdn.sohucs.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623035542&t=cc411df4106395fd8db9eedf378a65a5',
    'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fphotocdn.sohu.com%2F20120509%2FImg342738868.jpg&refer=http%3A%2F%2Fphotocdn.sohu.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1623035685&t=ead4e8d42b599ee6a21431ce1c409a71',
  ];

  //初始状态下为透明
  double _appbarAlpha = 0;
  String resultString = '';
  List<CommonModel> localNavList = [];

  @override
  initState() {
    super.initState();
    loadData();
  }

  loadData() {
    //异步数据使用then
    HomeDao.fetch().then((value) {
      setState(() {
        localNavList = value.localNavList;
        //把对象转换成json字符串
        resultString = json.encode(value);
      });
    }).catchError((e) {
      //获得出错返回后的操作，这是Future提供的方法
      setState(() {
        resultString = e.toString();
      });
    });
  }

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
      backgroundColor: Colors.white,
      //Stack相当于FrameLayout，子元素按照代码的顺序一层层覆盖
      body: Stack(
        children: [
          //去除在刘海屏手机上的头部空白，应该测试下
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            //监听某个组件的滚动事件，就把组件作为child传入NotificationListener

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
                return true;
              },
              child: ListView(
                children: [
                  //使用Container来控制组件的大小
                  Container(
                    height: 160.0,
                    child: Swiper(
                      itemBuilder: (context, index) =>
                          Image.network(_imgUrls[index], fit: BoxFit.fill),
                      itemCount: _imgUrls.length,
                      autoplay: true,
                      // viewportFraction: 0.9,
                      // scale: 0.9,
                      //指示器
                      pagination: SwiperPagination(
                          builder: DotSwiperPaginationBuilder(
                              activeColor: Colors.white,
                              size: 8.0,
                              activeSize: 8.0,
                              space: 4.0)),
                      controller: SwiperController(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                    child: LocalNavWidget(localNavList: localNavList),
                  ),
                  Container(
                    height: 800.0,
                    child: ListTile(
                      title: Text(resultString),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //让一个控件可以具有透明度，就把它作为child传入Opacity中
          Opacity(
            opacity: _appbarAlpha,
            child: Container(
              height: 80.0,
              decoration: BoxDecoration(color: Colors.white),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Text('首页'),
                ),
              ),
            ),
          ),
        ],
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
}
