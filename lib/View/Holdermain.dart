import 'package:Harmik/Core/ViewModel/ControlViewModel.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:cuberto_bottom_bar/cuberto_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants.dart';

class Holdermain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
        init: Get.find(),
        builder: (controller) => Scaffold(
              body: controller.currentScreen,
              bottomNavigationBar: bottomNavigationBar(),
            ));
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControlViewModel>(
      builder: (controller) => CubertoBottomBar(
        barBorderRadius: BorderRadius.circular(15),
        key: Key("BottomBar"),
        tabStyle: CubertoTabStyle.STYLE_FADED_BACKGROUND,
        selectedTab: controller.navigatorvalue,
        inactiveIconColor: Colors.black,
        onTabChangedListener: (int position, String title, Color tabColor) =>
            controller.changenavigator(position),
        tabs: [
          TabData(
            iconData: Icons.explore,
            title: 'Explore'.tr,
            tabColor: kprimrycolor,
          ),
          TabData(
            iconData: CommunityMaterialIcons.cart,
            title: 'Cart'.tr,
            tabColor: kprimrycolor,
          ),
          TabData(
            iconData: CommunityMaterialIcons.face_profile,
            title: 'Profile'.tr,
            tabColor: kprimrycolor,
          ),
        ],
      ),
    );
  }
}
