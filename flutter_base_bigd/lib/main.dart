import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(8),
      children: [

        /***设置为scrollDirection: Axis.horizontal，要明确item的宽度***/
        Container(
          width: MediaQuery.of(context).size.width,
          child: ListTile(
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
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: ListTile(
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
        ),
        /***设置为scrollDirection: Axis.horizontal，要明确item的宽度***/

        // ListTile(
        //   leading: Image.asset('images/type_channellgs.png'),
        //   trailing: Icon(
        //     Icons.icecream,
        //     color: Colors.green,
        //     size: 42,
        //   ),
        //   title: Text(
        //     '1.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
        //     style: TextStyle(fontSize: 18, color: Colors.black),
        //   ),
        //   subtitle: Text(
        //     '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
        //     style: TextStyle(fontSize: 12, color: Colors.grey),
        //   ),
        // ),
        // ListTile(
        //   leading: Image.asset('images/type_channellgs.png'),
        //   trailing: Icon(
        //     Icons.star,
        //     color: Colors.orange,
        //     size: 42,
        //   ),
        //   title: Text(
        //     '2.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
        //     style: TextStyle(fontSize: 18, color: Colors.black),
        //   ),
        //   subtitle: Text(
        //     '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
        //     style: TextStyle(fontSize: 12, color: Colors.grey),
        //   ),
        // ),
        // ListTile(
        //   leading: Container(
        //     width: 45,
        //     height: 45,
        //     child: CircleAvatar(
        //       backgroundImage: NetworkImage(
        //           'https://t7.baidu.com/it/u=1595072465,3644073269&fm=193&f=GIF'),
        //       radius: 20,
        //     ),
        //   ),
        //   trailing: Container(
        //     width: 80,
        //     height: 50,
        //     child: Image.network(
        //       'https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF',
        //       fit: BoxFit.cover,
        //     ),
        //   ),
        //   title: Text(
        //     '3.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
        //     style: TextStyle(fontSize: 18, color: Colors.black),
        //   ),
        //   subtitle: Text(
        //     '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
        //     style: TextStyle(fontSize: 12, color: Colors.grey),
        //   ),
        // ),
        // ListTile(
        //   leading: Image.asset('images/type_channellgs.png'),
        //   trailing: Image.asset('images/type_cruise.png'),
        //   title: Text(
        //     '4.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
        //     style: TextStyle(fontSize: 18, color: Colors.black),
        //   ),
        //   subtitle: Text(
        //     '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
        //     style: TextStyle(fontSize: 12, color: Colors.grey),
        //   ),
        // ),
        // ListTile(
        //   leading: Image.asset('images/type_channellgs.png'),
        //   trailing: Image.asset('images/type_cruise.png'),
        //   title: Text(
        //     '5.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
        //     style: TextStyle(fontSize: 18, color: Colors.black),
        //   ),
        //   subtitle: Text(
        //     '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
        //     style: TextStyle(fontSize: 12, color: Colors.grey),
        //   ),
        // ),
        // ListTile(
        //   leading: Image.asset('images/type_channellgs.png'),
        //   trailing: Image.asset('images/type_cruise.png'),
        //   title: Text(
        //     '6.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
        //     style: TextStyle(fontSize: 18, color: Colors.black),
        //   ),
        //   subtitle: Text(
        //     '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
        //     style: TextStyle(fontSize: 12, color: Colors.grey),
        //   ),
        // ),
        // ListTile(
        //   leading: Image.asset('images/type_channellgs.png'),
        //   trailing: Image.asset('images/type_cruise.png'),
        //   title: Text(
        //     '7.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
        //     style: TextStyle(fontSize: 18, color: Colors.black),
        //   ),
        //   subtitle: Text(
        //     '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
        //     style: TextStyle(fontSize: 12, color: Colors.grey),
        //   ),
        // ),
        // Container(
        //   decoration: BoxDecoration(color: Colors.limeAccent),
        //   padding: EdgeInsets.all(4),
        //   child: ListTile(
        //     leading: Image.asset('images/type_channellgs.png'),
        //     trailing: Image.asset('images/type_cruise.png'),
        //     title: Text(
        //       '8.华南强降雨持续“发力” 华北东北雷阵雨勤“打卡”',
        //       style: TextStyle(fontSize: 18, color: Colors.black),
        //     ),
        //     subtitle: Text(
        //       '预计今明两天，江南、华南等地仍将有较强降水，尤其是广东南部、云南东部等地局地或有大暴雨现身，并伴有强对流天气。此外，受弱冷空气影响，华北、东北等地多阵雨或雷阵雨。',
        //       style: TextStyle(fontSize: 12, color: Colors.grey),
        //     ),
        //   ),
        // ),
        // Container(
        //   margin: EdgeInsets.all(4),
        //   decoration: BoxDecoration(
        //       color: Colors.orange,
        //       borderRadius: BorderRadius.all(Radius.circular(10))),
        //   width: MediaQuery.of(context).size.width,
        //   height: 120,
        //   child: Image.network(
        //     'https://pics4.baidu.com/feed/d50735fae6cd7b89f35651d1465c92a1d9330e2c.jpeg?token=df1cd7bb57d491075a0cbc573199f3dc',
        //     fit: BoxFit.contain,
        //   ),
        // ),
      ],
    );
  }
}
