import 'package:flutter_trip_app/model/grid_nav_model.dart';

class GridNav {
  final GridNavModel flight;
  final GridNavModel hotel;
  final GridNavModel travel;

  GridNav({this.flight, this.hotel, this.travel});

  factory GridNav.fromJson(Map<String, dynamic> json) {
    return GridNav(
        flight: json['flight'] != null
            ? GridNavModel.fromJson(json['flight'])
            : null,
        hotel:
            json['hotel'] != null ? GridNavModel.fromJson(json['hotel']) : null,
        travel: json['travel'] != null
            ? GridNavModel.fromJson(json['travel'])
            : null);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map();
    if (this.flight != null) {
      data['flight'] = this.flight.toJson();
    }

    if (this.hotel != null) {
      data['hotel'] = this.hotel.toJson();
    }

    if (this.travel != null) {
      data['travel'] = this.travel.toJson();
    }

    return data;
  }
}
