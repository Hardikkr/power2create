import 'package:flutter/material.dart';
import 'package:power2create/custom/custom_color.dart';
import 'package:power2create/custom/slide_left_transition.dart';
import 'package:power2create/data/may2020.dart';
import 'package:power2create/screens/employee_expenses.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget bottomNavigationBarItem(icon, label, index) {
      return GestureDetector(
        onTap: () {
          if (index == 2) {
            Navigator.push(
              context,
              SlideLeftTransition(
                page: EmployeeExpenses("May 2020", may2020),
              ),
            );
          }
        },
        child: Container(
          color: Colors.transparent,
          height: 70,
          width: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: 35),
              SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      );
    }

    final body = SafeArea(
      child: Container(
        child: Center(
          child: Text(
            "This is HOME",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );

    final floatingActionButton = FloatingActionButton(
      child: Icon(
        Icons.menu,
        color: customPurple,
        size: 30,
      ),
      backgroundColor: Colors.white,
      onPressed: () {},
    );

    final bottomNavigationBar = Container(
      height: 80.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          bottomNavigationBarItem(
              Icons.supervised_user_circle, "Student Corner", 0),
          bottomNavigationBarItem(
              Icons.message_rounded, "Feedback & Complaints", 1),
          bottomNavigationBarItem(Icons.monetization_on, "Expenses", 2),
          bottomNavigationBarItem(
              Icons.contact_support_rounded, "Enquiries", 3),
          bottomNavigationBarItem(Icons.queue, "New Admission", 4)
        ],
      ),
    );

    return Scaffold(
      backgroundColor: customPurple,
      body: body,
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
