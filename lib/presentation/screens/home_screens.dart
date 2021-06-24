import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopit/core/constants/utils.dart';
import 'package:shopit/core/themes/app_theme.dart';
import 'package:shopit/data/models/demi_data.dart';
import 'package:shopit/data/models/product.dart';
import 'package:shopit/presentation/components/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  final _theme = AppTheme.defaultTheme;
  final _dataService = DummyDataService();

  List<Product> getProducts() {
    return _dataService.getRiceProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: HomeScreenBody(riceList: getProducts()),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      backgroundColor: _theme.backgroundColor,
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
        ),
      ),
      elevation: 0,
      title: SvgPicture.asset(
        "assets/icons/logo.svg",
        height: 50,
      ),
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
