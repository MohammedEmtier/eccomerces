import 'package:Harmik/Core/ViewModel/HomeViewModel.dart';
import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants.dart';
import 'DetailsView.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText(
                text: 'Products',
                size: 24,
                aligment: Alignment.topCenter,
                fontwegit: FontWeight.bold,
              ),
              SizedBox(
                height: 20,
              ),
              GetBuilder<HomeViewModel>(
                builder: (controller) => GridView.builder(
                  scrollDirection: Axis.vertical,
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
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                              maxLines: 1,
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
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300,
                    childAspectRatio: 4 / 7,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 1 / 9,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
