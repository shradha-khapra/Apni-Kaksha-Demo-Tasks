import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shopit/core/themes/app_theme.dart';
import 'package:shopit/data/bloc/product_bloc.dart';
import 'package:shopit/presentation/components/your_cart_body.dart';

class ShoppingCartScreen extends StatelessWidget {
  final _theme = AppTheme.defaultTheme;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, BlocState>(
      builder: (context, state) => Scaffold(
        appBar: _createAppBar(),
        body: YourCartBody(),
      ),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      backgroundColor: _theme.backgroundColor,
      elevation: 0,
      title: SvgPicture.asset(
        "assets/icons/logo.svg",
        height: 50,
      ),
    );
  }
}
