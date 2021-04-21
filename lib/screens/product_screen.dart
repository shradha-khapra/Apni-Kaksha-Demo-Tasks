import 'package:apnikaksha/helper/custom_color.dart';
import 'package:apnikaksha/helper/default_button.dart';
import 'package:apnikaksha/helper/icon_btn_with_counter.dart';
import 'package:apnikaksha/helper/mytoast.dart';
import 'package:apnikaksha/helper/rounded_icon_btn.dart';
import 'package:apnikaksha/models/demi_data.dart';
import 'package:apnikaksha/screens/card_screen.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toggle_bar/toggle_bar.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> _cardProductList = [];
  int cartitem = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.26),
          child: AppBar(
            elevation: 10,
            //centerTitle: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Rice & Others Grains",
                  style: TextStyle(fontSize: 17),
                ),
                Text(
                  "Super Store - Indrapuram",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
              Padding(
                padding: EdgeInsets.only(right: 5),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CardScreen(_cardProductList),
                          ),
                        ).then((value) {
                          try {
                            setState(() {
                              cartitem = value[0].length;
                            });
                          } catch (e) {
                            print(e.toString());
                          }
                        });
                      },
                    ),
                    Positioned(
                      top: 10,
                      // right: -5,
                      child: Container(
                          height: 18,
                          width: 18,
                          decoration: BoxDecoration(
                            color: Color(0xFFFF4848),
                            shape: BoxShape.circle,
                            border: Border.all(width: 1.5, color: Colors.white),
                          ),
                          child: Center(
                            child: Text(
                              "${cartitem}",
                              style: TextStyle(
                                fontSize: 10,
                                height: 1,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ],
            flexibleSpace: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(width * 0.05),
                        bottomRight: Radius.circular(width * 0.05),
                      ),
                      gradient: CustomColors().greencolorlineargradient),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
                  width: width,
                  height: height * 0.15,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Buy Onion & Potatoes ",
                        style: GoogleFonts.abrilFatface(fontSize: 25),
                      ),
                      Text(
                          "at the best price order your groceries online and easy ",
                          style: GoogleFonts.teko(
                              color: CustomColors().mygreencolorshade600))
                    ],
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/back.jpg"),
                          fit: BoxFit.cover),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ],
                      borderRadius: BorderRadius.all(
                        Radius.circular(width * 0.04),
                      ),
                      color: Colors.white
                      //  gradient: CustomColors().greencolorlineargradient
                      ),
                )
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(width * 0.06),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ToggleBar(
                  labels: ["Indica", "Basmati", "Kolam", "Other Rice"],
                  backgroundColor: Colors.white,
                  selectedTabColor: CustomColors().myyellow800,
                  textColor: Colors.black,
                  onSelectionUpdated: (index) => {print(index)}),
              ListView.builder(
                // padding: EdgeInsets.only(left: 20, right: 20),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: demoProducts.length,
                itemBuilder: (buildContext, index) {
                  return Card(
                    elevation: 10,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      child: Column(
                        children: [
                          Row(
                            // crossAxisAlignment: CrossAxisAlignment.,
                            children: [
                              Container(
                                width: width * 0.30,
                                height: width * 0.25,
                                alignment: Alignment.topLeft,
                                child: Image.asset(demoProducts[index].images),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "\$${demoProducts[index].price} ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Text("\$${demoProducts[index].mrp}"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 10),
                                        child: Text(
                                          "20% OFF",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        decoration: BoxDecoration(
                                          color: CustomColors()
                                              .mygreencolorshade600,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    child: Text(
                                      "${demoProducts[index].description}",
                                    ),
                                  ),
                                  Text(
                                    demoProducts[index].location,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        height: 50,
                                        child: DropdownSearch<String>(
                                            mode: Mode.MENU,
                                            showSelectedItem: true,
                                            items: amountlist,
                                            label: "Amount",
                                            hint: "Amount",
                                            onChanged: print,
                                            selectedItem: "5 kg"),
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Column(
                                        children: [
                                          Container(
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
                                                    if (demoProducts[index]
                                                            .count >
                                                        0) {
                                                      setState(() {
                                                        demoProducts[index]
                                                            .count--;
                                                      });
                                                    }
                                                  },
                                                  mycolor: CustomColors()
                                                      .myyellow800,
                                                ),
                                                Container(
                                                  width: 20,
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                      "${demoProducts[index].count}"),
                                                ),
                                                RoundedIconBtn(
                                                  icon: Icons.add,
                                                  press: () {
                                                    setState(() {
                                                      demoProducts[index]
                                                          .count++;
                                                    });
                                                  },
                                                  mycolor: CustomColors()
                                                      .myyellow800,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              )
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            height: 40,
                            child: DefaultButton(
                              text: "Add to cart",
                              press: () {
                                try {
                                  if (demoProducts[index].count > 0) {
                                    for (int i = 0;
                                        i < _cardProductList.length;
                                        i++) {
                                      if (demoProducts[index].id ==
                                          _cardProductList[i].id) {
                                        _cardProductList[i].count =
                                            _cardProductList[i].count +
                                                demoProducts[index].count;
                                        MyToast()
                                            .mytoast("Item added to the cart");
                                        return 0;
                                      }
                                    }
                                    Product tempProduct = new Product();
                                    tempProduct.id = demoProducts[index].id;
                                    tempProduct.count =
                                        demoProducts[index].count;
                                    tempProduct.images =
                                        demoProducts[index].images;
                                    tempProduct.price =
                                        demoProducts[index].price;
                                    tempProduct.description =
                                        demoProducts[index].description;
                                    _cardProductList.add(tempProduct);
                                    setState(() {
                                      cartitem = _cardProductList.length;
                                    });
                                    MyToast().mytoast("Item added to the cart");
                                  } else {
                                    MyToast()
                                        .mytoast("Select atleast one quantity");
                                  }
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
