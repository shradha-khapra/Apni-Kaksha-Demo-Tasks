import "package:flutter/material.dart";
import 'package:shopit/core/constants/utils.dart';
import 'package:shopit/core/themes/app_theme.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> _categories = [
    "Basmati",
    "Kolam",
    "Japonica",
    "Calrose",
    "Other Rice"
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _categories.length,
          itemBuilder: (context, index) => _buildCategories(index)),
    );
  }

  Widget _buildCategories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Utils.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _selectedIndex == index
                    ? Colors.black
                    : AppTheme.defaultTheme.accentColor,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: Utils.defaultPadding / 4),
              height: 2,
              width: 30,
              color: _selectedIndex == index
                  ? AppTheme.defaultTheme.primaryColor
                  : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
