import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

//不包含可以变化的状态（数据）
//这里定义了一个可变化的变量count，这个类报出了提示，在实际调试中，点击按钮，输出会有显示，但是控件中的count不会变化
// class StateManagementDemo extends StatelessWidget {
//   int count = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('StateManagementDemo'),
//       ),
//       body: Center(
//         child: Chip(
//           label: Text('$count'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           count += 1;
//           print(count);
//         },
//       ),
//     );
//   }
// }

//这个StatefulWidget本身也是不可改变的
//将要变化的数据，得放在State类里，且数据的变化一定要写在setState方法里，否则不起作用
// class StateManagementDemo extends StatefulWidget {
//   StateManagementDemo({Key key}) : super(key: key);

//   @override
//   _StateManagementDemoState createState() => _StateManagementDemoState();
// }

// class _StateManagementDemoState extends State<StateManagementDemo> {
//   int _count = 0;
//   void _increaseCount() {
//     setState(() {
//       _count += 1;
//     });
//     print(_count);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text('StateManagementDemo'),
//     //   ),
//     //   // body: Center(
//     //   //   child: Chip(
//     //   //     label: Text('$_count'),
//     //   //   ),
//     //   // ),

//     //   // body: Counter(_count, _increaseCount),

//     //   body: CountWrapper(_count, _increaseCount),

//     //   floatingActionButton: FloatingActionButton(
//     //     child: Icon(Icons.add),
//     //     // onPressed: () {
//     //     // setState(() {
//     //     //   _count += 1;
//     //     // });
//     //     // print(_count);
//     //     // },
//     //     onPressed: _increaseCount,
//     //   ),
//     // );

//     return CounterProvider(
//       count: _count,
//       increaseCount: _increaseCount,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('StateManagementDemo'),
//         ),
//         // body: Center(
//         //   child: Chip(
//         //     label: Text('$_count'),
//         //   ),
//         // ),

//         // body: Counter(_count, _increaseCount),

//         body: CountWrapper(),

//         floatingActionButton: FloatingActionButton(
//           child: Icon(Icons.add),
//           // onPressed: () {
//           // setState(() {
//           //   _count += 1;
//           // });
//           // print(_count);
//           // },
//           onPressed: _increaseCount,
//         ),
//       ),
//     );
//   }
// }

//使用ScopedModel将小部件改造成一个StatelessWidget
class StateManagementDemo extends StatelessWidget {
  const StateManagementDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
        ),
        // body: Center(
        //   child: Chip(
        //     label: Text('$_count'),
        //   ),
        // ),

        // body: Counter(_count, _increaseCount),

        body: CountWrapper(),

        floatingActionButton: ScopedModelDescendant<CounterModel>(
          //是否需要重建FloatingActionButton小部件
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
            child: Icon(Icons.add),
            // onPressed: () {
            // setState(() {
            //   _count += 1;
            // });
            // print(_count);
            // },
            onPressed: model.increaseCount,
          ),
        ),
      ),
    );
  }
}

//使用InheritedWidget改造
class CountWrapper extends StatelessWidget {
  // final int count;
  // final VoidCallback increaseCount;

  // CountWrapper(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    return Center(
      // child: Counter(count, increaseCount),
      child: Counter(),
    );
  }
}

//状态管理，由父类管理状态，不理解这个所谓的继承关系在哪
//使用InheritedWidget改造
class Counter extends StatelessWidget {
  // final int count;
  // final VoidCallback increaseCount;

  // Counter(this.count, this.increaseCount);

  @override
  Widget build(BuildContext context) {
    // //在需要使用的地方去定义
    // final int count = CounterProvider.of(context).count;
    // final VoidCallback increaseCount =
    //     CounterProvider.of(context).increaseCount;

    // return ActionChip(
    //   label: Text('$count'),
    //   //从父辈那里传递个回调
    //   onPressed: increaseCount,
    // );

    //使用ScopedModel时，对Counter的改写

    return ScopedModelDescendant<CounterModel>(
        builder: (context, _, model) => ActionChip(
            label: Text('${model.count}'), onPressed: model.increaseCount));
  }
}

//不通过层层赋值来将数据传递给子类对象，可以使用InheritedWidget
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increaseCount;

  final Widget child;

  CounterProvider(
      {Key key,
      @required this.count,
      @required this.increaseCount,
      @required this.child})
      : super(key: key, child: child);

  static CounterProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

//使用ScopedModel实现数据的传递
//使用这个model的小部件会监听model的变化，执行到notifyListeners时小部件会重建
class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
