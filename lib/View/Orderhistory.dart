import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bodycon =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(
        'assets/Svg/order.svg',
        width: 200,
        height: 200,
      ),
      SizedBox(
        height: 28,
      ),
      Container(
        alignment: Alignment.topCenter,
        child: Text(
          "No Order History added",
          style: GoogleFonts.roboto(fontSize: 30),
        ),
      )
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
