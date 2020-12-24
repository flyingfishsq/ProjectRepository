import 'package:flutter/material.dart';

class GridViewExtendDemo extends StatelessWidget {
  const GridViewExtendDemo({Key key}) : super(key: key);

  //使用方法快速创建item
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (index) {
      return Container(
        // margin: EdgeInsets.all(8.0),
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          'Item $index',
          style: TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    //使用GridView.extent生成网格视图，GridView默认是纵向排列，主轴是垂直的
    return GridView.extent(
      //把GridView设置成横向排列，主轴是水平的
      //注意maxCrossAxisExtent的含义，item在交叉轴上的最大尺寸
      maxCrossAxisExtent: 80.0,
      scrollDirection: Axis.vertical,
      //为所有的item统一设置间隔，而不需要在单个item中设置margin，
      //但这个不能对贴边的空白设置margin，还需要添加padding: EdgeInsets.all，设置整个GridView的边距间隔
      mainAxisSpacing: 16.0,
      crossAxisSpacing: 16.0,
      padding: EdgeInsets.all(16.0),
      children: _buildTiles(100),
    );
  }
}
