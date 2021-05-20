import 'package:flutter/material.dart';
import 'package:power2create/custom/slide_left_transition.dart';
import 'package:power2create/screens/employee_expenses.dart';
import 'package:power2create/widgets/item_and_price.dart';

Widget expensesElevatedTab(context, String month, int price, var monthlyExpenses,
    {bool isClickable = false}) {
  return InkWell(
    onTap: () {
      if (isClickable == true) {
        Navigator.push(
          context,
          SlideLeftTransition(
            page: EmployeeExpenses(month, monthlyExpenses),
          ),
        );
      }
    },
    child: Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1),
            spreadRadius: 0.8,
            blurRadius: 3,
          ),
        ],
      ),
      child: Center(
        child: itemAndPrice(month, price),
      ),
    ),
  );
}
