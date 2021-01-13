import 'package:F_Demo_1/demo/bloc/bolc_demo.dart';
import 'package:F_Demo_1/demo/bottom_navigation_bar_demo.dart';
import 'package:F_Demo_1/demo/drawer_demo.dart';
import 'package:F_Demo_1/demo/form_demo.dart';
import 'package:F_Demo_1/demo/layout_demo.dart';
import 'package:F_Demo_1/demo/listview_demo.dart';
import 'package:F_Demo_1/demo/basic_demo.dart';
import 'package:F_Demo_1/demo/material_components.dart';
import 'package:F_Demo_1/demo/rxdart/rxdart_demo.dart';
import 'package:F_Demo_1/demo/sliver_demo.dart';
import 'package:F_Demo_1/demo/state/state_management_demo.dart';
import 'package:F_Demo_1/demo/stream/stream_demo.dart';
import 'package:F_Demo_1/demo/view_demo.dart';
import 'package:flutter/material.dart';

import 'demo/navigator_demo.dart';

void main() {
  //这里有两个Widget，Center和Text
  runApp(App());
}

//StatelessWidget(不需要修改数据的小部件)与StatefulWidget(需要修改数据的小部件)
class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   //home表示默认的首页
    //   home: Hello(),
    // );
    return MaterialApp(
      // home: Scaffold(
      //   appBar: AppBar(
      //     title: Text("你好"),
      //     //阴影属性
      //     elevation: 4.0,
      //   ),
      //   body: Hello(),
      // ),
      //不在右上角显示debug标识
      debugShowCheckedModeBanner: false,

      // home: Home(),
      //换一个嵌入页面
      // home: SliverDemo(),

      //界面跳转的学习-路由
      // home: NavigatorDemo(),
      //为路由设置名字方便任意界面的切换
      // initialRoute: '/',
      //可以试试这个
      // initialRoute: '/about',
      // initialRoute: '/form',
      // initialRoute: '/mdc',
      // initialRoute: '/state-management',
      // initialRoute: '/stream',
      // initialRoute: '/rxdart',
      initialRoute: '/bloc',
      routes: {
        //斜线表示路由的根（初始路由），当前的根表示home中显示的那个界面
        //如果不用这个home，可以屏蔽home，然后设置initialRoute
        // '/': (context) => NavigatorDemo(),
        '/': (context) => Home(),
        '/about': (context) => MyPage(title: "关于"),
        '/form': (context) => FormDemo(),
        '/mdc': (context) => MaterialComponents(),
        '/state-management': (context) => StateManagementDemo(),
        '/stream': (context) => StreamDemo(),
        '/rxdart': (context) => RxDartDemo(),
        '/bloc': (context) => BolcDemo(),
      },
      //界面跳转的学习-路由

      theme: ThemeData(
        primarySwatch: Colors.blue,
        //点击按钮的底色
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        //水波纹的颜色
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

//主要展示了AppBar，NavigationBar，TabBar的使用
class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //包含顶部按钮的布局
    // return Scaffold(
    //   backgroundColor: Colors.grey[600],
    //   appBar: AppBar(
    //     title: Text("你好"),
    //     leading: IconButton(
    //       icon: Icon(Icons.menu),
    //       tooltip: "Navigation",
    //       //打印日志操作
    //       onPressed: () => debugPrint("Navigation button is pressed"),
    //     ),
    //     //阴影属性
    //     elevation: 4.0,
    //     //可以设置一组小部件
    //     actions: [
    //       IconButton(
    //         icon: Icon(Icons.search),
    //         tooltip: "Search",
    //         //打印日志操作
    //         onPressed: () => debugPrint("Search button is pressed"),
    //       ),
    //       IconButton(
    //         icon: Icon(Icons.dashboard),
    //         tooltip: "Dashboard",
    //         //打印日志操作
    //         onPressed: () => debugPrint("Dashboard button is pressed"),
    //       )
    //     ],
    //   ),
    //   // body: Hello(),

    //   //以body的形式添加ListView
    //   // body: ListView.builder(
    //   //     itemCount: posts.length, itemBuilder: _listItemBuilder),

    //   //以部件的形式添加ListView
    //   // body: ListViewDemo(),

    //   body: null,
    // );

//三个TabLayout
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("你好"),
          // leading: IconButton(
          //   icon: Icon(Icons.menu),
          //   tooltip: "Navigation",
          //   //打印日志操作
          //   onPressed: () => debugPrint("Navigation button is pressed"),
          // ),
          //阴影属性
          elevation: 4.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: [
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike)),
              Tab(icon: Icon(Icons.view_agenda)),
              Tab(icon: Icon(Icons.directions_boat)),
            ],
          ),
          //可以设置一组小部件
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              tooltip: "Search",
              //打印日志操作
              onPressed: () => debugPrint("Search button is pressed"),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ListViewDemo(),
            // Icon(
            //   Icons.local_florist,
            //   size: 128.0,
            //   color: Colors.black12,
            // ),

            BasicDemo(),
            // Icon(
            //   Icons.change_history,
            //   size: 128.0,
            //   color: Colors.black12,
            // ),

            LayoutDemo(),
            // Icon(
            //   Icons.directions_bike,
            //   size: 128.0,
            //   color: Colors.black12,
            // ),

            ViewDemo(),

            SliverDemo(),
          ],
        ),
        //左边抽屉栏
        // drawer: Container(
        //   color: Colors.white,
        //   padding: EdgeInsets.all(8.0),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Text("第一个"),
        //       Text("第二个"),
        //       Text("第三个"),
        //     ],
        //   ),
        // ),
        //如果想显示右边抽屉栏
        // endDrawer: Text("这是一个右侧抽屉"),
        drawer: DrawerDemo(),
        bottomNavigationBar: BottomNavigationBar_Demo(),
      ),
    );
  }
}
