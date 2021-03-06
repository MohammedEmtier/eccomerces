import 'package:Harmik/Core/Utility/language/Laguage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppLanguage extends GetxController {
  String _apploacl;
  String get apploacl => _apploacl;
  @override
  void onInit() async {
    super.onInit();
    Language language = Language();
    _apploacl = await language.languageread == null
        ? 'en'
        : await language.languageread;
    Get.updateLocale(Locale(apploacl));
    update();
  }

  void chagnelanguage(String type) async {
    Language language = Language();
    if (apploacl == type) return;
    if (type == 'ar') {
      _apploacl = 'ar';
      language.savetorageondisk('ar');
    } else if (type == 'en') {
      _apploacl = 'en';
      language.savetorageondisk('en');
    }
    update();
  }
}
