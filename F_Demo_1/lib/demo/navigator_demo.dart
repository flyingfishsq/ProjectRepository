import 'package:flutter/material.dart';

class NavigatorDemo extends StatelessWidget {
  const NavigatorDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(onPressed: null, child: Text('Home')),
            FlatButton(
                // onPressed: () {
                //   Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (BuildContext context) => MyPage(
                //         title: '关于',
                //       ),
                //     ),
                //   );
                // },
                //使用名字去控制页面的启动
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/about',
                  );
                },
                child: Text('About')),
          ],
        ),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final String title;
  const MyPage({@required this.title, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.5,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
