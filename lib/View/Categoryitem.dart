import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bodycon =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(
        'assets/Svg/dd.svg',
        width: 160,
        height: 200,
      ),
      SizedBox(
        height: 25,
      ),
      Container(
        alignment: Alignment.topCenter,
        child: Text(
          "No Item Added".tr,
          style: GoogleFonts.roboto(fontSize: 30),
        ),
      ),
      SizedBox(
        height: 25,
      ),
    ]);
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: _bodycon,
          )
        : Scaffold(
            body: _bodycon,
          );
  }
}
