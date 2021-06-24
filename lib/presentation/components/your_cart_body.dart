import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/core/constants/utils.dart';
import 'package:shopit/core/themes/app_theme.dart';
import 'package:shopit/data/bloc/product_bloc.dart';
import 'package:shopit/data/models/product.dart';

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
          Expanded(
            child: ListView.builder(
                itemCount:
                    BlocProvider.of<ProductBloc>(context).cartProducts.length,
                itemBuilder: (context, index) {
                  Product _product =
                      BlocProvider.of<ProductBloc>(context).cartProducts[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: Image.asset(_product.imagePath!),
                            height: 160,
                          ),
                          SizedBox(width: 25),
                          Expanded(child: Text('${_product.productName}')),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  '${_product.productPrice}\$',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    "In Cart: ${BlocProvider.of<ProductBloc>(context).quantityOfEachId[_product.productId]}"),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                BlocProvider.of<ProductBloc>(context)
                                    .add(DeleteFromCart(product: _product)),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          BlocProvider.of<ProductBloc>(context).cartProducts.length > 0
              ? Card(
                  elevation: 12,
                  child: Container(
                    width: double.infinity,
                    color: Colors.deepOrange,
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "Total Price: ${BlocProvider.of<ProductBloc>(context).totalCartCost}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
