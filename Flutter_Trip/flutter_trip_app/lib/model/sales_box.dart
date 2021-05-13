import 'package:flutter_trip_app/model/common_model.dart';

class SalesBox {
  final CommonModel bigCard1,
      bigCard2,
      smallCard1,
      smallCard2,
      smallCard3,
      smallCard4;
  final String icon;
  final String moreUrl;

  SalesBox(
      {this.bigCard1,
      this.bigCard2,
      this.smallCard1,
      this.smallCard2,
      this.smallCard3,
      this.smallCard4,
      this.icon,
      this.moreUrl});

  factory SalesBox.fromJson(Map<String, dynamic> json) {
    return SalesBox(
        bigCard1: json['bigCard1'] != null
            ? CommonModel.fromJson(json['bigCard1'])
            : null,
        bigCard2: json['bigCard2'] != null
            ? CommonModel.fromJson(json['bigCard2'])
            : null,
        smallCard1: json['smallCard1'] != null
            ? CommonModel.fromJson(json['smallCard1'])
            : null,
        smallCard2: json['smallCard2'] != null
            ? CommonModel.fromJson(json['smallCard2'])
            : null,
        smallCard3: json['smallCard3'] != null
            ? CommonModel.fromJson(json['smallCard3'])
            : null,
        smallCard4: json['smallCard4'] != null
            ? CommonModel.fromJson(json['smallCard4'])
            : null,
        icon: json['icon'],
        moreUrl: json['moreUrl']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map();
    if (this.bigCard1 != null) {
      data['bigCard1'] = this.bigCard1.toJson();
    }

    if (this.bigCard2 != null) {
      data['bigCard2'] = this.bigCard2.toJson();
    }

    if (this.smallCard1 != null) {
      data['smallCard1'] = this.smallCard1.toJson();
    }

    if (this.smallCard2 != null) {
      data['smallCard2'] = this.smallCard2.toJson();
    }

    if (this.smallCard3 != null) {
      data['smallCard3'] = this.smallCard3.toJson();
    }

    if (this.smallCard4 != null) {
      data['smallCard4'] = this.smallCard4.toJson();
    }
    data['icon'] = this.icon;
    data['moreUrl'] = this.moreUrl;

    return data;
  }
}
