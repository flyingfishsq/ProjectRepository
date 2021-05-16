import 'package:flutter/material.dart';
import 'package:F_Demo_1/model/post.dart';

class PageViewBuilderDemo extends StatelessWidget {
  const PageViewBuilderDemo({Key key}) : super(key: key);

  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: [
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
      //控制PageView上的页面
      controller: PageController(
          //initialPage表示切换到这个PageView的时候，首次显示是第几个页面
          initialPage: 0,
          //keepPage默认为true表示会记住用户上次滚动到的是哪个页面
          keepPage: false,
          //页面占用可视界面的比例，默认是1
          viewportFraction: 1.0),
    );
  }
}
