import 'package:flutter/material.dart';

Widget itemAndPrice(String item, int price, {Color textColor = Colors.black}) {
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
