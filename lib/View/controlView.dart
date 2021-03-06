import 'package:Harmik/Core/ViewModel/Auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Auth/LoginScr.dart';
import 'Splashsreen.dart';

class ControlView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScr()
          : Splashscr();
    });
  }
}
