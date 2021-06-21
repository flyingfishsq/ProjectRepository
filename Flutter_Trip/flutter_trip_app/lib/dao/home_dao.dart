//请求网络接口数据
import 'dart:async';
import 'dart:convert';

import 'package:flutter_trip_app/model/home_model.dart';
import 'package:html/parser.dart' show parse;
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

  //自定义接口返回数据
  static Future<String> fetchData(String url, String pageSize, String pageIndex,
      {String xmmc,
      String xmdz,
      String dwmc,
      String pfsjbegin,
      String pfsjend,
      String szxzq,
      String sfsts,
      String jsxz}) async {
    final Map<String, String> data = Map();
    xmmc == null ? data['XMMC'] = '' : data['XMMC'] = xmmc;
    xmdz == null ? data['XMDZ'] = '' : data['XMDZ'] = xmdz;
    dwmc == null ? data['DWMC'] = '' : data['DWMC'] = dwmc;
    pfsjbegin == null ? data['PFSJbegin'] = '' : data['PFSJbegin'] = pfsjbegin;
    pfsjend == null ? data['PFSJend'] = '' : data['PFSJend'] = pfsjend;
    szxzq == null ? data['SZXZQ'] = '' : data['SZXZQ'] = szxzq;
    sfsts == null ? data['SFSTS'] = '' : data['SFSTS'] = sfsts;
    jsxz == null ? data['JSXZ'] = '' : data['JSXZ'] = jsxz;

    data['PageSize'] = pageSize;
    data['PageIndex'] = pageIndex;

    final response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      // var result = json.decode(response.body);

      //避免接口中返回数据里中文出现乱码，做这个配置
      Utf8Decoder utf8decoder = Utf8Decoder();
      //去除Html标签
      var data2 = parse(utf8decoder.convert(response.bodyBytes)).body.text;
      //默认返回是List<dynamic>，应该转换为json字符串返回
      var result = json.decode(data2).toString();

      return result;
    } else {
      //可以对返回码进行细分从而区别处理各种问题
      throw Exception('Failed to fetch data.');
    }
  }
}
