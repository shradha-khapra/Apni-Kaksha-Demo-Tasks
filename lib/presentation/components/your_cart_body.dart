import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/core/constants/utils.dart';
import 'package:shopit/core/themes/app_theme.dart';
import 'package:shopit/data/bloc/product_bloc.dart';
import 'package:shopit/data/models/product.dart';
import 'package:shopit/presentation/components/product_view.dart';

class YourCartBody extends StatelessWidget {
  final _theme = AppTheme.defaultTheme;

  @override
  Widget build(BuildContext context) {
    final _screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                top: Utils.defaultPadding,
                right: Utils.defaultPadding,
                left: Utils.defaultPadding),
            child: Text("Your Cart", style: _theme.textTheme.headline1),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: Utils.defaultPadding),
            child: Text(
                "There are currently ${BlocProvider.of<ProductBloc>(context).totalItems} items in your cart"),
          ),
          Expanded(
            child: ListView.builder(
                itemCount:
                    BlocProvider.of<ProductBloc>(context).cartProducts.length,
                itemBuilder: (context, index) {
                  Product _product =
                      BlocProvider.of<ProductBloc>(context).cartProducts[index];
                  return Dismissible(
                    background: Container(
                      color: AppTheme.defaultTheme.primaryColorLight,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.delete, color: Colors.white),
                            Text(
                              "Removing ${_product.productName} from cart",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    key: Key(_product.productId.toString()),
                    onDismissed: (direction) =>
                        BlocProvider.of<ProductBloc>(context)
                            .add(RemoveItemFromCart(product: _product)),
                    child: SingleProductView(
                        screenWidth: _screenWidth,
                        currentItem: _product,
                        isInCart: true),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(Utils.defaultPadding),
            child: Row(
              children: <Widget>[
                Text(
                  "Total Price: ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("₹${BlocProvider.of<ProductBloc>(context).totalCartCost}",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: AppTheme.defaultTheme.primaryColor)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
