import 'package:flutter/material.dart';
import 'package:goldy/core/presention/home_view.dart';

class AppRouter {
  Route generateRoute (RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => HomeView(
          
        ));
      default:
        return MaterialPageRoute(builder: (context) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ));
    }
  }
}