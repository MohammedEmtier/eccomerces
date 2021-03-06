import 'package:Harmik/View/Confirmscreen.dart';
import 'package:Harmik/View/controlView.dart';
import 'package:Harmik/helper/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants.dart';

class CheakOutViewModel extends GetxController {
  int _processIndex = 0;
  int get processIndex => _processIndex;
  Pages _pages = Pages.DeliveryTime;
  Pages get page => _pages;

  void changeIndex(int i) {
    _processIndex = i;
    if (_processIndex == 1) {
      _pages = Pages.AddAddress;
    } else if (_processIndex == 2) {
      _pages = Pages.Summary;
    } else if (_processIndex == 3) {
      Get.to(ControlView());
    }
    update();
  }

  Color getColor(int index) {
    if (index == _processIndex) {
      return inProgressColor;
    } else if (index < _processIndex) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

  void skip() {
    _processIndex++;

    if (_processIndex == 5) {
      Get.to(ConfirmOrderScreen());
    }
    update();
  }
}
