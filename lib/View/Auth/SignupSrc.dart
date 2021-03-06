import 'dart:io';

import 'package:Harmik/Core/ViewModel/Auth_viewmodel.dart';
import 'package:Harmik/View/Widgets/CustomButton.dart';
import 'package:Harmik/View/Widgets/CustomFormField.dart';
import 'package:Harmik/View/Widgets/CustomText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Constants.dart';
import 'LoginScr.dart';

class SignUpSrc extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var bodycon = SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.only(right: 10, left: 10, top: 70),
      child: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                CustomText(
                  text: "Sign Up".tr,
                  size: 30,
                  fontwegit: FontWeight.bold,
                ),
              ]),
              SizedBox(
                height: 35,
              ),
              Container(
                height: 100,
                child: CircleAvatar(
                  radius: 140,
                  backgroundColor: Colors.grey,
                  backgroundImage: controller.image == null
                      ? null
                      : FileImage(controller.image),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton.icon(
                        padding: EdgeInsets.all(5),
                        textColor: Theme.of(context).primaryColor,
                        onPressed: () async =>
                            await controller.addphoto(ImageSource.gallery),
                        icon: Icon(
                          Icons.image_outlined,
                          size: 35,
                        ),
                        label: Text("Add Image\nFrom Gallary".tr)),
                    FlatButton.icon(
                        padding: EdgeInsets.all(5),
                        textColor: Theme.of(context).primaryColor,
                        onPressed: () async =>
                            await controller.addphoto(ImageSource.camera),
                        icon: Icon(
                          Icons.photo_camera_outlined,
                          size: 35,
                        ),
                        label: Text("Add Image\nFrom Camera".tr)),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              CustomFormFiled(
                text: "Name".tr,
                hinttext: "David Spade".tr,
                onsave: (val) {
                  controller.username = val;
                },
                validte: (val) {
                  if (val == null) {
                    print("error");
                  }
                },
              ),
              SizedBox(
                height: 25,
              ),
              CustomFormFiled(
                text: "Email".tr,
                hinttext: "Email@mail.com",
                onsave: (val) {
                  controller.email = val;
                },
                validte: (input) =>
                    !input.contains('@') ? 'should_be_a_valid_email' : null,
              ),
              SizedBox(
                height: 25,
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
                    validator: (input) => input.length < 3
                        ? 'should be more than 6 letters'
                        : null,
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
                  SizedBox(
                    height: 22,
                  ),
                  GestureDetector(
                    onTap: () => Get.off(LoginScr()),
                    child: CustomText(
                      text: "Already have an Account ? ".tr,
                      color: kprimrycolor,
                      size: 15,
                      fontwegit: FontWeight.w500,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              if (controller.isloading == true)
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kprimrycolor),
                )
              else if (controller.isloading == false)
                CustomButton(
                  padding: 18,
                  text: "SIGN UP".tr,
                  onpress: () {
                    FocusScope.of(context).unfocus();
                    if (controller.image == null) {
                      return Get.snackbar(
                        "Error".tr,
                        'Add Image For Profile'.tr,
                        snackPosition: SnackPosition.TOP,
                        colorText: Colors.black,
                      );
                    }
                    _formkey.currentState.save();
                    if (_formkey.currentState.validate()) {
                      controller.signUp();
                    }
                  },
                ),
            ],
          ),
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
