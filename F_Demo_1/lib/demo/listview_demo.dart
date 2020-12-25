import 'package:F_Demo_1/demo/post_show.dart';
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
      child: Stack(
        children: [
          Column(
            children: [
              // Image.network(posts[index].imageUrl),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  posts[index].imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
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
              // Text(
              //   posts[index].description,
              //   style: Theme.of(context).textTheme.subtitle2,
              // ),
            ],
          ),
          //设置item点击时候的溅墨效果
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PostShow(post: posts[index])));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
