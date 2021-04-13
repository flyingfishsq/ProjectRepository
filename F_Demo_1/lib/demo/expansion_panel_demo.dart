import 'package:flutter/material.dart';

class ExpansionPanelDemo extends StatefulWidget {
  ExpansionPanelDemo({Key? key}) : super(key: key);

  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  bool _isExpanded = false;

  late List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();

    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel A'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C'),
        ),
        isExpanded: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  //对应的是只有一个item的情形
                  // _isExpanded = !_isExpanded;
                  _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                });
              },
              children:
                  // [
                  // ExpansionPanel(
                  //     headerBuilder: (BuildContext context, bool isExpanded) {
                  //       return Container(
                  //         padding: EdgeInsets.all(16.0),
                  //         child: Text(
                  //           'Panel A',
                  //           style: Theme.of(context).textTheme.headline6,
                  //         ),
                  //       );
                  //     },
                  //     body: Container(
                  //       padding: EdgeInsets.all(16.0),
                  //       width: double.infinity,
                  //       child: Text('Content for Panel A'),
                  //     ),
                  //     isExpanded: _isExpanded),
                  // ],
                  _expansionPanelItems.map((e) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        e.headerText,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    );
                  },
                  body: e.body,
                  isExpanded: e.isExpanded,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({
    required this.headerText,
    required this.body,
    required this.isExpanded,
  });
}
