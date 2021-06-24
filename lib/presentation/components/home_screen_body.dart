import 'package:flutter/material.dart';
import 'package:shopit/core/constants/utils.dart';
import 'package:shopit/core/themes/app_theme.dart';
import 'package:shopit/data/models/demi_data.dart';
import 'package:shopit/data/models/product.dart';
import 'package:shopit/presentation/components/home_screen_categories.dart';
import 'package:shopit/presentation/components/product_view.dart';

class HomeScreenBody extends StatelessWidget {
  final _theme = AppTheme.defaultTheme;
  final List<Product>? riceList;

  HomeScreenBody({Key? key, this.riceList}) : super(key: key);

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
          child: Text("Browse Products", style: _theme.textTheme.headline1),
        ),
        Categories(),
        Expanded(
            child: ListView.builder(
                itemCount: riceList!.length,
                itemBuilder: (context, index) => SingleProductView(
                      screenWidth: _screenWidth,
                      riceList: riceList,
                      currentItem: riceList![index],
                    ))),
      ],
    );
  }
}
