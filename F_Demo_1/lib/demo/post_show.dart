import 'package:flutter/material.dart';
import 'package:F_Demo_1/model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;

  const PostShow({required this.post, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
        elevation: 0.5,
      ),
      body: Center(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Image.network(post.imageUrl),
                  Container(
                    //内边距
                    padding: EdgeInsets.all(32.0),
                    //这个值表示占满容器所有可用的宽度
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${post.title}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Text(
                          '${post.author}',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        SizedBox(
                          height: 32.0,
                        ),
                        Text(
                          '${post.description}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            )
          ],
        ),

//这个必须放在ScrollView里，不然超出显示范围会报错
        // children: [
        //   Image.network(post.imageUrl),
        //   Container(
        //     //内边距
        //     padding: EdgeInsets.all(32.0),
        //     //这个值表示占满容器所有可用的宽度
        //     width: double.infinity,
        //     child: Column(
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         Text(
        //           '${post.title}',
        //           style: Theme.of(context).textTheme.subtitle1,
        //         ),
        //         Text(
        //           '${post.author}',
        //           style: Theme.of(context).textTheme.subtitle2,
        //         ),
        //         SizedBox(
        //           height: 32.0,
        //         ),
        //         Text(
        //           '${post.description}',
        //           style: Theme.of(context).textTheme.bodyText1,
        //         ),
        //       ],
        //     ),
        //   )
        // ],
      ),
      // Column(
      //   children: [
      //     Image.network(post.imageUrl),
      //     Container(
      //       //内边距
      //       padding: EdgeInsets.all(32.0),
      //       //这个值表示占满容器所有可用的宽度
      //       width: double.infinity,
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Text(
      //             '${post.title}',
      //             style: Theme.of(context).textTheme.subtitle1,
      //           ),
      //           Text(
      //             '${post.author}',
      //             style: Theme.of(context).textTheme.subtitle2,
      //           ),
      //           SizedBox(
      //             height: 32.0,
      //           ),
      //           Text(
      //             '${post.description}',
      //             style: Theme.of(context).textTheme.bodyText1,
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
