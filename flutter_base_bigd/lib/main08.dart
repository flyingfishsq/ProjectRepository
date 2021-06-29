import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//StatefulWidget组件
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
          title: Text('Wrap组件'),
        ),
        body: HomeContent1(),
      ),
    );
  }
}

class HomeContent1 extends StatefulWidget {
  HomeContent1({Key key}) : super(key: key);

  @override
  _HomeContent1State createState() {
    return _HomeContent1State();
  }
}

class _HomeContent1State extends State<HomeContent1> {
  int countNum = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 200,),
        Chip(label: Text('${this.countNum}')),
        SizedBox(height: 20,),
        RaisedButton(child: Text('按钮'), onPressed: () {
          setState(() {
            this.countNum++;
          });
        }),
      ],
    );
  }
}
