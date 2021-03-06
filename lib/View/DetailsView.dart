import 'dart:io';

import 'package:Harmik/Core/ViewModel/CartViewmodel.dart';
import 'package:Harmik/Model/CartProductModel.dart';
import 'package:Harmik/Model/ProductsModel.dart';
import 'package:Harmik/View/Widgets/CustomButton.dart';
import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants.dart';

class DetailsView extends StatelessWidget {
  DetailsView({this.model});
  final ProductsModel model;
  @override
  Widget build(BuildContext context) {
    var _bodycon = Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(0.5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.30,
              child: Image.network(
                model.url,
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(18),
              child: Column(children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    model.title,
                    style: GoogleFonts.roboto(fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            text: 'Size'.tr,
                          ),
                          CustomText(
                            text: model.size,
                            fontwegit: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CustomText(
                            text: 'Color'.tr,
                          ),
                          CustomText(
                            text: model.color,
                            fontwegit: FontWeight.bold,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                CustomText(
                  text: "Details".tr,
                  size: 18,
                  fontwegit: FontWeight.w500,
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: CustomText(
                    text: model.descrption,
                    hegit: 2.2,
                    size: 16,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomText(
                                text: 'Price'.tr,
                                size: 22,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              CustomText(
                                text: model.price,
                                color: kprimrycolor,
                                size: 20,
                              ),
                            ],
                          ),
                          GetBuilder<CartViewModel>(
                            init: Get.find(),
                            builder: (controller) => Container(
                              width: 230,
                              child: CustomButton(
                                text: 'Add Cart'.tr,
                                padding: 20,
                                onpress: () {
                                  controller
                                      .insertcartproductdb(CartProductModel(
                                    title: model.title.trim(),
                                    image: model.url.trim(),
                                    price: model.price,
                                    quantity: 1,
                                    userid: model.userid,
                                  ));
                                },
                              ),
                            ),
                          )
                        ]),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: _bodycon,
          )
        : Scaffold(
            body: _bodycon,
          );
  }
}
