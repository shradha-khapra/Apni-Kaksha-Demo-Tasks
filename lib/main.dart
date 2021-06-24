import "package:flutter/material.dart";
import 'package:shopit/core/themes/app_theme.dart';
import 'package:shopit/presentation/router/app_router.dart';

import 'core/constants/strings.dart';

void main() => runApp(Shopit());

class Shopit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Strings.appTitle,
      theme: AppTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouter.home,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
