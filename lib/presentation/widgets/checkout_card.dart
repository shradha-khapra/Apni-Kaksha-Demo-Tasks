import 'package:apnikaksha_cart_app/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class CheckoutCard extends StatefulWidget {
  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  @override
  Widget build(BuildContext context) {
    int itemCount = 0;
    bool addMinusIcon =
        Provider.of<CartProvider>(context, listen: false).getCartItemsCount > 0
            ? true
            : false;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        secondaryActions: <Widget>[
          Container(
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.all(5),
            // decoration: BoxDecoration(
            //   color: Colors.white,
            // ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey[300], offset: Offset(0, -2))
              ],
            ),
            child: IconSlideAction(
              foregroundColor: Colors.white,
              caption: 'Notes',
              color: Color(0xFFC8C8C8),
              icon: Icons.note_add_sharp,
              onTap: () {},
            ),
          ),
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(color: Colors.grey[300], offset: Offset(0, -2))
              ],
            ),
            child: IconSlideAction(
              caption: 'Delete',
              color: Color(0xFFFF6262),
              icon: Icons.delete,
              onTap: () {},
            ),
          ),
        ],
        actionPane: SlidableDrawerActionPane(),
        child: Padding(
          padding:
              EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Image(
                    height: 100.0,
                    image: AssetImage('assets/images/rice_bag_basmati.jpg'),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Spinach',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                            Text(
                              '1.22lbs',
                              style: TextStyle(fontSize: 17.0),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  '\$1.22',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF469A36),
                                      fontSize: 22.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                        if (addMinusIcon)
                          Padding(
                            padding: EdgeInsets.only(left: 0.0),
                            child: GestureDetector(
                              onTap: () {
                                if (Provider.of<CartProvider>(context,
                                            listen: false)
                                        .getCartItemsCount >
                                    0) {
                                  setState(() {
                                    itemCount -= 1;
                                    // ProductPage.cartItemsCount -= 1;
                                    Provider.of<CartProvider>(context,
                                            listen: false)
                                        .decrementItemsQuantity(1);
                                    if (Provider.of<CartProvider>(context,
                                                listen: false)
                                            .getCartItemsCount <=
                                        0) {
                                      addMinusIcon = false;
                                    }
                                  });
                                }
                              },
                              child: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.red,
                                size: 40.0,
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
        ),
      ),
    );
  }
}
