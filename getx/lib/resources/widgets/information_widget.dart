import 'package:flutter/material.dart';

Widget informationWidget({@required label, @required content}) {
  return Container(
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(flex: 1, child: Text(label)),
        Expanded(flex: 1, child: Text(content))
      ],
    ),
  );
}
