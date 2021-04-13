import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  ChipDemo({Key? key}) : super(key: key);

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Orange',
    'Pear',
    'Lemon',
  ];

  String _action = 'Nothing';

  List<String> _selected = [];

  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Wrap表示当小部件超出屏幕显示的时候会自动换行显示，比Row好点，Row会报错
            //Wrap也会通过spacing自动设置内部包裹的小部件之间的间隔，不需要用SizedBox来设置间隔
            Wrap(
              //这个是控制列之间的间隔
              spacing: 8.0,
              //这个是控制行之间的间隔
              runSpacing: 8.0,
              children: [
                Chip(
                  label: Text('Life'),
                ),
                // SizedBox(
                //   width: 8.0,
                // ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                // SizedBox(
                //   width: 8.0,
                // ),
                Chip(
                  label: Text('Flyingfish'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('好'),
                  ),
                ),
                // SizedBox(
                //   width: 8.0,
                // ),
                Chip(
                  label: Text('Flyingfish'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=3351113425,3755484207&fm=26&gp=0.jpg'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: '你确定要去掉这个标签吗？',
                  onDeleted: () {},
                ),
                Divider(
                  color: Colors.black,
                  height: 32.0,
                  //左右的margin
                  indent: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      deleteIconColor: Colors.yellowAccent,
                      deleteButtonTooltipMessage: '你确定要去掉这个标签吗？',
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.black,
                  height: 32.0,
                  //左右的margin
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip: $_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _tags.map((tag) {
                    //ActionChip可以带一个动画，有点像按钮
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.black,
                  height: 32.0,
                  //左右的margin
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip: ${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _tags.map((tag) {
                    //FilterChip有点像CheckBox或者Switch
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.black,
                  height: 32.0,
                  //左右的margin
                  indent: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip: $_choice'),
                ),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _tags.map((tag) {
                    //FilterChip有点像CheckBox或者Switch
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choice == tag,
                      selectedColor: Colors.greenAccent,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
      //点击悬浮按钮重置数组
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'Apple',
              'Banana',
              'Orange',
              'Pear',
              'Lemon',
            ];

            _selected = [];

            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}
