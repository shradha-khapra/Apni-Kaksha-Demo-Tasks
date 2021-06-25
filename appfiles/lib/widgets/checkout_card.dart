import 'package:ak/models/cart_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class CheckoutCard extends StatefulWidget {
  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  int itemCount = 0;
  @override
  Widget build(BuildContext context) {
    bool addMinusIcon =
        Provider.of<Cart>(context, listen: false).getCartItemsCount() > 0
            ? true
            : false;
    return Slidable(
      secondaryActions: <Widget>[
        Container(
          decoration: BoxDecoration(
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
          decoration: BoxDecoration(
            color: Colors.white,
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
        padding: EdgeInsets.only(left: 0.0, right: 0.0, top: 0.0, bottom: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(left: 5.0),
                  child: Image(
                    height: 100.0,
                    image: AssetImage('assets/images/rice_bag1.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Basmati',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      'each',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    Row(
                      children: [
                        Text(
                          '₹20',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF469A36),
                              fontSize: 22.0),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 80.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xFFe8e8e8),
                            ),
                            child: Row(
                              children: [
                                addMinusIcon
                                    ? Padding(
                                        padding: EdgeInsets.only(left: 0.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            if (Provider.of<Cart>(context,
                                                        listen: false)
                                                    .getCartItemsCount() >
                                                0) {
                                              setState(() {
                                                itemCount -= 1;
                                                Provider.of<Cart>(context,
                                                        listen: false)
                                                    .decrementCartItemsCount(1);
                                                if (Provider.of<Cart>(context,
                                                            listen: false)
                                                        .getCartItemsCount() <=
                                                    0) {
                                                  addMinusIcon = false;
                                                }
                                              });
                                            }
                                          },
                                          child: Container(),
                                        ),
                                      )
                                    : SizedBox(
                                        width: 0.0,
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
