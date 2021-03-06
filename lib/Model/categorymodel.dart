class CategoryModel {
  String url, ctegoryname;
  CategoryModel({this.url, this.ctegoryname});
  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    url = map['url'];
    ctegoryname = map['ctegoryname'];
  }
  toJson() {
    return {
      'ctegoryname': ctegoryname,
      'url': url,
    };
  }
}
