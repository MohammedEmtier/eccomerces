class CartProductModel {
  String title, image, price, userid;
  int quantity;

  CartProductModel(
      {this.title, this.image, this.price, this.quantity, this.userid});

  CartProductModel.fromJson(Map<String, dynamic> map) {
    if (map == null) {
      return;
    }
    title = map['title'];
    image = map['image'];
    price = map['price'];
    userid = map['userid'];
    quantity = map['quantity'];
  }
  toJson() {
    return {
      title: 'title',
      image: 'image',
      price: 'price',
      userid: 'userid',
      quantity: 'quantity',
    };
  }
}
