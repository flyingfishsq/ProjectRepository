import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'res/listData.dart';

//GridView的示例，count实现的是静态布局，builder实现的是动态布局
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GridView'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  List<Widget> _getData() {
    //把列表中的每个数据映射为一个组件，再集中为一个集合
    var tileList = listData.map((e) {
      return Container(
        decoration: BoxDecoration(
          //Border就是边框线
          border:
              Border.all(color: Color.fromRGBO(225, 225, 225, 0.8), width: 2),
          color: Colors.lightGreenAccent,
        ),
        //GridView里嵌套ListView作为item，替代Column的作用
        // child: ListView(
        //   children: [
        //     Container(
        //       child: Image.network(
        //         e['imageUrl'],
        //         fit: BoxFit.fill,
        //       ),
        //     ),
        //     Container(
        //       child: Text(e['title']),
        //       height: 20,
        //     ),
        //     Container(
        //       child: Text(
        //         e['author'],
        //         style: TextStyle(fontSize: 12, color: Colors.grey),
        //       ),
        //       height: 20,
        //     ),
        //   ],
        // ),

        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              child: Image.network(
                e['imageUrl'],
                fit: BoxFit.fill,
              ),
            ),
            //SizedBox可以当一个空白框来用，以达到类似设置padding的效果
            SizedBox(
              height: 4,
            ),
            Container(
              child: Text(e['title']),
            ),
            Container(
              child: Text(
                e['author'],
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      );
    }).toList();

    return tileList;
  }

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: ClipOval(
    //     child: Image.network(
    //       'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF',
    //       width: 300,
    //       height: 300,
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    // );

    //注意，垂直方向上滑动的gridview，宽是定值，水平方向上滑动的gridview，高是定值
    // return GridView.count(
    //   //设置为1就成了ListView
    //   scrollDirection: Axis.horizontal,
    //   crossAxisSpacing: 4,
    //   mainAxisSpacing: 4,
    //   //设置item的宽高是无效的，应该设置长宽比
    //   // childAspectRatio: 0.9,
    //   //设置当前GridView整体的padding，不是单个item的padding
    //   padding: EdgeInsets.all(8),
    //   crossAxisCount: 3,
    //   children: _getData(),
    // );

    return GridView.builder(
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //设置为1就成了ListView
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
          //设置item的宽高是无效的，应该设置长宽比
          // childAspectRatio: 0.9,
          //设置当前GridView整体的padding，不是单个item的padding
          crossAxisCount: 3,
        ),
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              //Border就是边框线
              border: Border.all(
                  color: Color.fromRGBO(225, 225, 225, 0.8), width: 2),
              color: Colors.lightGreenAccent,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(4),
                  child: Image.network(
                    listData[index]['imageUrl'],
                    fit: BoxFit.fill,
                  ),
                ),
                //SizedBox可以当一个空白框来用，以达到类似设置padding的效果
                SizedBox(
                  height: 4,
                ),
                Container(
                  child: Text(listData[index]['title']),
                ),
                Container(
                  child: Text(
                    listData[index]['author'],
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
