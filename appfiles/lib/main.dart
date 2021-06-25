import 'package:ak/constants.dart';
import 'package:ak/models/cart_data.dart';
import 'package:ak/screens/product_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Apni Kaksha Cart App',
        theme: ThemeData(
          primaryColor: appPrimaryColor,
        ),
        home: ProductsPage(),
      ),
    );
  }
}