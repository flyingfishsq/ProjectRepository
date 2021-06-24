import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'res/listData.dart';

//动态列表以及循环列表
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
          title: Text('ListView'),
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
    // return ListView(
    //   children: _getData(),
    // );

    return ListView.builder(
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              child: Image.network(
                listData[index]['imageUrl'],
                fit: BoxFit.cover,
              ),
              width: 100,
            ),
            title: Text(listData[index]['title']),
            subtitle: Text(
              listData[index]['author'],
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          );
        });
  }
}
