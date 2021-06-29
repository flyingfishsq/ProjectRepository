import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'res/listData.dart';

//AspectRatio可以调节控件宽高比
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AspectRatio，Card组件'),
        ),
        body: HomeContent4(),
      ),
    );
  }
}

class HomeContent1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Container设置了控件的定长定宽
    return Container(
      color: Colors.lightGreenAccent,
      width: 300,
      child: AspectRatio(
        aspectRatio: 2.0 / 1.0,
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}

//Card具有圆角和阴影，让它看起来有立体感
class HomeContent2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '张三',
                  style: TextStyle(fontSize: 24),
                ),
                subtitle: Text('高级软件工程师'),
              ),
              Container(
                height: 0.1,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              ListTile(
                title: Text(
                  '电话：123456',
                ),
              ),
              Container(
                height: 0.1,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              ListTile(
                title: Text(
                  '地址：北京市崇文区',
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '李四',
                  style: TextStyle(fontSize: 24),
                ),
                subtitle: Text('中级软件工程师'),
              ),
              Container(
                height: 0.1,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              ListTile(
                title: Text(
                  '电话：456789',
                ),
              ),
              Container(
                height: 0.1,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              ListTile(
                title: Text(
                  '地址：北京市宣武区',
                ),
              ),
            ],
          ),
        ),
        Card(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  '王五',
                  style: TextStyle(fontSize: 24),
                ),
                subtitle: Text('高级软件架构师'),
              ),
              Container(
                height: 0.1,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              ListTile(
                title: Text(
                  '电话：135791',
                ),
              ),
              Container(
                height: 0.1,
                decoration: BoxDecoration(color: Colors.grey),
              ),
              ListTile(
                title: Text(
                  '地址：北京市海淀区',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeContent3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF',
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(
                  '电话：123456',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                leading: ClipOval(
                  child: Image.network(
                    'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF',
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                subtitle: Text(
                  '地址：北京市昌平区',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class HomeContent4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: listData.map((value) {
        return Card(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  value['imageUrl'],
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(
                  value['title'],
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                leading: ClipOval(
                  child: Image.network(
                    value['imageUrl'],
                    width: 55,
                    height: 55,
                    fit: BoxFit.cover,
                  ),
                ),
                subtitle: Text(
                  value['author'],
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
