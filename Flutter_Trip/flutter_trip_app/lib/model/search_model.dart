import 'package:flutter_trip_app/model/search_item.dart';

class SearchModel {
  List<SearchItem> data;

  SearchModel({this.data});

  // SearchModel.fromJson(Map<String, dynamic> json) {
  //   if (json['data'] != null) {
  //     data = List();
  //     json['data'].forEach((v) {
  //       data.add(SearchItem.fromJson(v));
  //     });
  //   }
  // }

  //工厂方法与上面的方法有什么区别？上面的为什么不能使用factory关键字
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    //把键值对中的值当作list取出
    var dataJson = json['data'] as List;
    List<SearchItem> data = dataJson.map((v)=>SearchItem.fromJson(v)).toList();
    return SearchModel(data: data);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = Map();
    if (this.data != null) {
      map['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
