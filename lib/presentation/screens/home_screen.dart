import 'package:apnikaksha_cart_app/core/constants/colors.dart';
import 'package:apnikaksha_cart_app/presentation/screens/card_screen.dart';
import 'package:apnikaksha_cart_app/presentation/widgets/product_card.dart';
import 'package:apnikaksha_cart_app/provider/cart_provider.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> tabs = [
    Tab(
      text: "Basmati",
    ),
    Tab(
      text: "Kolam",
    ),
    Tab(
      text: "Mogra",
    ),
    Tab(
      text: "Mini Mogra",
    ),
    Tab(
      text: "Other Rice",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      initialIndex: 0,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _homeAppBar(context),
        // extendBody: true,

        body: TabBarView(
          children: tabs.map((e) => ProductList()).toList(),
        ),
      ),
    );
  }

  AppBar _homeAppBar(BuildContext context) {
    return AppBar(
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
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery Location',
            style: kAppBarTextStyleTitle,
          ),
          Text(
            '2/49, Pandav Road, Shahdara',
            style: kAppBarTextStyleBody,
          ),
        ],
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
                      builder: (BuildContext context) => CartPage(),
                    ),
                  );
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
                        "${Provider.of<CartData>(context).getCartItemsCount()}",
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
      bottom: TabBar(
        physics: BouncingScrollPhysics(),
        indicator: BubbleTabIndicator(
          indicatorHeight: 25.0,
          indicatorColor: Colors.white,
          tabBarIndicatorSize: TabBarIndicatorSize.tab,
        ),
        unselectedLabelColor: Colors.white,
        isScrollable: true,
        labelColor: Colors.black45,
        tabs: tabs,
      ),
    );
  }
}

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
