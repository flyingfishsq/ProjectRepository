import 'package:flutter_trip_app/model/config_model.dart';

class HomeModel{
  final ConfigModel config;

  HomeModel({this.config});

  factory HomeModel.fromJson(Map<String, dynamic> json){
    return HomeModel(config: json['config']);
  }

  Map<String, dynamic> toJson(){
    final Map<String,dynamic> data = Map();
    data['config'] = this.config;
    return data;
  }
}