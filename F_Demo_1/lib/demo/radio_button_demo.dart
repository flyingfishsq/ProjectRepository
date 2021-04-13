import 'package:flutter/material.dart';

//单选按钮，具有自身单个的值，也有一组按钮的群组值
class RadioButtonDemo extends StatefulWidget {
  RadioButtonDemo({Key? key}) : super(key: key);

  @override
  _RadioButtonDemoState createState() => _RadioButtonDemoState();
}

class _RadioButtonDemoState extends State<RadioButtonDemo> {
  //一组单选按钮的群组值
  int _radioGroupA = 0;

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
      debugPrint("_radioGroupA is $_radioGroupA");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RadioListTile(
              value: 3,
              groupValue: _radioGroupA,
              onChanged: _handleRadioValueChanged,
              title: Text('Radio item A Value = $_radioGroupA'),
              subtitle: Text('Description'),
              secondary: Icon(Icons.bookmark),
              selected: _radioGroupA == 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text('高'),
                    SizedBox(
                      width: 8.0,
                    ),
                    Radio(
                      value: 0,
                      groupValue: _radioGroupA,
                      onChanged: _handleRadioValueChanged,
                      activeColor: Colors.black,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('中'),
                    SizedBox(
                      width: 8.0,
                    ),
                    Radio(
                      value: 1,
                      groupValue: _radioGroupA,
                      onChanged: _handleRadioValueChanged,
                      activeColor: Colors.black,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('低'),
                    SizedBox(
                      width: 8.0,
                    ),
                    Radio(
                      value: 2,
                      groupValue: _radioGroupA,
                      onChanged: _handleRadioValueChanged,
                      activeColor: Colors.black,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
