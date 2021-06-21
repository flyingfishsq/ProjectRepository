import 'package:flutter/material.dart';
import 'package:flutter_trip_app/dao/search_dao.dart';
import 'package:flutter_trip_app/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String showText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SearchBar(
            hideLeft: true,
            defaultText: '哈哈',
            hint: '呵呵',
            leftButtonClick: () {
              Navigator.pop(context);
            },
            onChanged: _onTextChange,
          ),
          InkWell(
            onTap: () {
              SearchDao.fetch(
                      'https://m.ctrip.com/restapi/h5api/globalsearch/search?source=mobileweb&action=mobileweb&keyword=',
                      '长城')
                  .then((v) {
                setState(() {
                  showText = v.data[0].url;
                });
              });
            },
            child: Text('get'),
          ),
          Text(showText),
        ],
      ),
    );
  }

  _onTextChange(text) {}
}
