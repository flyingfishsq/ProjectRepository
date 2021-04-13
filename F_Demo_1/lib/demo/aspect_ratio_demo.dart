import 'package:flutter/material.dart';

class AspectRatioDemo extends StatelessWidget {
  const AspectRatioDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        child: Container(
          color: Color.fromRGBO(3, 54, 255, 1.0),
        ),
        aspectRatio: 16.0 / 9.0);
  }
}
