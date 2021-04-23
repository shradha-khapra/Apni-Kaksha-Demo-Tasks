import 'package:apni_kaksha_cart_app/constants.dart';
import 'package:apni_kaksha_cart_app/models/cart_data.dart';
import 'package:apni_kaksha_cart_app/widgets/checkout_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double subTotalValue = 0.0;

  @override
  Widget build(BuildContext context) {
    int itemCount = Provider.of<CartData>(context).getCartItemsCount();
    subTotalValue = (itemCount * 3.62);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Your Cart',
              style: TextStyle(
                fontSize: 23.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
          ],
        ),
      ),
      // extendBody: true,
      body: Container(
        color: Color(0xFFe8e8e8),
        child: Column(
          children: [
            Container(
              color: Color(0xFF469A36),
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ordering : Today, 11am - noon',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: kAppPrimaryColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          'FREE',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: Provider.of<CartData>(context).getCartItemsCount(),
                  itemBuilder: (context, index) {
                    return CheckoutCard();
                  }),
            ),
            BottomAppBar(
              child: Container(
                width: double.infinity,
                color: Colors.white10,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Subtotal : \$${subTotalValue}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 100.0),
                        decoration: BoxDecoration(
                            color: kAppPrimaryColor,
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Text(
                          'Checkout Now',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ),
                    ),
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
