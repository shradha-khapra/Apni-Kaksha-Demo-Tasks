import 'package:apni_kaksha_cart_app/constants.dart';
import 'package:apni_kaksha_cart_app/models/cart_data.dart';
import 'package:apni_kaksha_cart_app/screens/cart_page.dart';
import 'package:apni_kaksha_cart_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatefulWidget {
  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
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
                  style: kAppBarTextStyleTitle,
                ),
                Text(
                  'B-52 Tecorbbuilding, Noida',
                  style: kAppBarTextStyleBody,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 70.0,
                  right: Provider.of<CartData>(context).getCartItemsCount() <= 0
                      ? 20.0
                      : 0.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => CartPage(),
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
            Provider.of<CartData>(context).getCartItemsCount() > 0
                ? Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Color(0xFF4ebc00),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Text(
                        '${Provider.of<CartData>(context).getCartItemsCount()}',
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
      // extendBody: true,
      body: Container(
        color: Color(0xFFe8e8e8),
        child: Column(
          children: [
            Container(
              color: kAppPrimaryColor,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 20.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(
                      Icons.search,
                      color: kAppPrimaryColor,
                      size: 35.0,
                    ),
                    labelText: "\t \t Search for Products",
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ProductsCard();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
