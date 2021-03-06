import 'dart:io';

import 'package:Harmik/Constants.dart';
import 'package:Harmik/Core/ViewModel/CartViewmodel.dart';
import 'package:Harmik/View/Widgets/CustomButton.dart';
import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CheakOut/Cheakout_view.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bodycon = GetBuilder<CartViewModel>(
        init: Get.find(),
        builder: (controller) => controller.cart.length != 0
            ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                SvgPicture.asset(
                  'assets/Svg/emptycart.svg',
                  width: 200,
                  height: 200,
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Empty Cart",
                    style: GoogleFonts.roboto(fontSize: 30),
                  ),
                ),
              ])
            : Padding(
                padding: EdgeInsets.only(top: 30),
                child: Column(children: [
                  Container(
                    child: Expanded(
                      child: ListView.separated(
                        itemCount: controller.cart.length,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 15,
                          );
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 140,
                            child: Row(
                              children: [
                                Container(
                                    width: 140,
                                    child: Image.network(
                                      controller.cart[index].image,
                                      fit: BoxFit.cover,
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: controller.cart[index].title,
                                        size: 21,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      CustomText(
                                        text: controller.cart[index].price
                                            .toString(),
                                        color: kprimrycolor,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(8)),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .increasequantity(index);
                                                },
                                                child: Icon(
                                                    CommunityMaterialIcons
                                                        .plus)),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            CustomText(
                                              text:
                                                  '${controller.cart[index].quantity}',
                                              fontwegit: FontWeight.bold,
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            GestureDetector(
                                              child: Icon(
                                                  CommunityMaterialIcons.minus),
                                              onTap: () {
                                                controller
                                                    .decreasequantity(index);
                                              },
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 1.0),
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                          Icons.arrow_forward_ios_rounded)),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            CustomText(
                              text: 'Total'.tr,
                              size: 21,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GetBuilder<CartViewModel>(
                              init: Get.find(),
                              builder: (controlle) => CustomText(
                                text: '${controlle.price}',
                                color: kprimrycolor,
                              ),
                            ),
                          ],
                        ),
                        Container(
                            height: 90,
                            width: 230,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.all(20),
                            child: CustomButton(
                              padding: 0,
                              text: 'CheakOut'.tr,
                              onpress: () => Get.to(CheakOutView()),
                            )),
                      ],
                    ),
                  )
                ])));
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: _bodycon,
          )
        : Scaffold(
            body: _bodycon,
          );
  }
}
