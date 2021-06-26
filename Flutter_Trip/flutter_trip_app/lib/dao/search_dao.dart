//请求网络接口数据
import 'dart:async';
import 'dart:convert';

import 'package:flutter_trip_app/model/search_model.dart';

//给包改个别名就用as
import 'package:http/http.dart' as http;

class SearchDao {
  //根据实时输入访问网络，注意keyword的使用
  //由于每次对textview的数据改动都会发起网络请求，网络返回可能有延迟，
  //这里没有使用RxDart来做控制，使用关键字比对，比如当前请求的关键字和服务器返回的数据里带的关键字是否匹配，不匹配就丢弃返回结果
  static Future<SearchModel> fetch(String url, String keyword) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // var result = json.decode(response.body);

      //避免接口中返回数据里中文出现乱码，做这个配置
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      SearchModel model = SearchModel.fromJson(result);
      model.keyword = keyword;

      return model;
    } else {
      //可以对返回码进行细分从而区别处理各种问题
      throw Exception('Failed to fetch data.');
    }
  }
}
