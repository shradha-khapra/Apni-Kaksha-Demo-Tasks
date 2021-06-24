import "package:flutter/material.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopit/core/constants/utils.dart';
import 'package:shopit/core/themes/app_theme.dart';
import 'package:shopit/data/bloc/product_bloc.dart';
import 'package:shopit/data/models/product.dart';

class SingleProductView extends StatelessWidget {
  const SingleProductView({
    Key? key,
    required double screenWidth,
    required this.riceList,
    this.currentItem,
  })  : _screenWidth = screenWidth,
        super(key: key);

  final double _screenWidth;
  final List<Product>? riceList;
  final Product? currentItem;

  @override
  Widget build(BuildContext context) {
    Product _currentItem = currentItem!;
    return Padding(
      padding: const EdgeInsets.all(Utils.defaultPadding),
      child: Container(
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.asset(_currentItem.imagePath!),
              height: 160,
            ),
            Padding(
              padding: const EdgeInsets.only(top: Utils.defaultPadding),
              child: SizedBox(
                width: _screenWidth * 0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _currentItem.productName!,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      _currentItem.description!,
                    ),
                    Text(
                      "₹${_currentItem.productPrice!}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.defaultTheme.primaryColor,
                      ),
                    ),
                    BlocBuilder<ProductBloc, BlocState>(
                        builder: (context, state) {
                      var quantityInCart = BlocProvider.of<ProductBloc>(context)
                          .quantityOfEachId[_currentItem.productId]!;
                      if (quantityInCart > 0) {
                        return Container(
                          width: _screenWidth,
                          child: Row(
                            children: [
                              QuantityToCart(
                                screenWidth: _screenWidth,
                                iconAction: () =>
                                    BlocProvider.of<ProductBloc>(context).add(
                                        DeleteFromCart(product: _currentItem)),
                                icon: Icon(Icons.remove),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: _screenWidth / 9,
                                width: _screenWidth / 7,
                                child: Text(
                                  "${BlocProvider.of<ProductBloc>(context).quantityOfEachId[_currentItem.productId]}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              QuantityToCart(
                                screenWidth: _screenWidth,
                                iconAction: () =>
                                    BlocProvider.of<ProductBloc>(context)
                                        .add(AddToCart(product: _currentItem)),
                                icon: Icon(Icons.add),
                              ),
                            ],
                          ),
                        );
                      }

                      return AddToBagButton(
                          screenWidth: _screenWidth,
                          currentProduct: _currentItem);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuantityToCart extends StatelessWidget {
  final iconAction;
  final icon;
  const QuantityToCart({
    Key? key,
    required double screenWidth,
    this.iconAction,
    this.icon,
  })  : _screenWidth = screenWidth,
        super(key: key);

  final double _screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _screenWidth / 9,
      width: _screenWidth / 9,
      color: AppTheme.defaultTheme.primaryColor,
      child: IconButton(
        color: Colors.white,
        icon: icon,
        onPressed: iconAction,
      ),
    );
  }
}

class AddToBagButton extends StatelessWidget {
  final Product? currentProduct;
  const AddToBagButton({
    Key? key,
    required double screenWidth,
    required this.currentProduct,
  })  : _screenWidth = screenWidth,
        super(key: key);

  final double _screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: Utils.defaultPadding / 4),
      child: Container(
        width: _screenWidth,
        color: AppTheme.defaultTheme.primaryColor,
        child: TextButton(
          child: Text(
            "Add To Bag",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () => BlocProvider.of<ProductBloc>(context)
              .add(AddToCart(product: currentProduct)),
        ),
      ),
    );
  }
}
