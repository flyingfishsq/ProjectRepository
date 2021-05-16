import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  StepperDemo({Key key}) : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.blueAccent,
              ),
              child: Stepper(
                  currentStep: _currentStep,
                  onStepTapped: (int value) {
                    setState(() {
                      _currentStep = value;
                    });
                  },
                  //每一个步骤点击确定或者取消的操作
                  onStepContinue: () {
                    setState(() {
                      _currentStep < 2 ? _currentStep += 1 : _currentStep = 0;
                    });
                  },
                  onStepCancel: () {
                    setState(() {
                      _currentStep > 0 ? _currentStep -= 1 : _currentStep = 0;
                    });
                  },
                  steps: [
                    Step(
                      title: Text('Login'),
                      subtitle: Text('Login First'),
                      //将鼠标停留在待输入文字的引号内，按F1调出搜索，输入lorem自动加载随机文字
                      //“乱数假文”， 主要的目的为测试文章或文字在不同字型、版型下看起来的效果
                      content: Text(
                          'Sint veniam cillum do proident cillum minim est.'),
                      isActive: _currentStep == 0,
                    ),
                    Step(
                      title: Text('Choose Plan'),
                      subtitle: Text('Choose Your Plan'),
                      //将鼠标停留在待输入文字的引号内，按F1调出搜索，输入lorem自动加载随机文字
                      //“乱数假文”， 主要的目的为测试文章或文字在不同字型、版型下看起来的效果
                      content: Text(
                          'Esse adipisicing do id Lorem dolore duis duis elit.'),
                      isActive: _currentStep == 1,
                    ),
                    Step(
                      title: Text('Confirm Payment'),
                      subtitle: Text('Confirm Your Payment Method'),
                      //将鼠标停留在待输入文字的引号内，按F1调出搜索，输入lorem自动加载随机文字
                      //“乱数假文”， 主要的目的为测试文章或文字在不同字型、版型下看起来的效果
                      content: Text('In minim veniam in laboris velit.'),
                      isActive: _currentStep == 2,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
