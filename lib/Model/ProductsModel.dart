class ProductsModel {
  String url, title, descrption, price, size, color, userid;

  ProductsModel(
      {this.descrption,
      this.size,
      this.color,
      this.url,
      this.title,
      this.price,
      this.userid});

  ProductsModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    } else
      url = map['url'];
    price = map['price'];
    descrption = map['descrption'];
    color = map['color'];
    size = map['size'];
    title = map['title'];
    userid = map['userid'];
  }
  toJson() {
    return {
      title: 'title',
      size: 'size',
      color: 'color',
      descrption: 'descrption',
      url: 'url',
      price: 'price',
      userid: 'userid',
    };
  }
}
