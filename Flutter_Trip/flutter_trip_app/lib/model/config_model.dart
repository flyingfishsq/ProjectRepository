class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl});

  //工厂方法
  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    return ConfigModel(searchUrl: json['searchUrl']);
  }

  //当searchUrl不为final的时候，可以这样定义fromJson方法
  // ConfigModel.fromJson(Map<String,dynamic> json){
  //   searchUrl : json['searchUrl'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map();
    data['searchUrl'] = this.searchUrl;
    return data;
  }
}
