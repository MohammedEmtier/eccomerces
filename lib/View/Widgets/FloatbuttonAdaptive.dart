import 'package:flutter/material.dart';

import '../../Constants.dart';

class FlaotingButtonAdaptive extends StatelessWidget {
  final Function onpress;
  final IconData icon;
  const FlaotingButtonAdaptive({Key key, this.onpress, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(30),
        ),
        child: GestureDetector(
          onTap: onpress,
          child: Icon(
            icon,
            color: kprimrycolor,
          ),
        ),
      ),
    );
  }
}
