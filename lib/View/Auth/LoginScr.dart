import 'package:Harmik/Core/ViewModel/Auth_viewmodel.dart';
import 'package:Harmik/View/Widgets/CustomButton.dart';
import 'package:Harmik/View/Widgets/CustomFormField.dart';
import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:Harmik/View/Widgets/Customflatbutton.dart';
import 'package:Harmik/View/Widgets/or_divider.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:io';

import '../../Constants.dart';
import 'SignupSrc.dart';

class LoginScr extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bodycon = SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 60),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              CustomText(
                text: "Welcome,".tr,
                size: 30,
                fontwegit: FontWeight.bold,
              ),
              GestureDetector(
                onTap: () => Get.to(SignUpSrc()),
                child: CustomText(
                  text: "Sign Up".tr,
                  size: 18,
                  fontwegit: FontWeight.normal,
                  color: kprimrycolor,
                ),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            CustomText(
              aligment: Alignment.topLeft,
              text: 'Sign in to Continue'.tr,
              size: 14,
              color: Color.fromRGBO(146, 146, 146, 1),
            ),
            SizedBox(
              height: 30,
            ),
            CustomFormFiled(
              text: "Email".tr,
              hinttext: "Email@mail.com",
              onsave: (val) {
                controller.email = val;
              },
              validte: (val) {
                if (val == null) {
                  print("error");
                }
              },
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                CustomText(
                  text: "Password".tr,
                  color: Color.fromRGBO(0, 0, 0, 0.75),
                  size: 14,
                ),
                TextFormField(
                  obscureText: controller.obscure,
                  onSaved: (val) {
                    controller.password = val;
                  },
                  validator: (input) =>
                      input.length < 3 ? 'should be more than 6 letters' : null,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          child: Icon(controller.obscure == true
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onTap: () {
                            controller.obscsure();
                          }),
                      hintText: "******",
                      hintStyle: TextStyle(color: Colors.grey)),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: 'Forgot Password?'.tr,
              size: 14,
              color: kprimrycolor,
              aligment: Alignment.topRight,
            ),
            SizedBox(
              height: 20,
            ),
            if (controller.isloading == true)
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kprimrycolor),
              )
            else if (controller.isloading == false)
              CustomButton(
                padding: 18,
                text: "SIGN IN".tr,
                onpress: () {
                  FocusScope.of(context).unfocus();
                  _formkey.currentState.save();
                  if (_formkey.currentState.validate()) {
                    controller.signIn();
                  }
                },
              ),
            SizedBox(
              height: 20,
            ),
            OrDivider(),
            SizedBox(
              height: 40,
            ),
            FlatButtonCustom(
              text: ' Sign In with Facebook'.tr,
              icon: CommunityMaterialIcons.facebook,
              color: Colors.blueAccent,
              onpress: () {
                controller.facebookAuth();
              },
            ),
            SizedBox(
              height: 20,
            ),
            FlatButtonCustom(
              text: ' Sign In with Google'.tr,
              icon: CommunityMaterialIcons.google,
              color: Colors.red,
              onpress: () {
                controller.googleAuth();
              },
            ),
          ],
        ),
      ),
    ));
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: bodycon,
          )
        : Scaffold(
            body: bodycon,
          );
  }
}
