import 'package:flutter/material.dart';

class Hello extends StatelessWidget {
  const Hello({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("hello world",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.amberAccent)),
    );
  }
}
