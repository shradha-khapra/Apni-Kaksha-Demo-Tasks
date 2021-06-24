import 'package:flutter/material.dart';
import 'package:shopit/core/exceptions/route_exception.dart';
import 'package:shopit/presentation/screens/home_screens.dart';
import 'package:shopit/presentation/screens/your_cart.dart';

class AppRouter {
  static const String home = "/";
  static const String cart = "/cart";

  const AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case cart:
        return MaterialPageRoute(
          builder: (_) => ShoppingCartScreen(),
        );
      default:
        throw const RouteException('Route not found!');
    }
  }
}
