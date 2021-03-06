import 'dart:io';

import 'package:Harmik/Constants.dart';
import 'package:Harmik/Core/ViewModel/HomeViewModel.dart';

import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Categoryitem.dart';
import 'DetailsView.dart';
import 'Products.dart';

class HomeView extends GetWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    var _bodycon = SingleChildScrollView(
        child: Container(
      padding: const EdgeInsets.only(top: 85, left: 20, right: 20),
      child: Column(
        children: [
          textFormFielfSearch(context),
          SizedBox(
            height: 40,
          ),
          CustomText(
            text: 'Categories'.tr,
            size: 18,
            fontwegit: FontWeight.bold,
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 100,
            child: listViewCatergory(),
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: 'Best Selling'.tr,
                fontwegit: FontWeight.bold,
                size: 18,
              ),
              GestureDetector(
                child: CustomText(
                  text: 'See all'.tr,
                  size: 16,
                ),
                onTap: () {
                  Get.to(Products());
                },
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          listViewBestSelling(),
        ],
      ),
    ));
    return Platform.isIOS
        ? GetBuilder<HomeViewModel>(
            init: Get.find(),
            builder: (controller) => controller.isloading.value
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(kprimrycolor),
                    ),
                  )
                : CupertinoPageScaffold(
                    child: _bodycon,
                  ))
        : GetBuilder<HomeViewModel>(
            init: Get.find(),
            builder: (controller) => controller.isloading.value
                ? Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(kprimrycolor),
                    ),
                  )
                : Scaffold(
                    body: _bodycon,
                  ),
          );
  }

  Widget listViewCatergory() {
    return GetBuilder<HomeViewModel>(
        init: HomeViewModel(),
        builder: (controller) => Container(
              height: 100,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                primary: false,
                itemCount: controller.categorymodel.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () => Get.to(CategoryItem()),
                    child: Column(children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.network(
                              controller.categorymodel[index].url),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        text: '${categoryname[index]}',
                        size: 12,
                      ),
                    ]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) => SizedBox(
                  width: 20,
                ),
              ),
            ));
  }

  Widget textFormFielfSearch(BuildContext context) {
    return GetBuilder<HomeViewModel>(
        init: Get.find(),
        builder: (controller) => Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                controller: controller.controllere,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  suffixIcon: GestureDetector(
                    onTap: () => showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              content: Container(
                            height: 200,
                            width: 1,
                            child: Container(
                                child: AvatarGlow(
                              animate: controller.isListening,
                              glowColor: Theme.of(context).primaryColor,
                              endRadius: 75.0,
                              duration: const Duration(milliseconds: 2000),
                              repeatPauseDuration:
                                  const Duration(milliseconds: 100),
                              repeat: true,
                              child: GestureDetector(
                                onTap: () => controller.listen(),
                                child: Icon(
                                  controller.isListening
                                      ? Icons.mic
                                      : Icons.mic_none,
                                  color: Colors.black,
                                  size: 60,
                                ),
                              ),
                            )),
                          ));
                        }),
                    child: Icon(
                      Icons.keyboard_voice,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ));
  }

  Widget listViewBestSelling() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
          alignment: Alignment.bottomLeft,
          height: 350,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.productsModel.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () => Get.to(DetailsView(
                  model: controller.productsModel[index],
                )),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Column(children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(5)),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Container(
                          height: 220,
                          child: Image.network(
                            controller.productsModel[index].url,
                            fit: BoxFit.fill,
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    ),
                    CustomText(
                        text: controller.productsModel[index].title,
                        size: 16,
                        aligment: Alignment.bottomLeft),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        controller.productsModel[index].descrption,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomText(
                      text: controller.productsModel[index].price,
                      aligment: Alignment.bottomLeft,
                      size: 16,
                      color: kprimrycolor,
                    ),
                  ]),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) => SizedBox(
              width: 20,
            ),
          )),
    );
  }

  final List<String> categoryname = [
    'Men'.tr,
    'Women'.tr,
    'Devices'.tr,
    'Gaming'.tr,
    'Gadgets'.tr
  ];
}
