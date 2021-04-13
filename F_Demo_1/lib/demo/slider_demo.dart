import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  SliderDemo({Key? key}) : super(key: key);

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Slider(
                  value: _sliderItemA,
                  onChanged: (value) {
                    setState(() {
                      _sliderItemA = value;
                    });
                  },
                  activeColor: Theme.of(context).accentColor,
                  inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                  min: 0.0,
                  max: 10.0,
                  //对区间等分
                  divisions: 10,
                  label: '${_sliderItemA.toInt()}',
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Text('SliderValue: $_sliderItemA'),
          ],
        ),
      ),
    );
  }
}
