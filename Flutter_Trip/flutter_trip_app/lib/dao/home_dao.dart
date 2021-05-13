//请求网络接口数据
import 'package:flutter_trip_app/model/home_model.dart';
import 'dart:async';
import 'dart:convert';

//给包改个别名就用as
import 'package:http/http.dart' as http;

const HOME_PAGE_URL =
    'https://www.devio.org/io/flutter_app/json/home_page.json';

class HomeDao {
  static Future<HomeModel> fetch() async {
    final response = await http.get(HOME_PAGE_URL);
    if (response.statusCode == 200) {
      // var result = json.decode(response.body);

      //避免接口中返回数据里中文出现乱码，做这个配置
      Utf8Decoder utf8decoder = Utf8Decoder();
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return HomeModel.fromJson(result);
    } else {
      //可以对返回码进行细分从而区别处理各种问题
      throw Exception('Failed to fetch data.');
    }
  }
}
