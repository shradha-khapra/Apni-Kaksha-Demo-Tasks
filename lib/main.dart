import 'package:apnikaksha_cart_app/core/theme/theme.dart';
import 'package:apnikaksha_cart_app/presentation/screens/home_screen.dart';
import 'package:apnikaksha_cart_app/provider/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider<CartData>(create: (_) => CartData())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: lightThemeData,
        initialRoute: "/",
        routes: {
          "/": (context) => HomeScreen(),
        },
      ),
    );
  }
}
