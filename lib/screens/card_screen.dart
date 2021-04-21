import 'package:apnikaksha/helper/custom_color.dart';
import 'package:apnikaksha/helper/default_button.dart';
import 'package:apnikaksha/helper/rounded_icon_btn.dart';
import 'package:apnikaksha/models/demi_data.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  List<Product> cardProductList = [];
  CardScreen(this.cardProductList);
  @override
  _CardScreenState createState() => _CardScreenState(this.cardProductList);
}

class _CardScreenState extends State<CardScreen> {
  List<Product> cardProductList = [];
  _CardScreenState(this.cardProductList);
  int totalamt = 0;

  calTotalAmount() {
    int temp = 0;
    for (int i = 0; i < cardProductList.length; i++) {
      temp += cardProductList[i].price * cardProductList[i].count;
    }
    setState(() {
      totalamt = temp;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calTotalAmount();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context, [cardProductList]);
          },
        ),
      ),
      body: cardProductList.length == 0
          ? Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: Container(
                  child: Text("Your cart is empty"),
                ),
              ),
            )
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cardProductList.length,
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              onDismissed: (direction) {
                                print(direction);
                                cardProductList.removeAt(index);
                                calTotalAmount();
                              },
                              background: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: Colors.red.shade400,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Spacer(),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              child: Card(
                                elevation: 10,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 88,
                                          child: AspectRatio(
                                            aspectRatio: 0.88,
                                            child: Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F6F9),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Image.asset(
                                                  cardProductList[index]
                                                      .images),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${cardProductList[index].description}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15),
                                              maxLines: 2,
                                            ),
                                            Text.rich(
                                              TextSpan(
                                                text:
                                                    "\$${cardProductList[index].price}",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: CustomColors()
                                                        .mygreencolorshade600),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          " x ${cardProductList[index].count}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                  TextSpan(
                                                      text:
                                                          " = ${cardProductList[index].price * cardProductList[index].count}",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyText1),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 7),
                                      child: Container(
                                        // padding: EdgeInsets.only(right: 7),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(width * 0.04),
                                            ),
                                            color: Colors.grey.shade200),
                                        child: Row(
                                          children: [
                                            RoundedIconBtn(
                                              icon: Icons.remove,
                                              press: () {
                                                if (cardProductList[index]
                                                        .count >
                                                    1) {
                                                  setState(() {
                                                    cardProductList[index]
                                                        .count--;
                                                  });
                                                  calTotalAmount();
                                                }
                                              },
                                              mycolor: CustomColors()
                                                  .mygreencolorshade600,
                                            ),
                                            Container(
                                              width: 20,
                                              alignment: Alignment.center,
                                              child: Text(
                                                  "${cardProductList[index].count}"),
                                            ),
                                            RoundedIconBtn(
                                              icon: Icons.add,
                                              mycolor: CustomColors()
                                                  .mygreencolorshade600,
                                              press: () {
                                                setState(() {
                                                  cardProductList[index]
                                                      .count++;
                                                });
                                                calTotalAmount();
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.22,
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  height: MediaQuery.of(context).size.height * 0.22,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.shopping_bag),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Total Products :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          Text(
                            "${cardProductList.length}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.payment),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Total Amount :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            Text(
                              "\$$totalamt",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        child: DefaultButton(
                          text: "Checkout Now",
                          press: () {},
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
