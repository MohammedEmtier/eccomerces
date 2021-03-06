import 'package:Harmik/Constants.dart';
import 'package:Harmik/View/Widgets/CustomFormField.dart';
import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Icon(
                Icons.check_circle_outline_rounded,
                color: kprimrycolor,
              ),
              CustomText(
                text: 'Billing address is the same as delivery address'.tr,
                size: 14,
              ),
            ]),
            SizedBox(height: 40),
            CustomFormFiled(
              text: 'Street 1'.tr,
              hinttext: '21, Alex Davidson Avenue'.tr,
            ),
            SizedBox(
              height: 30,
            ),
            CustomFormFiled(
              text: 'Street 2'.tr,
              hinttext: 'Opposite Omegatron, Vicent Quarters'.tr,
            ),
            SizedBox(
              height: 30,
            ),
            CustomFormFiled(
              text: 'City'.tr,
              hinttext: 'Victoria Island'.tr,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: Get.width,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: CustomFormFiled(
                        text: 'State'.tr,
                        hinttext: 'Lagos State'.tr,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: CustomFormFiled(
                        text: 'Country'.tr,
                        hinttext: 'Nigeria'.tr,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
