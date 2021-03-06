import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'CustomText.dart';
import 'dart:io';

class FlatButtonCustom extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final Function onpress;

  const FlatButtonCustom(
      {Key key, this.text, this.onpress, this.icon, this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade100,
      ),
      child: Platform.isIOS
          ? CupertinoButton(
              borderRadius: BorderRadius.circular(10),
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    icon,
                    color: color,
                    size: 30,
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  CustomText(
                    text: text,
                    size: 14,
                  ),
                ],
              ),
              onPressed: onpress)
          : FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              onPressed: onpress,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    icon,
                    color: color,
                    size: 30,
                  ),
                  SizedBox(
                    width: 70,
                  ),
                  CustomText(
                    text: text,
                    size: 14,
                  ),
                ],
              ),
            ),
    );
  }
}
