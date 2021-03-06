import 'dart:io';

import 'package:Harmik/Core/ViewModel/AppLanguage.dart';
import 'package:Harmik/Core/ViewModel/ProfileViewmodel.dart';
import 'package:Harmik/View/CreditCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../Constants.dart';
import 'EditProfileInfo.dart';
import 'Orderhistory.dart';
import 'ShippingAddress.dart';
import 'package:Harmik/View/Widgets/CustomListTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Widgets/CustomText.dart';

class ProfileScr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bodycon = GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder: (controller) => Container(
              padding: EdgeInsets.only(top: 35),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(controller.user.uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          final docs = snapshot.data;
                          return snapshot.hasData
                              ? Container(
                                  margin: EdgeInsets.all(40),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(docs['pic']),
                                        radius: 60,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${docs['name']}',
                                            style: GoogleFonts.roboto(
                                              fontSize: 28,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          CustomText(
                                            text: '${docs['email']}',
                                            aligment: Alignment.topCenter,
                                            size: 15,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              : Center(
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        kprimrycolor),
                                  ),
                                );
                        }),
                    CustomListTile(
                        title: 'Edit Profile'.tr,
                        icon: Icons.edit,
                        onpress: () => Get.to(EditProfileInfo())),
                    SizedBox(
                      height: 20,
                    ),
                    CustomListTile(
                      title: 'Shipping Address'.tr,
                      icon: Icons.location_on,
                      onpress: () => Get.to(ShippingAddress()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomListTile(
                      title: 'Order History'.tr,
                      icon: CommunityMaterialIcons.history,
                      onpress: () => Get.to(OrderHistory()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomListTile(
                      title: 'Cards'.tr,
                      icon: CommunityMaterialIcons.cards,
                      onpress: () => Get.to(CreditCard()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomListTile(
                      title: 'Notifications'.tr,
                      icon: Icons.notifications,
                      onpress: () {},
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GetBuilder<AppLanguage>(
                        init: AppLanguage(),
                        builder: (cond) => Container(
                              width: MediaQuery.of(context).size.width * 0.923,
                              child: ExpansionTile(
                                leading: Container(
                                    height: 60,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: colorprofile),
                                    child: Icon(Icons.language,
                                        color: Colors.black)),
                                trailing: Icon(
                                  Icons.navigate_next,
                                  color: Colors.black,
                                ),
                                title: Text(
                                  "Language".tr,
                                  style: new TextStyle(),
                                  textAlign: TextAlign.left,
                                ),
                                children: <Widget>[
                                  Container(
                                    child: FlatButton(
                                      onPressed: () {
                                        cond.chagnelanguage('ar');
                                        Get.updateLocale(Locale('ar'));
                                      },
                                      child: ListTile(
                                        title: CustomText(
                                          text: "Arabic".tr,
                                          size: 18,
                                        ),
                                        leading: Icon(Icons.language,
                                            color: Colors.black),
                                        trailing: Icon(
                                          Icons.navigate_next,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: FlatButton(
                                      onPressed: () {
                                        cond.chagnelanguage('en');
                                        Get.updateLocale(Locale('en'));
                                      },
                                      child: ListTile(
                                        title: CustomText(
                                          text: "English".tr,
                                          size: 18,
                                        ),
                                        leading: Icon(Icons.language,
                                            color: Colors.black),
                                        trailing: Icon(
                                          Icons.navigate_next,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                    SizedBox(
                      height: 20,
                    ),
                    CustomListTile(
                      title: 'Privcy Policy'.tr,
                      icon: CommunityMaterialIcons.security,
                      onpress: () => controller.launchURL(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomListTile(
                      title: 'Log Out'.tr,
                      icon: CommunityMaterialIcons.logout,
                      onpress: () async {
                        await FirebaseAuth.instance.signOut();
                      },
                    ),
                    SizedBox(
                      height: 20,
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
