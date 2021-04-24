import 'package:flutter/material.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    Key key,
    @required this.icon,
    @required this.press,
    this.mycolor,
    this.showShadow = false,
  }) : super(key: key);

  final IconData icon;
  final GestureTapCancelCallback press;
  final bool showShadow;
  final Color mycolor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if (showShadow)
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 10,
              color: Color(0xFFB0B0B0).withOpacity(0.2),
            ),
        ],
      ),
      child: FlatButton(
        padding: EdgeInsets.zero,
        color: mycolor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: press,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
