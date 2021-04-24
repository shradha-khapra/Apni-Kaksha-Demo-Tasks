import 'package:apnikaksha_cart_app/core/constants/colors.dart';
import 'package:flutter/material.dart';

class TopSnapBar extends StatelessWidget {
  final String actionText;
  final String notificationText;
  const TopSnapBar({
    Key key,
    @required this.notificationText,
    this.actionText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kDarkGreenColor,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                notificationText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              if (actionText != null)
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text(
                    actionText,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
