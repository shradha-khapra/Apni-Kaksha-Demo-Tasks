import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopit/core/constants/utils.dart';
import 'package:shopit/core/themes/app_theme.dart';
import 'package:shopit/data/bloc/product_bloc.dart';
import 'package:shopit/data/models/demi_data.dart';
import 'package:shopit/data/models/product.dart';
import 'package:shopit/presentation/components/home_screen_body.dart';
import 'package:shopit/presentation/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  final _theme = AppTheme.defaultTheme;
  final _dataService = DummyDataService();

  List<Product> getProducts() {
    return _dataService.getRiceProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(context),
      body: HomeScreenBody(riceList: getProducts()),
    );
  }

  AppBar _createAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: _theme.backgroundColor,
      elevation: 0,
      title: SvgPicture.asset(
        "assets/icons/logo.svg",
        height: 50,
      ),
      actions: <Widget>[
        Stack(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.cart);
              },
              icon: Icon(Icons.shopping_cart),
            ),
            Align(
              alignment: Alignment.topRight,
              child: BlocBuilder<ProductBloc, BlocState>(
                builder: (context, state) {
                  var itemCount =
                      BlocProvider.of<ProductBloc>(context).totalItems;
                  if (itemCount == 0) {
                    return Container();
                  }
                  return CircleAvatar(
                    radius: 12,
                    backgroundColor: _theme.primaryColor,
                    child: Text(
                      "${BlocProvider.of<ProductBloc>(context).totalItems}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        SizedBox(width: Utils.defaultPadding / 2),
      ],
    );
  }
}
