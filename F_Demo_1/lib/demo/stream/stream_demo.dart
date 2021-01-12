import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  const StreamDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  StreamDemoHome({Key key}) : super(key: key);

  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;

//用来管理Stream
  StreamController<String> _streamController;

//StreamController不使用的时候要关掉
  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    print('Create a stream.');

    //使用StreamController
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamController = StreamController<String>();

    print('Start listening on a stream.');
    //观察者模式，等待主题传来数据，这个方法返回的就是一个subscription，可以用来暂停，恢复，取消监听（取消订阅）
    // _streamSubscription = _streamDemo.listen(
    //   onData,
    //   onError: onError,
    //   onDone: onDone,
    // );

//使用StreamController
    _streamSubscription = _streamController.stream
        .listen(onData, onError: onError, onDone: onDone);

    print('Initialize completed.');
  }

  void onData(String data) {
    print('$data');
  }

  void onError(error) {
    print('Error: $error');
  }

  void onDone() {
    print('Done!');
  }

  void _pauseStream() {
    print('Pause subscription!');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('Resume subscription!');
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print('Cancel subscription!');
    _streamSubscription.cancel();
  }

  void _addStream() async {
    print('add data to stream...');

    String data = await fetchData();
    _streamController.add(data);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
//测试发送异常在接受端的响应情况
    // throw 'Something wrong happend';
    return 'hello ~';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
              onPressed: _pauseStream,
              child: Text('Pause'),
            ),
            FlatButton(
              onPressed: _resumeStream,
              child: Text('Resume'),
            ),
            FlatButton(
              onPressed: _cancelStream,
              child: Text('Cancel'),
            ),
            FlatButton(
              onPressed: _addStream,
              child: Text('add'),
            ),
          ],
        ),
      ),
    );
  }
}
