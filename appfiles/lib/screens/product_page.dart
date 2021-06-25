import 'package:ak/constants.dart';
import 'package:ak/models/cart_data.dart';
import 'package:ak/models/price.dart';
import 'package:ak/models/product_data.dart';
import 'package:ak/screens/cart_page.dart';
import 'package:ak/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  var price = PriceItem();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.sort_sharp,
            size: 40.0,
            color: Colors.white,
          ),
          onPressed: () {},
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery Location',
                  style: appBarTextStyleTitle,
                ),
                Text(
                  'B-52 Tecorbuilding, Noida',
                  style: appBarTextStyleBody,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 20.0,
                  right: Provider.of<Cart>(context).getCartItemsCount() <= 0
                      ? 1.0
                      : 0.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CartPage(price: price),
                    ),
                  );
                },
                child: Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                  size: 27.0,
                ),
              ),
            ),
            Provider.of<Cart>(context).getCartItemsCount() > 0
                ? Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF4ebc00),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Text(
                        '${Provider.of<Cart>(context).getCartItemsCount()}',
                        style: TextStyle(
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  )
                : SizedBox(
                    width: 0.0,
                  ),
          ],
        ),
      ),
      body: Container(
        color: Color(0xFFe8e8e8),
        child: Column(
          children: [
            Container(
              color: appPrimaryColor,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: appPrimaryColor,
                      size: 35.0,
                    ),
                    labelText: "     Search for Products",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: productList.length,
                  itemBuilder: (context, index) {
                    return ProductsCard(
                      productInfo: productList[index],
                      price: price,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
