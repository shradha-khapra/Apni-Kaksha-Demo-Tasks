import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopit/core/constants/utils.dart';
import 'package:shopit/core/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  final _theme = AppTheme.defaultTheme;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _createAppBar());
  }

  AppBar _createAppBar() {
    return AppBar(
      backgroundColor: _theme.backgroundColor,
      elevation: 0,
      title: Text("Browse Products"),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            "assets/icons/cart.svg",
            color: _theme.accentColor,
          ),
        ),
        SizedBox(width: Utils.defaultPadding / 2),
      ],
    );
  }
}
