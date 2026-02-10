import 'package:flutter/material.dart';
import 'package:goldy/core/presention/home_view.dart';
import 'package:goldy/core/routing/app_routes.dart';

class AppRouter {
  Route generateRoute (RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
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