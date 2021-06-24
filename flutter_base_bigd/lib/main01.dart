import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//圆形或圆角图片，一种是把图片设置为Container的BoxDecoration的一部分来实现，一种是使用圆形或圆角图片组件来实现
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
          title: Text('ListTile'),
        ),
        body: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(8),
      children: [
        /***设置为scrollDirection: Axis.horizontal，要明确item的宽度***/
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   child: ListTile(
        //     leading: Image.asset('images/type_channellgs.png'),
        //     trailing: Icon(
        //       Icons.icecream,
        //       color: Colors.green,
        //       size: 42,
        //     ),
        //     title: Text(
        //       '1.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
        //       style: TextStyle(fontSize: 18, color: Colors.black),
        //     ),
        //     subtitle: Text(
        //       '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
        //       style: TextStyle(fontSize: 12, color: Colors.grey),
        //     ),
        //   ),
        // ),
        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   child: Container(
        //     decoration: BoxDecoration(color: Colors.limeAccent),
        //     padding: EdgeInsets.all(4),
        //     child: ListTile(
        //       leading: Image.asset('images/type_channellgs.png'),
        //       trailing: Image.asset('images/type_cruise.png'),
        //       title: Text(
        //         '8.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
        //         style: TextStyle(fontSize: 18, color: Colors.black),
        //       ),
        //       subtitle: Text(
        //         '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
        //         style: TextStyle(fontSize: 12, color: Colors.grey),
        //       ),
        //     ),
        //   ),
        // ),
        /***设置为scrollDirection: Axis.horizontal，要明确item的宽度***/

        ListTile(
          leading: Image.asset('images/type_channellgs.png'),
          trailing: Icon(
            Icons.icecream,
            color: Colors.green,
            size: 42,
          ),
          title: Text(
            '1.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          subtitle: Text(
            '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Image.asset('images/type_channellgs.png'),
          trailing: Icon(
            Icons.star,
            color: Colors.orange,
            size: 42,
          ),
          title: Text(
            '2.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          subtitle: Text(
            '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Container(
            width: 45,
            height: 45,
            //圆形图片
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF'),
              radius: 20,
            ),
          ),
          trailing: Container(
            width: 80,
            height: 50,
            child: Image.network(
              'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF',
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            '3.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          subtitle: Text(
            '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Image.asset('images/type_channellgs.png'),
          trailing: Image.asset('images/type_cruise.png'),
          title: Text(
            '4.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          subtitle: Text(
            '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Image.asset('images/type_channellgs.png'),
          trailing: Image.asset('images/type_cruise.png'),
          title: Text(
            '5.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          subtitle: Text(
            '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Image.asset('images/type_channellgs.png'),
          trailing: Image.asset('images/type_cruise.png'),
          title: Text(
            '6.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          subtitle: Text(
            '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        ListTile(
          leading: Image.asset('images/type_channellgs.png'),
          trailing: Image.asset('images/type_cruise.png'),
          title: Text(
            '7.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          subtitle: Text(
            '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.limeAccent),
          padding: EdgeInsets.all(4),
          child: ListTile(
            leading: Image.asset('images/type_channellgs.png'),
            trailing: Image.asset('images/type_cruise.png'),
            title: Text(
              '8.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            subtitle: Text(
              '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              image: DecorationImage(
                  image: NetworkImage(
                    'https://pics4.baidu.com/feed/d50735fae6cd7b89f35651d1465c92a1d9330e2c.jpeg?token=df1cd7bb57d491075a0cbc573199f3dc',
                  ),
                  alignment: Alignment.bottomRight)),
          width: MediaQuery.of(context).size.width,
          height: 120,

          //如果把一个Image作为child放在Container里，图片的边会覆盖住Container的圆角，使圆角无效，应该设置图片作为Container的Decoration的一部分
          // child: Image.network(
          //   'https://pics4.baidu.com/feed/d50735fae6cd7b89f35651d1465c92a1d9330e2c.jpeg?token=df1cd7bb57d491075a0cbc573199f3dc',
          //   fit: BoxFit.contain,
          //   colorBlendMode: BlendMode.screen,
          //   alignment: Alignment.bottomRight,
          //   // repeat: ImageRepeat.repeatX,
          // ),
        ),
        ListTile(
          //把一个container变为圆角
          leading: Container(
            width: 85,
            height: 55,
            //利用外层的Container显示圆形图片或圆角图片，把图片视为背景BoxDecoration的背景图
            //circular中的数值会转换为与长或宽的比，比如长40，circular是10，那么就从0-10的长度做圆角，如果circular是20，就是原形
            decoration: BoxDecoration(
              color: Colors.limeAccent,
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(
                    'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF'),
              fit: BoxFit.fitWidth),
            ),

            // child: CircleAvatar(
            //   backgroundImage: NetworkImage(
            //       'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF'),
            //   radius: 20,
            // ),
          ),

          //仅仅显示图片
          // trailing: Container(
          //   width: 80,
          //   height: 50,
          //   child: Image.network(
          //     'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF',
          //     fit: BoxFit.cover,
          //   ),
          // ),

          //ClipOval 如果 child 为正方形时剪裁之后是圆形，如果 child 为矩形时，剪裁之后为椭圆形
          //ClipRRect 可以直接将图片设置为圆角图片
          // trailing: ClipRRect(
          //   borderRadius: BorderRadius.circular(5),
          //   child: Image.network(
          //     'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF',
          //     width: 80,
          //     height: 80,
          //     fit: BoxFit.cover,
          //   ),
          // ),

          //这样的设置，对于某些长宽比例的图片，在某些数值设置下，会是椭圆形，不信这里长宽都改为80
          //可能是trailing属性对图片设置了最大长宽（貌似是55）从而影响内部组件的长宽设置，应该是对最大高度做了限制
          trailing:
            ClipOval(
              child: Image.network(
                'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF',
                width: 55,
                height: 55,
                fit: BoxFit.cover,
              ),
          ),

          title: Text(
            '9.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          subtitle: Text(
            '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
