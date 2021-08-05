import 'package:flutter/material.dart';

Widget buttonWidget({
  @required lable,
  @required colorButton,
  @required colorText,
  @required onPress,
}) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 15, bottom: 15, right: 40, left: 40),
      decoration: BoxDecoration(
        color: colorButton,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        lable,
        style: TextStyle(color: colorText, fontSize: 15),
      ),
    ),
    onTap: onPress,
  );
}
