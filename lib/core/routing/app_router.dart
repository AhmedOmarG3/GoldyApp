import 'package:flutter/material.dart';
import 'package:goldy/core/presention/home_view.dart';
import 'package:goldy/core/routing/app_routes.dart';
import 'package:goldy/features/gold/presentation/views/gold_view.dart';
import 'package:goldy/features/silver/presentation/views/silver_view.dart';

class AppRouter {
  Route generateRoute (RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (context) => HomeView(
          
        ));
        case AppRoutes.goldView:
        return MaterialPageRoute(builder: (context) => GoldView(
          
        ));
        case AppRoutes.silverView:
        return MaterialPageRoute(builder: (context) => SilverView(
          
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