import 'package:F_Demo_1/demo/bottom_navigation_bar_demo.dart';
import 'package:F_Demo_1/demo/drawer_demo.dart';
import 'package:F_Demo_1/demo/layout_demo.dart';
import 'package:F_Demo_1/demo/listview_demo.dart';
import 'package:F_Demo_1/demo/basic_demo.dart';
import 'package:flutter/material.dart';

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
      home: Home(),
      theme: ThemeData(
          primarySwatch: Colors.blue,
          //点击按钮的底色
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          //水波纹的颜色
          splashColor: Colors.white70),
    );
  }
}

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
      length: 3,
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
