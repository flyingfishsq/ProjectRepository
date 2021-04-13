import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  const RxDartDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  RxDartDemoHome({Key? key}) : super(key: key);

  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  late PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();

    // Observable<String> _observable =
    //     //Observable(Stream.fromIterable([
    //     //   'h',
    //     //   'e',
    //     //   'l',
    //     //   'l',
    //     //   'o',
    //     //   '~',
    //     //   '\n',
    //     //   ' ',
    //     //   'Hello',
    //     //   '您好',
    //     // ]));

    //     // = Observable.fromFuture(Future.value(
    //     //   'Future 您好',
    //     // ));

    //     // Observable.fromIterable(['Hello', 'nin hao']);

    //     //     Observable.just(
    //     //   'Hello',
    //     // );

    //     Observable.periodic(Duration(seconds: 3), (x) => x.toString());
    // _observable.listen(print);

    //Subject的学习，实际是Observable的子类
    //分析下这里的执行结果，每次执行add，在已经订阅的观察者中，会接收通知，执行数据改变后的结果打印
    // PublishSubject<String> _subject = PublishSubject<String>();
    // _subject.add('你好');
    // _subject.listen((data) => print('Listen 1: $data'));
    // _subject.listen((data) => print('Listen 2: ${data.toUpperCase()}'));
    // _subject.add('这是一个Subject');
    // _subject.listen((data) => print('Listen 3: ${data.toLowerCase()}'));
    // _subject.add('你好');
    // _subject.close();

    //BehaviorSubject的学习
    //分析下这里的执行结果，add与listen的相对顺序不影响结果
    // BehaviorSubject<String> _subject = BehaviorSubject<String>();
    // _subject.add('你好,nihao');
    // _subject.listen((data) => print('Listen 1: $data'));
    // _subject.listen((data) => print('Listen 2: ${data.toUpperCase()}'));
    // _subject.add('这是一个Subject');
    // _subject.listen((data) => print('Listen 3: ${data.toLowerCase()}'));
    // _subject.add('你好');
    // _subject.close();

    //ReplaySubject的学习
    // ReplaySubject<String> _subject = ReplaySubject<String>();
    // _subject.add('你好,nihao');
    // _subject.listen((data) => print('Listen 1: $data'));
    // _subject.listen((data) => print('Listen 2: ${data.toUpperCase()}'));
    // _subject.add('这是一个Subject');
    // _subject.listen((data) => print('Listen 3: ${data.toLowerCase()}'));
    // _subject.add('你好');
    // _subject.close();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
        .map(
          (item) => 'item: $item',
        )
        //where就相当是一个判定条件，这里表示长度大于16的字符串才会被传递
        .where(
          (event) => event.length > 16,
        )
        //输入间隔大于500的字符串才会响应
        .debounce(
          Duration(milliseconds: 500),
        )
        .listen(
          (data) => print(data),
        );
  }

  @override
  void dispose() {
    _textFieldSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(primaryColor: Colors.black),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submitted: $value');
        },
        decoration: InputDecoration(labelText: 'Title', filled: true),
      ),
    );
  }
}
