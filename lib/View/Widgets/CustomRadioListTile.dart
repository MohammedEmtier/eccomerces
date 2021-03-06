import 'package:flutter/material.dart';

import '../../Constants.dart';
import 'CustomText.dart';

class CustomRadioListTile extends StatelessWidget {
  final String value;
  final String subtitle;
  final String title;
  final String groupValue;
  final Function onChange;
  const CustomRadioListTile(
      {Key key,
      this.value,
      this.onChange,
      this.subtitle,
      this.title,
      this.groupValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      controlAffinity: ListTileControlAffinity.trailing,
      value: value,
      groupValue: groupValue,
      onChanged: onChange,
      activeColor: kprimrycolor,
      title: CustomText(
        text: title,
        size: 24,
      ),
      subtitle: CustomText(
        text: subtitle,
        size: 18,
      ),
    );
  }
}
