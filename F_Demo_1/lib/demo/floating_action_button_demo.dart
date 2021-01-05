import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  //不带标签文字的悬浮按钮
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.5,
    backgroundColor: Colors.black54,
    // shape: BeveledRectangleBorder(
    //   //这里面的参数值控制边角即按钮形状（尝试下5.0，10.0，30.0）
    //   borderRadius: BorderRadius.circular(10.0),
    // ),
    //不加这个属性设置，默认按钮就是圆形的
    shape: CircleBorder(),
  );

//带有标签文字的悬浮按钮
  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text('添加'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FloatingActionButtonDemo',
        ),
        elevation: 0.5,
      ),
      floatingActionButton: _floatingActionButton,
      // floatingActionButton: _floatingActionButtonExtended,

      // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //设置底部工具栏
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 60.0,
        ),
        //在按钮的位置切出一个圆形的边
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}
