import 'package:Harmik/Core/ViewModel/CheakOut_ViewModel.dart';
import 'package:Harmik/View/CheakOut/summary_Widget.dart';
import 'package:Harmik/View/Widgets/CustomButton.dart';
import 'package:Harmik/helper/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:status_change/status_change.dart';

import '../../Constants.dart';
import 'add_address_Widget.dart';
import 'delevery_time_Widget.dart';

class CheakOutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheakOutViewModel>(
      init: CheakOutViewModel(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text(
            "CheckOut".tr,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              height: 100,
              child: StatusChange.tileBuilder(
                theme: StatusChangeThemeData(
                  direction: Axis.horizontal,
                  connectorTheme:
                      ConnectorThemeData(space: 1.0, thickness: 1.0),
                ),
                builder: StatusChangeTileBuilder.connected(
                  itemWidth: (_) =>
                      MediaQuery.of(context).size.width / _processes.length,
                  nameWidgetBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        _processes[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: controller.getColor(index),
                        ),
                      ),
                    );
                  },
                  indicatorWidgetBuilder: (_, index) {
                    if (index <= controller.processIndex) {
                      return DotIndicator(
                        size: 35.0,
                        border: Border.all(color: Colors.green, width: 1),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    } else {
                      return OutlinedDotIndicator(
                        size: 30,
                        borderWidth: 1.0,
                        color: todoColor,
                      );
                    }
                  },
                  lineWidgetBuilder: (index) {
                    if (index > 0) {
                      if (index == controller.processIndex) {
                        final prevColor = controller.getColor(index - 1);
                        final color = controller.getColor(index);
                        var gradientColors;
                        gradientColors = [
                          prevColor,
                          Color.lerp(prevColor, color, 0.5)
                        ];
                        return DecoratedLineConnector(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColors,
                            ),
                          ),
                        );
                      } else {
                        return SolidLineConnector(
                          color: controller.getColor(index),
                        );
                      }
                    } else {
                      return null;
                    }
                  },
                  itemCount: _processes.length,
                ),
              ),
            ),
            controller.page == Pages.DeliveryTime
                ? DeliveryTime()
                : controller.page == Pages.AddAddress
                    ? AddAddress()
                    : Summary(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              if (controller.processIndex > 0)
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    width: Get.width * 0.5,
                    height: 95,
                    padding: EdgeInsets.all(20),
                    child: CustomButton(
                      padding: 0,
                      text: 'BACK'.tr,
                      onpress: () {
                        controller.changeIndex(controller.processIndex - 1);
                      },
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: Get.width * 0.5,
                  height: 95,
                  padding: EdgeInsets.all(20),
                  child: CustomButton(
                    padding: 0,
                    text: "Next".tr,
                    onpress: () {
                      controller.changeIndex(controller.processIndex + 1);
                    },
                  ),
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}

final _processes = [
  'Delivery'.tr,
  'Address'.tr,
  'Summery'.tr,
];
