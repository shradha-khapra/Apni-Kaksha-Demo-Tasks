import 'package:ak/constants.dart';
import 'package:ak/models/cart_data.dart';
import 'package:ak/models/price.dart';
import 'package:ak/models/product_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ProductsCard extends StatefulWidget {
  final Product productInfo;
  final PriceItem price;

  const ProductsCard({Key key, this.productInfo, this.price}) : super(key: key);

  @override
  _ProductsCardState createState() => _ProductsCardState();
}

class _ProductsCardState extends State<ProductsCard> {
  bool addMinusIcon = true;
  int totalCount = 0;
  int itemCount = 0;
  String dropDownValue = '10';

  @override
  Widget build(BuildContext context) {
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
                  image: AssetImage(widget.productInfo.img),
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
                          '₹' + '${widget.productInfo.price}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Text(
                          '₹' + '${widget.productInfo.price + 20}',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        decoration: BoxDecoration(
                          color: appPrimaryColor,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Text(
                          "\₹20 OFF",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(widget.productInfo.description),
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
                        items: <String>['10', '20', '30', '40']
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
                                          if (totalCount > 0 && itemCount > 0) {
                                            setState(() {
                                              totalCount -= 1;
                                              Provider.of<Cart>(context,
                                                      listen: false)
                                                  .decrementCartItemsCount(1);
                                              widget.price.decreasePrice(
                                                  widget.productInfo.price);
                                              itemCount -= 1;
                                              print(widget.price.price);
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
                                  totalCount == 0
                                      ? 'ADD'
                                      : itemCount < 0
                                          ? '0'
                                          : itemCount.toString(),
                                  style: TextStyle(
                                      color: totalCount == 0
                                          ? Colors.orange
                                          : Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    Fluttertoast.showToast(
                                        msg: "Item added to cart",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    if (totalCount == 0) {
                                      setState(() {
                                        addMinusIcon = true;
                                        totalCount += 1;
                                        Provider.of<Cart>(context,
                                                listen: false)
                                            .incrementCartItemsCount(1);
                                        widget.price.increasePrice(
                                            widget.productInfo.price);
                                        itemCount += 1;
                                        print(widget.price.price);
                                      });
                                    } else {
                                      setState(() {
                                        totalCount += 1;
                                        itemCount += 1;
                                        Provider.of<Cart>(context,
                                                listen: false)
                                            .incrementCartItemsCount(1);
                                        widget.price.increasePrice(
                                            widget.productInfo.price);
                                        print(widget.price.price);
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
