import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmOrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bodycon =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset(
        'assets/Svg/undraw_order_confirmed_aaw7.svg',
        width: 200,
        height: 200,
      ),
      SizedBox(
        height: 25,
      ),
      Container(
        alignment: Alignment.topCenter,
        child: Text(
          "Order Confirmed",
          style: GoogleFonts.roboto(fontSize: 30),
        ),
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
