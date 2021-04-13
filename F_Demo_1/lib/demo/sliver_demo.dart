import 'package:F_Demo_1/model/post.dart';
import 'package:flutter/material.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //SliverAppBar与AppBar差不多，但是功能更多，类似于原生中的AppBar和ToolBar等
          SliverAppBar(
              backgroundColor: Colors.green[800],
              centerTitle: true,
              title: Text(
                'Sliver Learning',
                style: TextStyle(fontSize: 28.0, color: Colors.grey),
              ),
              //SliverAppBar固定在顶部
              // pinned: true,
              //任何时候下拉，都会显示AppBar，而不是总是吸附在顶部直到第一个item显示出来
              floating: true,
              //设置拉伸的高度
              expandedHeight: 180.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'FlexibleSpaceBar',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black26,
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.w400),
                ),
                // background: Image.network(
                //     'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fdik.img.kttpdq.com%2Fpic%2F26%2F17938%2Fd1d0f1aa2717697d_1680x1050.jpg&refer=http%3A%2F%2Fdik.img.kttpdq.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1611387130&t=54b9c73bb8eb4491027aea5184fe07c8',
                //     fit: BoxFit.cover),
                background:
                    Image.asset('assets/images/bg.jpg', fit: BoxFit.cover),
              )),

          // SliverGridDemo(),

          //SliverGrid不能设置padding，使用SliverPadding这个控件来设置间隔
          // SliverPadding(
          //   padding: EdgeInsets.all(8.0),
          //   sliver: SliverGridDemo(),
          // ),

          //让界面显示在正常区域，也就是不浮动到刘海屏的标题栏
          SliverSafeArea(
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              // sliver: SliverGridDemo(),
              sliver: SliverListDemo(),
            ),
          ),
        ],
      ),
    );
  }
}

class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SliverGrid与GridView差不多
    return SliverGrid(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Container(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        );
      }, childCount: posts.length),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        //控制item的显示比例
        childAspectRatio: 0.8,
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  const SliverListDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SliverList与ListView差不多
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Material(
              borderRadius: BorderRadius.circular(16.0),
              elevation: 16.0,
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Stack(children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    posts[index].imageUrl,
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        posts[index].title,
                        style: TextStyle(fontSize: 20.0, color: Colors.black87),
                      ),
                      Text(
                        posts[index].author,
                        style: TextStyle(fontSize: 12.0, color: Colors.black45),
                      ),
                    ],
                  ),
                )
              ])),
        );
      }, childCount: posts.length),
    );
  }
}
