import 'package:apnikaksha_cart_app/presentation/widgets/checkout_card.dart';
import 'package:apnikaksha_cart_app/presentation/widgets/top_bar_card.dart';
import 'package:apnikaksha_cart_app/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static String route = "cart-screen";
  @override
  Widget build(BuildContext context) {
    int itemCount = Provider.of<CartProvider>(context).getCartItemsCount;
    double subTotalValue = (itemCount ?? 0 * 3.62).toDouble();

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

      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          color: Colors.white10,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Subtotal : \$ ${subTotalValue}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
                child: MainButton(label: 'Checkout Now'),
              ),
            ],
          ),
        ),
      ),
      // extendBody: true,
      body: Container(
        child: Column(
          children: [
            TopSnapBar(
              notificationText: 'Ordering : Today, 11am - noon',
              actionText: "Free",
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  physics: BouncingScrollPhysics(),
                  itemCount:
                      Provider.of<CartProvider>(context).getCartItemsCount,
                  itemBuilder: (context, index) {
                    return CheckoutCard();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class MainButton extends StatelessWidget {
  final String label;
  const MainButton({
    Key key,
    @required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Color(0xff5CC248),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
      ),
      onPressed: () {},
      child: Text(
        label,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
    );
  }
}
