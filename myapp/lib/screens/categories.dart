import 'package:flutter/material.dart';
import 'package:myapp/screens/SecondRoute.dart';

class Category extends StatefulWidget {
  // Category({Key? key, required this.title}) : super(key: key);
  // final String title;

  @override
  _MyCategory createState() => _MyCategory();
}

class _MyCategory extends State<Category> {
  @override
  Widget build(BuildContext context) {
    bool isCheck = true;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Second Route"),
        // ),
        body: Column(
      children: [
        Switch(
            value: isCheck,
            onChanged: (state) {
              setState(() {
                isCheck = state;
              });
            }),
        ElevatedButton(
          child: Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ],
    ));
  }
}
