import 'package:apni_kaksha_cart_app/models/cart_data.dart';
import 'package:apni_kaksha_cart_app/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // State Management -> I am using Provider Package by flutter for state management
    return ChangeNotifierProvider(
      create: (context) => CartData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Apni Kaksha Cart App',
        theme: ThemeData(
          primaryColor: kAppPrimaryColor,
        ),
        home: ProductsPage(),
      ),
    );
  }
}
