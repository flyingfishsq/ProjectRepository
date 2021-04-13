import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  const CounterHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBLoC _counterBLoC = CounterProvider.of(context)!.bloc;

    return Center(
      // child: ActionChip(
      //   label: Text('0'),
      //   onPressed: () {
      //     // _counterBLoC.log();
      //     _counterBLoC.counter.add(1);
      //   },
      // ),

      child: StreamBuilder(
        initialData: 0,
        stream: _counterBLoC.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: () {
              // _counterBLoC.log();
              _counterBLoC.counter.add(1);
            },
          );
        },
      ),
    );
  }
}

//在BLoC中需要创建sink和stream，即数据流的入口和出口
class CounterActionButton extends StatelessWidget {
  const CounterActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBLoC _counterBLoC = CounterProvider.of(context)!.bloc;

    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // _counterBLoC.log();
        _counterBLoC.counter.add(1);
      },
    );
  }
}

//使用InheritedWiget把这个BLoC传递给小部件使用
class CounterBLoC {
  int _count = 0;

  final _counterController = StreamController<int>();

  Stream<int> get count => _counterController.stream;

  CounterBLoC() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');
    _count = data + _count;
    _counterController.add(_count);
  }

  void dispose() {
    _counterActionController.close();
    _counterController.close();
  }

  final _counterActionController = StreamController<int>();

  StreamSink<int> get counter => _counterActionController.sink;

  void log() {
    print('BLoC');
  }
}

class CounterProvider extends InheritedWidget {
  final Widget child;
  final CounterBLoC bloc;

  CounterProvider({Key? key, required this.child, required this.bloc})
      : super(key: key, child: child);

  static CounterProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}
