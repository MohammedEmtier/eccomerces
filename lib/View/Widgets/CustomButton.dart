import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Constants.dart';
import 'CustomText.dart';
import 'dart:io';

class CustomButton extends StatelessWidget {
  final String text;
  final double padding;
  final Function onpress;

  const CustomButton({Key key, this.text, this.padding = 30, this.onpress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Platform.isIOS
          ? CupertinoButton(
              padding: EdgeInsets.all(padding),
              borderRadius: BorderRadius.circular(padding),
              color: kprimrycolor,
              child: CustomText(
                text: text,
                size: 16,
                color: Colors.white,
                aligment: Alignment.center,
              ),
              onPressed: onpress)
          : FlatButton(
              padding: EdgeInsets.all(padding),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              color: kprimrycolor,
              onPressed: onpress,
              child: CustomText(
                text: text,
                size: 14,
                color: Colors.white,
                aligment: Alignment.center,
              ),
            ),
    );
  }
}
