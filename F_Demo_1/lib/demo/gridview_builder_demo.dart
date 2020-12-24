import 'package:flutter/material.dart';
import 'package:F_Demo_1/model/post.dart';

class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({Key key}) : super(key: key);

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(posts[index].imageUrl, fit: BoxFit.fill),
    );
  }

  @override
  Widget build(BuildContext context) {
    //gridDelegate表示控制item的显示
    return GridView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: posts.length,
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 120.0,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0),
        itemBuilder: _gridItemBuilder);
  }
}
