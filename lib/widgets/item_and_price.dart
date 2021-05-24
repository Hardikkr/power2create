import 'package:flutter/material.dart';

class ItemAndPrice extends StatelessWidget {
  ItemAndPrice({this.item, this.price, this.textColor});

  final item;
  final price;
  Color textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height: 30,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          item,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
        Text(
          "Rs. $price",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
      ],
    ),
  );
  }
}
