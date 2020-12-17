import 'package:flutter/material.dart';
import '../model/post.dart'; //上一级的文件目录

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: posts.length, itemBuilder: _listItemBuilder);
  }

  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(posts[index].imageUrl),
          SizedBox(
            height: 16.0,
          ),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.caption,
          ),
          Text(
            posts[index].description,
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ],
      ),
    );
  }
}
