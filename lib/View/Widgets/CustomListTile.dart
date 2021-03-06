import 'package:flutter/material.dart';

import '../../Constants.dart';
import 'CustomText.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;

  final Function onpress;

  CustomListTile({Key key, this.icon, this.onpress, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FlatButton(
        onPressed: onpress,
        child: ListTile(
          title: CustomText(
            text: title,
            size: 18,
          ),
          leading: Container(
              height: 60,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), color: colorprofile),
              child: Icon(icon, color: Colors.black)),
          trailing: Icon(
            Icons.navigate_next,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
