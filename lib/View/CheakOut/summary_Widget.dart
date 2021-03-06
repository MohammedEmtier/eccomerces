import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants.dart';
import '../Track_view.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 220, child: listViewBestSelling()),
            Divider(),
            SizedBox(
              height: 15,
            ),
            CustomText(
              text: 'Shipping Address',
              size: 18,
              fontwegit: FontWeight.bold,
            ),
            SizedBox(
              height: 12,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CustomText(
                  text:
                      '21, Alex Davidson Avenue, Opposite\nOmegatron, Vicent Smith Quarters,\nVictoria Island, Lagos, Nigeria'),
              Icon(
                Icons.check_circle_outline_rounded,
                color: kprimrycolor,
              ),
            ]),
            SizedBox(
              height: 15,
            ),
            CustomText(text: "Change", color: kprimrycolor, size: 14),
            GestureDetector(
                onTap: () {
                  Get.to(TrcakView());
                },
                child: Icon(Icons.track_changes)),
          ],
        ),
      ),
    );
  }

  Widget listViewBestSelling() {
    return Container(
        padding: EdgeInsets.all(5),
        alignment: Alignment.bottomLeft,
        height: 250,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width * 0.30,
                child: Column(children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(5)),
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Container(
                        height: 120,
                        child: Image.network(
                          ' controller.productsModel[index].url',
                          fit: BoxFit.fill,
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  CustomText(
                      text: 'hhxbkh cc souccxc',
                      size: 16,
                      aligment: Alignment.bottomLeft),
                  SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    text: '800\$',
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
        ));
  }
}
