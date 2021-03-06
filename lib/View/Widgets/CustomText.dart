import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  final FontWeight fontwegit;
  final Alignment aligment;
  final double hegit;

  const CustomText({
    Key key,
    this.text = '',
    this.size = 16,
    this.color = Colors.black,
    this.fontwegit = FontWeight.normal,
    this.aligment = Alignment.topLeft,
    this.hegit = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: aligment,
      child: Text(
        text,
        style: TextStyle(
            fontFamily: 'GoogleFonts.sourceCodePro()',
            height: hegit,
            fontSize: size,
            color: color,
            fontWeight: fontwegit),
      ),
    );
  }
}
