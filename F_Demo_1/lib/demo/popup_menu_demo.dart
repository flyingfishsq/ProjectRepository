import 'package:flutter/material.dart';

class PopupMenuDemo extends StatefulWidget {
  PopupMenuDemo({Key? key}) : super(key: key);

  @override
  _PopupMenuDemoState createState() => _PopupMenuDemoState();
}

class _PopupMenuDemoState extends State<PopupMenuDemo> {
  String _currentMenuItem = 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_currentMenuItem),
                PopupMenuButton(
                    onSelected: (value) {
                      print(value);
                      setState(() {
                        _currentMenuItem = value;
                      });
                    },
                    itemBuilder: (BuildContext context) => [
                          PopupMenuItem(value: 'Home', child: Text('Home')),
                          PopupMenuItem(
                              value: 'Discover', child: Text('Discover')),
                          PopupMenuItem(
                              value: 'Community', child: Text('Community')),
                        ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
