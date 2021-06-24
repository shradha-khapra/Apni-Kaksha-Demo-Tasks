import 'package:flutter/material.dart';
import 'package:shopit/core/constants/utils.dart';
import 'package:shopit/core/themes/app_theme.dart';

class YourCartBody extends StatelessWidget {
  final _theme = AppTheme.defaultTheme;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: Utils.defaultPadding,
              right: Utils.defaultPadding,
              left: Utils.defaultPadding),
          child: Text("Your Cart", style: _theme.textTheme.headline1),
        ),
      ],
    );
  }
}
