import 'package:flutter/material.dart';
import 'package:goldy/core/networking/dio_helper.dart';
import 'package:goldy/core/routing/app_router.dart';
import 'package:goldy/core/routing/app_routes.dart';

void main() {
   DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
