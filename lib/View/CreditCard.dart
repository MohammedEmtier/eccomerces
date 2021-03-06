import 'dart:io';

import 'package:Harmik/Constants.dart';
import 'package:Harmik/View/Widgets/CustomButton.dart';
import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

import 'Widgets/CustomFormField.dart';
import 'Widgets/FloatbuttonAdaptive.dart';

class CreditCard extends StatelessWidget {
  final List<String> cards = [];
  final int nums = 450545245545652;
  final int cvv = 325;
  final int month = 09;
  final int year = 2022;
  @override
  Widget build(BuildContext context) {
    var _bodycon = cards.isEmpty
        ? Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              'assets/Svg/gg.svg',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Text(
                "No Credit Card added",
                style: GoogleFonts.roboto(fontSize: 30),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: FlaotingButtonAdaptive(
                icon: Icons.add,
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
                                    text: 'Card Number'.tr,
                                    color: Color.fromRGBO(0, 0, 0, 0.75),
                                    size: 14,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.credit_card,
                                          color: kprimrycolor,
                                        ),
                                        hintText: '44535668962563'.tr,
                                        hintStyle:
                                            TextStyle(color: Colors.grey)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              CustomFormFiled(
                                text: 'Name Holder'.tr,
                                hinttext: 'Harvey Joans'.tr,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Container(
                                width: Get.width,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: CustomFormFiled(
                                        text: 'Month'.tr,
                                        hinttext: '02'.tr,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Expanded(
                                      child: CustomFormFiled(
                                        text: 'Year'.tr,
                                        hinttext: '23'.tr,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              CustomButton(
                                text: 'Link Card',
                                padding: 20,
                                onpress: () {},
                              )
                            ],
                          ),
                        ),
                      ));
                },
              ),
            ),
          ])
        : Padding(
            padding: EdgeInsets.only(top: 50),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.credit_card,
                    color: kprimrycolor,
                    size: 35,
                  ),
                  title: CustomText(
                    text: 'Credit Card',
                    size: 22,
                  ),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      CustomText(
                        text: "$nums\n",
                        size: 18,
                      ),
                      CustomText(
                        text: '$cvv\n\n$month $year',
                      ),
                      if (cards.length > 1)
                        SizedBox(
                          height: 20,
                        ),
                      Divider(),
                    ],
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
