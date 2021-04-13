import 'package:flutter/material.dart';

class ThemeDemo extends StatelessWidget {
  const ThemeDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}
