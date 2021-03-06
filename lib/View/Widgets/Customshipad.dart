import 'package:flutter/material.dart';

import '../../Constants.dart';
import 'CustomText.dart';

class Customshipadd extends StatelessWidget {
  final String text;
  final String title;
  final bool defaults;
  Customshipadd({Key key, this.text, this.title, this.defaults});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: title,
          size: 18,
          fontwegit: FontWeight.w700,
        ),
        SizedBox(
          height: 15,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          CustomText(
            text: text,
          ),
          if (defaults == true)
            Icon(
              Icons.check_circle_outline_rounded,
              color: kprimrycolor,
            ),
        ]),
        SizedBox(
          height: 15,
        ),
        CustomText(text: "Change", color: kprimrycolor, size: 14),
      ],
    );
  }
}
