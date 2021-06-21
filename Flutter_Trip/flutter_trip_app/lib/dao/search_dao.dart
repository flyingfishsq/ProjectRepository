//请求网络接口数据
import 'dart:async';
import 'dart:convert';

import 'package:flutter_trip_app/model/search_model.dart';
//给包改个别名就用as
import 'package:http/http.dart' as http;

class SearchDao{
  static Future<SearchModel> fetch(String url, String keyword) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // var result = json.decode(response.body);

      //避免接口中返回数据里中文出现乱码，做这个配置
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return SearchModel.fromJson(result);
    } else {
      //可以对返回码进行细分从而区别处理各种问题
      throw Exception('Failed to fetch data.');
    }
  }
}