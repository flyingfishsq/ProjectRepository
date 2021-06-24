import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'res/listData.dart';

//GridView的示例
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {

  List<Widget> _getData() {
    //把列表中的每个数据映射为一个组件，再集中为一个集合
    var tileList = listData.map((e) {
      return Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(color: Colors.lightBlueAccent),
        height: 80,
        child: ListTile(
          leading: Container(
            child: Image.network(
              e['imageUrl'],
              fit: BoxFit.fill,
            ),
            width: 120,
          ),
          title: Text(e['title']),
          subtitle: Text(
            e['author'],
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      );
    }).toList();

    return tileList;
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: ClipOval(
    //     child: Image.network(
    //       'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF',
    //       width: 300,
    //       height: 300,
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // );

    return GridView.count(
      //设置为1就成了ListView
      scrollDirection: Axis.horizontal,
      crossAxisCount: 3,
      children: _getData(),
    );
  }
}
