import 'package:flutter/material.dart';

class MaterialComponents extends StatelessWidget {
  const MaterialComponents({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Components'),
        elevation: 0.5,
      ),
      body: ListView(
        children: [
          ListItem(
            title: 'floatingActionButton',
            page: FloatingActionButtonDemo(),
          ),
          ListItem(
            title: 'Button',
            page: ButtonDemo(),
          ),
          ListItem(
            title: 'Weiget',
            page: WeidgetDemo(),
          ),
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  const ListItem({this.title, this.page, key}) : super(key: key);

  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}

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

//带有标签文字的炫富按钮
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

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text('FlatButton'),
          //渐墨的效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        // SizedBox(
        //   width: 8.0,
        // ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          onPressed: () {},
          label: Text('FlatButton'),
          //渐墨的效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        //超距会报错
        SizedBox(
          width: 8.0,
        ),
        // RaisedButton.icon(
        //   icon: Icon(Icons.add),
        //   onPressed: () {},
        //   label: Text('RaisedButton'),
        //   //渐墨的效果
        //   splashColor: Colors.white,
        //   color: Colors.pinkAccent,
        //   elevation: 8.0,
        //   textColor: Theme.of(context).accentColor,
        //   textTheme: ButtonTextTheme.accent,
        // ),

        //为按钮设置单个主题
        // Theme(
        //   data: Theme.of(context).copyWith(
        //       buttonColor: Theme.of(context).accentColor,
        //       buttonTheme: ButtonThemeData(
        //         textTheme: ButtonTextTheme.primary,
        //         //设置圆角矩形
        //         // shape: BeveledRectangleBorder(
        //         //   borderRadius: BorderRadius.circular(5.0),
        //         // ),
        //         //设置长椭圆形
        //         shape: StadiumBorder(),
        //       )),
        //   child: RaisedButton.icon(
        //     icon: Icon(Icons.add),
        //     onPressed: () {},
        //     label: Text('RaisedButton'),
        //     //渐墨的效果
        //     splashColor: Colors.white,
        //     // color: Colors.pinkAccent,
        //     // elevation: 8.0,
        //     // textColor: Theme.of(context).accentColor,
        //     // textTheme: ButtonTextTheme.accent,
        //   ),
        // )
      ],
    );

    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          onPressed: () {},
          child: Text('FlatButton'),
          //渐墨的效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        // SizedBox(
        //   width: 8.0,
        // ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          onPressed: () {},
          label: Text('FlatButton'),
          //渐墨的效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        //超距会报错
        SizedBox(
          width: 8.0,
        ),
        // RaisedButton.icon(
        //   icon: Icon(Icons.add),
        //   onPressed: () {},
        //   label: Text('RaisedButton'),
        //   //渐墨的效果
        //   splashColor: Colors.white,
        //   color: Colors.pinkAccent,
        //   elevation: 8.0,
        //   textColor: Theme.of(context).accentColor,
        //   textTheme: ButtonTextTheme.accent,
        // ),

        //为按钮设置单个主题
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                textTheme: ButtonTextTheme.primary,
                //设置圆角矩形
                // shape: BeveledRectangleBorder(
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                //设置长椭圆形
                shape: StadiumBorder(),
              )),
          child: RaisedButton.icon(
            icon: Icon(Icons.add),
            onPressed: () {},
            label: Text('RaisedButton'),
            //渐墨的效果
            splashColor: Colors.white,
            // color: Colors.pinkAccent,
            // elevation: 8.0,
            // textColor: Theme.of(context).accentColor,
            // textTheme: ButtonTextTheme.accent,
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [flatButtonDemo, raisedButtonDemo],
        ),
      ),
    );
  }
}

class WeidgetDemo extends StatelessWidget {
  const WeidgetDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WeigetDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
