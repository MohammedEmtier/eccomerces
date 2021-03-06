import 'package:Harmik/Core/ViewModel/AppLanguage.dart';
import 'package:Harmik/Core/ViewModel/Auth_viewmodel.dart';
import 'package:Harmik/Core/ViewModel/CartViewmodel.dart';
import 'package:Harmik/Core/ViewModel/CheakOut_ViewModel.dart';
import 'package:Harmik/Core/ViewModel/ControlViewModel.dart';
import 'package:Harmik/Core/ViewModel/HomeViewModel.dart';
import 'package:Harmik/Core/ViewModel/ItemCatlogViewModel.dart';
import 'package:Harmik/Core/ViewModel/ProfileViewmodel.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControlViewModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => CartViewModel());
    Get.lazyPut(() => CheakOutViewModel());
    Get.lazyPut(() => AppLanguage());
    Get.lazyPut(() => ItemCatlogViewModel());
    Get.lazyPut(() => ProfileViewModel());
  }
}
