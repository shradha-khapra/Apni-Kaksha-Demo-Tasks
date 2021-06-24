import 'package:flutter/material.dart';
import 'package:shopit/core/constants/utils.dart';
import 'package:shopit/core/themes/app_theme.dart';
import 'package:shopit/presentation/components/home_screen_categories.dart';

class HomeScreenBody extends StatelessWidget {
  final _theme = AppTheme.defaultTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Utils.defaultPadding),
          child: Text("Browse Products", style: _theme.textTheme.headline1),
        ),
        Categories(),
      ],
    );
  }
}
