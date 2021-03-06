import 'dart:io';

import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;
import '../Constants.dart';
import 'Widgets/CustomButton.dart';
import 'Widgets/CustomFormField.dart';
import 'Widgets/Customshipad.dart';
import 'Widgets/FloatbuttonAdaptive.dart';
import 'package:get/get.dart';

class ShippingAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bodycon = Padding(
        padding: EdgeInsets.only(top: 50),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                  text: 'Shipping Address'.tr,
                  size: 20,
                  aligment: Alignment.topCenter,
                ),
                SizedBox(
                  height: 60,
                ),
                Customshipadd(
                  title: 'Home Address'.tr,
                  text:
                      '21, Alex Davidson Avenue, Opposite\nOmegatron, Vicent Smith Quarters,\nVictoria Island, Lagos, Nigeria',
                  defaults: true,
                ),
                SizedBox(
                  height: 35,
                ),
                Customshipadd(
                  title: 'Work Address'.tr,
                  text: '19, Martins Crescent, Bank of Nigeria, Abuja, Nigeria',
                  defaults: false,
                ),
                SizedBox(height: 80),
                FlaotingButtonAdaptive(
                  icon: Icons.add_location_rounded,
                  onpress: () {
                    slideDialog.showSlideDialog(
                        context: context,
                        child: Padding(
                          padding: EdgeInsets.only(left: 25, right: 25),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    CustomText(
                                      text: 'Street 1'.tr,
                                      color: Color.fromRGBO(0, 0, 0, 0.75),
                                      size: 14,
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          prefixIcon: Icon(
                                            Icons.local_activity,
                                            color: kprimrycolor,
                                          ),
                                          hintText:
                                              '21, Alex Davidson Avenue'.tr,
                                          hintStyle:
                                              TextStyle(color: Colors.grey)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomFormFiled(
                                  text: 'Street 2'.tr,
                                  hinttext:
                                      'Opposite Omegatron, Vicent Quarters'.tr,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                CustomFormFiled(
                                  text: 'City'.tr,
                                  hinttext: 'Victoria Island'.tr,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: Get.width,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: CustomFormFiled(
                                          text: 'State'.tr,
                                          hinttext: 'Lagos State'.tr,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Expanded(
                                        child: CustomFormFiled(
                                            text: 'Country'.tr,
                                            hinttext: 'Nigeria'.tr),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 17,
                                ),
                                CustomButton(
                                  text: 'Link Address',
                                  padding: 20,
                                  onpress: () {},
                                )
                              ],
                            ),
                          ),
                        ));
                  },
                ),
              ],
            ),
          ),
        ));
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: _bodycon,
          )
        : Scaffold(
            body: _bodycon,
          );
  }
}
