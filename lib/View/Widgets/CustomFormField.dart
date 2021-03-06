import 'package:flutter/material.dart';

import 'CustomText.dart';

class CustomFormFiled extends StatelessWidget {
  final String hinttext;
  final String text;
  final Function onsave;
  final Function validte;

  const CustomFormFiled(
      {Key key, this.hinttext, this.onsave, this.validte, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          color: Color.fromRGBO(0, 0, 0, 0.75),
          size: 14,
        ),
        TextFormField(
          onSaved: onsave,
          validator: validte,
          decoration: InputDecoration(
              hintText: hinttext, hintStyle: TextStyle(color: Colors.grey)),
        ),
      ],
    );
  }
}
