import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/route_generator.dart';
import 'package:getx/screens/home_screen/home_screen.dart';
import 'package:getx/screens/home_screen/information_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // home: HomeScreen(),
      // initialRoute: '/',
      // onGenerateRoute: RouteGenerator.generateRoute,
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   '/details': (context) => InformationScreen(),
      // },
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
        ),
        GetPage(
          name: '/info',
          page: () => InformationScreen(),
        ),
      ],
    );
  }
}
