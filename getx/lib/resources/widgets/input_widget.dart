import 'package:flutter/material.dart';

Widget inputWidget({
  @required label,
  @required hintText,
  @required controller,
}) {
  return Container(
    padding: EdgeInsets.all(10),
    child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        hintText: hintText,
      ),
      controller: controller,
    ),
  );
}
