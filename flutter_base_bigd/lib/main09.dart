import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/tabs/Tabs.dart';

//BottomNavigationBar组件
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Tabs(),
    );
  }
}


