import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trip_app/model/grid_nav_model.dart';

class GridNavWidget extends StatelessWidget {
  final GridNavModel model;
  final String name;

  const GridNavWidget({Key key, @required this.model,this.name ='xiaoming'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(name);
  }
}
