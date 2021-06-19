import 'common_model.dart';
import 'config_model.dart';
import 'grid_nav.dart';
import 'sales_box.dart';

//注意对象数组的fromJson和toJson操作
class HomeModel {
  ConfigModel config;
  List<CommonModel> bannerList;
  List<CommonModel> localNavList;
  GridNav gridNav;
  List<CommonModel> subNavList;
  SalesBox salesBox;

  HomeModel(
      {this.config,
      this.bannerList,
      this.localNavList,
      this.gridNav,
      this.subNavList,
      this.salesBox});

  //特殊的fromJson方法
  HomeModel.fromJson(Map<String, dynamic> json) {
    config =
        json['config'] != null ? ConfigModel.fromJson(json['config']) : null;

    if (json['bannerList'] != null) {
      bannerList = List();
      json['bannerList'].forEach((v) {
        bannerList.add(CommonModel.fromJson(v));
      });
    }

    if (json['localNavList'] != null) {
      localNavList = List();
      json['localNavList'].forEach((v) {
        localNavList.add(CommonModel.fromJson(v));
      });
    }

    //另一种写法
    // if(json['localNavList']!=null){
    //   //强制类型转换
    //   var localNavListJson = json['localNavList'] as List;
    //   localNavList = localNavListJson.map((e)=>CommonModel.fromJson(e)).toList();
    // }

    gridNav =
        json['gridNav'] != null ? GridNav.fromJson(json['gridNav']) : null;

    if (json['subNavList'] != null) {
      subNavList = List();
      json['subNavList'].forEach((v) {
        subNavList.add(CommonModel.fromJson(v));
      });
    }

    salesBox =
        json['salesBox'] != null ? SalesBox.fromJson(json['salesBox']) : null;
  }

  //按照工厂方法写的fromJson
  // factory HomeModel.fromJson(Map<String, dynamic> json){
  //   var config =
  //   json['config'] != null ? ConfigModel.fromJson(json['config']) : null;
  //
  //   var bannerListJson = json['bannerList'] as List;
  //   List<CommonModel> bannerList = bannerListJson.map((e)=>CommonModel.fromJson(e)).toList();
  //
  //   //等等...
  //
  //   return HomeModel(config: config,bannerList: bannerList);
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    if (this.config != null) {
      data['config'] = this.config.toJson();
    }

    if (this.bannerList != null) {
      data['bannerList'] = this.bannerList.map((v) => v.toJson()).toList();
    }

    if (this.localNavList != null) {
      data['localNavList'] = this.localNavList.map((e) => e.toJson()).toList();
    }

    if (this.gridNav != null) {
      data['gridNav'] = this.gridNav.toJson();
    }

    if (this.subNavList != null) {
      data['subNavList'] = this.subNavList.map((e) => e.toJson()).toList();
    }

    if (this.salesBox != null) {
      data['salesBox'] = this.salesBox.toJson();
    }
    return data;
  }
}
