import 'package:flutter/material.dart';
import 'package:getx/screens/home_screen/home_screen.dart';
import 'package:getx/screens/home_screen/information_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    print(args);

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/info':
        return MaterialPageRoute(builder: (_) => InformationScreen());
      default:
        return _errorPage();
    }
  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
