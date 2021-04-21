import 'package:apnikaksha/helper/custom_color.dart';
import 'package:flutter/material.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    Key key,
    @required this.myicon,
    this.numOfitem = 0,
    @required this.press,
  }) : super(key: key);

  final Icon myicon;
  final int numOfitem;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      onTap: press,
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 12),
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: CustomColors().myyellow800.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: myicon,
            ),
          ),
          if (numOfitem != 0)
            Positioned(
              top: 10,
              right: -5,
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
                      "${numOfitem}",
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
    );
  }
}
