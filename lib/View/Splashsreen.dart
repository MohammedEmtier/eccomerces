import 'package:Harmik/Constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Holdermain.dart';

class Splashscr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      image: Image.asset(
        "assets/Category/iconfinder_5_-_Shopping_Bag_2102067.png",
        alignment: Alignment.bottomCenter,
      ),
      photoSize: 150,
      seconds: 2,
      loaderColor: kprimrycolor,
      loadingText: Text("Harmik",
          style: TextStyle(
              fontFamily: 'Sacramento', fontSize: 30, color: Colors.black)),
      navigateAfterSeconds: Holdermain(),
    );
  }
}
