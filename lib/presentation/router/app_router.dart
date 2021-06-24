import 'package:flutter/material.dart';
import 'package:shopit/core/exceptions/route_exception.dart';
import 'package:shopit/presentation/screens/home_screens.dart';

class AppRouter {
  static const String home = '/';

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
