import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpDemo extends StatelessWidget {
  const HttpDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  HttpDemoHome({Key key}) : super(key: key);

  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    //讲解1
    // fetchPosts();

    //讲解2
    // final post = {
    //   'title': 'hello',
    //   'description': 'nice to meet you',
    // };

    // //使用这个语句获取map中指定key所对应的value
    // print(post['title']);
    // print(post['description']);

    // //把map转换成json对象
    // final postJson = json.encode(post);
    // print(postJson);

    // //解析从服务端拿到的json对象，转换成map，然后根据map的key获取value
    // final postJsonConverted = json.decode(postJson);
    // print(postJsonConverted['title']);
    // print(postJsonConverted['description']);

    // //检查获取的对象是否是map数据，这个语法用来判断某个对象是否是某个类的实例
    // print(postJsonConverted is Map);

    // final postModel = Post.fromJson(postJsonConverted);
    // print('title:${postModel.title},discription:${postModel.description}');

    // //encode方法会自动调用toJson方法，不需要显式调用
    // print('${json.encode(postModel)}');

    //讲解3
    // fetchPosts().then((value) => print(value));

    //讲解4
  }

  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');

    // print('statusCode : ${response.statusCode}');
    // print('body : ${response.body}');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();

      return posts;
    } else {
      throw Exception('Failed to fetch posts.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchPosts(),
      builder: (context, snapshot) {
        //执行时会发现第一次打印是null，因为snapshot是个Future数据，异步执行
        print('data: ${snapshot.data}');
        print('connectionState: ${snapshot.connectionState}');

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text('loading...'),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text(
                  item.title,
                ),
                subtitle: Text(
                  item.author,
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    item.imageUrl,
                  ),
                ),
              );
            }).toList(),
          );
        } else {
          return Center(
            child: Text('error...'),
          );
        }
      },
    );
  }
}

class Post {
  int id;
  final String title;
  final String author;
  final String imageUrl;
  final String description;

//注意构造方法的定义
  Post(
      {@required this.id,
      @required this.title,
      @required this.author,
      @required this.imageUrl,
      @required this.description});

  bool selected = false;

//使用Model类解析json
  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  //将Model类转换成json
  Map toJson() => {
        'id': id,
        'title': title,
        'author': author,
        'description': description,
        'imageUrl': imageUrl
      };
}
