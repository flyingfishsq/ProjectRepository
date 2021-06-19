import 'package:F_Demo_1/model/post.dart';
import 'package:flutter/material.dart';

class CardDemo extends StatefulWidget {
  CardDemo({Key key}) : super(key: key);

  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((e) {
            return Card(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    //设置圆角
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0)),
                      child: Image.network(
                        e.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(e.imageUrl),
                    ),
                    title: Text(e.title),
                    subtitle: Text(e.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      e.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ButtonBarTheme(
                    data: ButtonBarThemeData(
                        buttonTextTheme: ButtonTextTheme.accent),
                    child: ButtonBar(
                      children: [
                        FlatButton(
                            onPressed: () {},
                            child: Text('Like'.toUpperCase())),
                        FlatButton(
                            onPressed: () {},
                            child: Text('Read'.toUpperCase())),
                      ],
                    ),
                  ),
                  // ButtonTheme.bar(
                  //   child: ButtonBar(
                  //     children: [
                  //       FlatButton(
                  //           onPressed: () {},
                  //           child: Text('Like'.toUpperCase())),
                  //       FlatButton(
                  //           onPressed: () {},
                  //           child: Text('Read'.toUpperCase())),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
