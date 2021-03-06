import 'package:Harmik/View/Cart_view.dart';
import 'package:Harmik/View/Profile_view.dart';
import 'package:Harmik/View/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlViewModel extends GetxController {
  int _navigatorvalue = 0;
  get navigatorvalue => _navigatorvalue;
  Widget _currentScreen = HomeView();
  get currentScreen => _currentScreen;

  void changenavigator(int selected) {
    _navigatorvalue = selected;
    switch (selected) {
      case 0:
        {
          _currentScreen = HomeView();
          break;
        }
      case 1:
        {
          _currentScreen = CartScreen();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileScr();
          break;
        }
    }
    update();
  }
}
