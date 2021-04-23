import 'package:apni_kaksha_cart_app/constants.dart';
import 'package:apni_kaksha_cart_app/models/cart_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsCard extends StatefulWidget {
  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  bool addMinusIcon = false;
  int itemCount = 0;
  String dropDownValue = '5 Kg';

  @override
  Widget build(BuildContext context) {
    int providerItemCount = Provider.of<CartData>(context).getCartItemsCount();

    return Padding(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
        ),
        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 5.0),
                child: Image(
                  image: AssetImage('assets/images/rice_bag1.jpg'),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                        child: Text(
                          "\$25",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          "\$30",
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        decoration: BoxDecoration(
                          color: kAppPrimaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          "\$28% OFF",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('Gold Plus Basmati Rice for healthy family'),
                  Text('Super Store-Indrapuram'),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      DropdownButton<String>(
                        hint: Text(
                          dropDownValue,
                          style: TextStyle(color: Color(0xFF122082)),
                        ),
                        dropdownColor: Colors.white,
                        style: TextStyle(
                          color: Color(0xFF122082),
                        ),
                        items: <String>['5 Kg', '10 Kg', '20 Kg', '30 Kg']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            dropDownValue = newValue;
                          });
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 80.0),
                        child: Container(
                          // padding: EdgeInsets.fromLTRB(20.0, 5.0, 0.0, 5.0),
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
                                          if (itemCount > 0) {
                                            setState(() {
                                              itemCount -= 1;
                                              // ProductPage.cartItemsCount -= 1;
                                              Provider.of<CartData>(context,
                                                      listen: false)
                                                  .decrementCartItemsCount(1);
                                              if (itemCount <= 0) {
                                                addMinusIcon = false;
                                              }
                                            });
                                          }
                                        },
                                        child: Icon(
                                          Icons.remove_circle,
                                          color: Colors.orange,
                                          size: 40.0,
                                        ),
                                      ),
                                    )
                                  : SizedBox(
                                      width: 0.0,
                                    ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    addMinusIcon ? 10.0 : 20.0,
                                    10.0,
                                    0.0,
                                    10.0),
                                child: Text(
                                  itemCount == 0
                                      ? 'ADD'
                                      : providerItemCount < 0
                                          ? '0'
                                          : providerItemCount.toString(),
                                  style: TextStyle(
                                      color: itemCount == 0
                                          ? Colors.orange
                                          : Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    if (itemCount == 0) {
                                      setState(() {
                                        addMinusIcon = true;
                                        itemCount += 1;
                                        // ProductPage.cartItemsCount += 1;
                                        Provider.of<CartData>(context,
                                                listen: false)
                                            .incrementCartItemsCount(1);
                                      });
                                    } else {
                                      setState(() {
                                        itemCount += 1;
                                        Provider.of<CartData>(context,
                                                listen: false)
                                            .incrementCartItemsCount(1);
                                      });
                                    }
                                  },
                                  child: Icon(
                                    Icons.add_circle,
                                    color: Colors.orange,
                                    size: 40.0,
                                  ),
                                ),
                              )
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
    );
  }
}
