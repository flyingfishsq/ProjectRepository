import 'package:flutter_trip_app/model/common_model.dart';

//注意Object类型成员变量的fromJson
//嵌套调用，注意对象的json格式
class GridNavModel {
  final String startColor;
  final String endColor;

  final CommonModel mainItem;

  final CommonModel item1, item2, item3, item4;

  GridNavModel(
      {this.startColor,
      this.endColor,
      this.mainItem,
      this.item1,
      this.item2,
      this.item3,
      this.item4});

  factory GridNavModel.fromJson(Map<String, dynamic> json) {
    return GridNavModel(
      startColor: json['startColor'],
      endColor: json['endColor'],
      mainItem: json['mainItem'] != null
          ? CommonModel.fromJson(json['mainItem'])
          : null,
      item1: json['item1'] != null ? CommonModel.fromJson(json['item1']) : null,
      item2: json['item2'] != null ? CommonModel.fromJson(json['item2']) : null,
      item3: json['item3'] != null ? CommonModel.fromJson(json['item3']) : null,
      item4: json['item4'] != null ? CommonModel.fromJson(json['item4']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map();
    data['startColor'] = this.startColor;
    data['endColor'] = this.endColor;

    if (this.mainItem != null) {
      data['mainItem'] = this.mainItem.toJson();
    }

    if (this.item1 != null) {
      data['item1'] = this.item1.toJson();
    }

    if (this.item2 != null) {
      data['item2'] = this.item2.toJson();
    }

    if (this.item3 != null) {
      data['item3'] = this.item3.toJson();
    }

    if (this.item4 != null) {
      data['item4'] = this.item4.toJson();
    }
    return data;
  }

}
