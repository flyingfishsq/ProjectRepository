import 'package:flutter/material.dart';

class ConstrainedBoxDemo extends StatelessWidget {
  const ConstrainedBoxDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        child: (Container(
          color: Color.fromRGBO(215, 55, 55, 1.0),
        )),
        constraints: BoxConstraints(
          minHeight: 200.0,
          maxWidth: 200.0,
        ));
  }
}
