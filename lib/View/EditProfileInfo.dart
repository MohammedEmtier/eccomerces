import 'dart:io';

import 'package:Harmik/Constants.dart';
import 'package:Harmik/Core/ViewModel/ProfileViewmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bodycon = GetBuilder<ProfileViewModel>(
        builder: (controller) => Padding(
              padding: const EdgeInsets.only(top: 60.0, left: 20, right: 20),
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(controller.user.uid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    final docs = snapshot.data;
                    DateTime myDateTime = (docs['time']).toDate();
                    var datejoin =
                        DateFormat.yMMMd().add_jm().format(myDateTime);
                    return snapshot.hasData
                        ? Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Column(children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        docs['pic'],
                                      ),
                                      radius: 125,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    ListTile(
                                      focusColor: Colors.white,
                                      leading: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Icon(
                                          Icons.verified_rounded,
                                          color: kprimrycolor,
                                        ),
                                      ),
                                      title: Text(
                                        "Name On Profile".tr,
                                      ),
                                      subtitle: Text(
                                        "${docs['name']}",
                                      ),
                                    ),
                                    ListTile(
                                      focusColor: Colors.white,
                                      leading: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Icon(
                                          Icons.date_range,
                                          color: kprimrycolor,
                                        ),
                                      ),
                                      title: Text(
                                        "Date Joined".tr,
                                        style: TextStyle(),
                                      ),
                                      subtitle: Text(
                                        "$datejoin",
                                        style: TextStyle(),
                                      ),
                                    ),
                                    ListTile(
                                      focusColor: Colors.white,
                                      leading: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Icon(
                                          Icons.email,
                                          color: kprimrycolor,
                                        ),
                                      ),
                                      title: Text(
                                        "Email".tr,
                                        style: TextStyle(),
                                      ),
                                      subtitle: Text(
                                        "${docs['email']}",
                                        style: TextStyle(),
                                      ),
                                    ),
                                  ]),
                                )
                              ],
                            ),
                          )
                        : Center(
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(kprimrycolor),
                            ),
                          );
                  }),
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
