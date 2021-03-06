import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Constants.dart';
import 'Core/Translation/translation.dart';
import 'Core/ViewModel/AppLanguage.dart';
import 'Core/ViewModel/CartViewmodel.dart';
import 'View/controlView.dart';
import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  Get.put(AppLanguage());
  Get.put(CartViewModel());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? GetBuilder<AppLanguage>(
            builder: (cont) => GetCupertinoApp(
                  initialBinding: Binding(),
                  title: 'Harmik',
                  debugShowCheckedModeBanner: false,
                  translations: Translation(),
                  locale: Locale(cont.apploacl),
                  fallbackLocale: Locale('en'),
                  theme: CupertinoThemeData(
                    primaryColor: kprimrycolor,
                  ),
                  home: ControlView(),
                ))
        : GetBuilder<AppLanguage>(
            builder: (cont) => GetMaterialApp(
                  initialBinding: Binding(),
                  title: 'Harmik',
                  debugShowCheckedModeBanner: false,
                  translations: Translation(),
                  locale: Locale(cont.apploacl),
                  fallbackLocale: Locale('en'),
                  theme: ThemeData(
                    primaryColor: kprimrycolor,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  home: ControlView(),
                ));
  }
}
