import 'package:apnikaksha_cart_app/core/constants/colors.dart';
import 'package:apnikaksha_cart_app/provider/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: 10,
          itemBuilder: (context, index) {
            return ProductsCard();
          }),
    );
  }
}

class ProductsCard extends StatefulWidget {
  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  bool addMinusIcon = false;
  int itemCount = 0;
  String dropDownValue = '15 Kg';

  @override
  Widget build(BuildContext context) {
    int providerItemCount =
        Provider.of<CartProvider>(context).getCartItemsCount;

    return Container(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.26,
                  padding: EdgeInsets.only(left: 5.0),
                  child: Image(
                    image: AssetImage('assets/images/rice_bag_basmati.jpg'),
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 8.0),
                            child: Text(
                              "\$40",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Text(
                              "\$20",
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text('World best rich for health'),
                      // Text('Super Store-Indrapuram'),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DropdownButtonHideUnderline(
                            child: Container(
                              width: 80.0,
                              height: 40,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: DropdownButton<String>(
                                hint: Text(
                                  dropDownValue,
                                  style: TextStyle(color: Color(0xFF122082)),
                                ),
                                dropdownColor: Colors.white,
                                style: TextStyle(
                                  color: Color(0xFF122082),
                                ),
                                items: <String>[
                                  '15 Kg',
                                  '20 Kg',
                                  '30 Kg',
                                  '40 Kg'
                                ].map((String value) {
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
                            ),
                          ),
                          Container(
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
                                                Provider.of<CartProvider>(
                                                        context,
                                                        listen: false)
                                                    .decrementItemsQuantity(1);
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
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .incrementItemsQuantity(1);
                                        });
                                      } else {
                                        setState(() {
                                          itemCount += 1;
                                          Provider.of<CartProvider>(context,
                                                  listen: false)
                                              .incrementItemsQuantity(1);
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
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(20))),
              child: Text(
                "19% OFF",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
