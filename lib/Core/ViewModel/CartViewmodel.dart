import 'package:Harmik/Core/Services/DataBase/CreditCardDb.dart';
import 'package:Harmik/Model/CartProductModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _isloading = ValueNotifier(false);
  ValueNotifier<bool> get isloading => _isloading;
  List<CartProductModel> _cart = [];
  List<CartProductModel> get cart => _cart;
  double _price = 0.0;
  var dbhelper = CartDatabasehelper.db;

  double get price => _price;
  CartViewModel() {
    getalldata();
  }

  getalldata() async {
    _isloading.value = true;
    _cart = await dbhelper.getalluser();
    print(_cart.length);
    _isloading.value = false;
    getTotalprice();
    update();
  }

  getTotalprice() {
    for (int x = 0; x < _cart.length; x++) {
      _price += (double.parse(_cart[x].price) * _cart[x].quantity);
    }
    update();
  }

  insertcartproductdb(CartProductModel cartProductModel) async {
    if (_cart.length == null) {
      await dbhelper.insert(cartProductModel);
      _cart.add(cartProductModel);
    } else {
      for (int i = 0; i < _cart.length; i++) {
        if (_cart[i].userid == cartProductModel.userid) return;
      }

      await dbhelper.insert(cartProductModel);
      _cart.add(cartProductModel);
      _price +=
          (double.parse(cartProductModel.price) * cartProductModel.quantity);
    }

    update();
  }

  increasequantity(int index) async {
    _cart[index].quantity++;
    _price += (double.parse(_cart[index].price));
    await dbhelper.update(_cart[index]);
    update();
  }

  decreasequantity(int index) async {
    _cart[index].quantity--;
    _price -= (double.parse(_cart[index].price));
    await dbhelper.update(_cart[index]);

    update();
  }
}
