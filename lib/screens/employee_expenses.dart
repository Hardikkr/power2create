import 'package:flutter/material.dart';
import 'package:power2create/custom/custom_color.dart';
import 'package:power2create/data/april2020.dart';
import 'package:power2create/data/may2020.dart';
import 'package:power2create/data/monthly_expenses.dart';
import 'package:power2create/widgets/add_new_expense.dart';
import 'package:power2create/widgets/expenses_elevated_tab.dart';
import 'package:power2create/widgets/filter_button.dart';
import 'package:power2create/widgets/item_and_price.dart';

class EmployeeExpenses extends StatefulWidget {
  EmployeeExpenses(this.month, this.monthlyExpenses);

  final month;
  final monthlyExpenses;

  @override
  _EmployeeExpensesState createState() => _EmployeeExpensesState();
}

class _EmployeeExpensesState extends State<EmployeeExpenses> {
  bool isSearching = false;
  bool isCollapsed = true;

  isStartedSearching() {
    setState(() {
      isSearching = !isSearching;
    });
  }

  notCollapsed() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    final body = SafeArea(
      child: ListView(
        children: <Widget>[
          // CUSTOM APPBAR
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 100,
            color: customPurple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // BACK BUTTON
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),

                // CONTENT ROW
                Container(
                  child: Expanded(
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          (isSearching)
                              ? Expanded(
                                  child: Container(
                                    height: 35,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Center(
                                      child: TextField(
                                        autofocus: true,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
                                          hintText: "Search Here",
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Text(
                                  "Expenses",
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                          SizedBox(
                            width: (isSearching) ? 100 : 150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                // SEARCH BUTTON
                                IconButton(
                                  icon: Icon(
                                    (isSearching) ? Icons.close_rounded : Icons.search_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    isStartedSearching();
                                  },
                                ),

                                // FILTER BUTTON
                                (isSearching) ? Container() : FilterButton(),

                                // ADD BUTTON
                                IconButton(
                                  icon: Icon(
                                    Icons.add_circle_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      isScrollControlled: true,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => AddNewExpense(),
                                    );
                                  },
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // MAIN BODY
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                (isSearching)
                    ? Container(
                        height: 300,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Center(
                          child: Text(
                            "Search for past expenses or Checkout the Recent History Below",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: <Widget>[
                            Text(
                              widget.month,
                              style: TextStyle(fontSize: 20),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ItemAndPrice(
                                  item: widget.monthlyExpenses[index]["title"],
                                  price: widget.monthlyExpenses[index]["price"],
                                  textColor: Colors.grey.shade600,
                                );
                              },
                              itemCount: widget.monthlyExpenses.length,
                            ),
                            SizedBox(height: 20),
                            ExpensesElevatedTab(
                              month: "Net Epenses",
                              price: monthlyExpenses[5]["net expense"],
                              monthlyExpenses: may2020,
                              isClickable: false,
                            ),
                          ],
                        ),
                      ),
                SizedBox(height: 20),
                Text(
                  "History",
                  style: TextStyle(fontSize: 20),
                ),
                Divider(
                  height: 30,
                  thickness: 2,
                ),
                ExpensesElevatedTab(
                  month: monthlyExpenses[4]["month"],
                  price: monthlyExpenses[4]["net expense"],
                  monthlyExpenses: april2020,
                  isClickable: true,
                ),
                SizedBox(height: 20),
                ExpensesElevatedTab(
                  month: monthlyExpenses[3]["month"],
                  price: monthlyExpenses[3]["net expense"],
                  monthlyExpenses: april2020,
                  isClickable: true,
                ),
                SizedBox(height: 20),
                ExpensesElevatedTab(
                  month: monthlyExpenses[2]["month"],
                  price: monthlyExpenses[2]["net expense"],
                  monthlyExpenses: april2020,
                  isClickable: true,
                ),
                SizedBox(height: 20),
                (isCollapsed)
                    ? GestureDetector(
                        onTap: () {
                          notCollapsed();
                        },
                        child: Container(
                          child: Center(
                            child: Text(
                              "See More",
                              style: TextStyle(
                                fontSize: 16,
                                color: customPurple,
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        // height: 200,
                        child: ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: <Widget>[
                            ExpensesElevatedTab(
                              month: monthlyExpenses[1]["month"],
                              price: monthlyExpenses[1]["net expense"],
                              monthlyExpenses: april2020,
                              isClickable: true,
                            ),
                            SizedBox(height: 20),
                            ExpensesElevatedTab(
                              month: monthlyExpenses[0]["month"],
                              price: monthlyExpenses[0]["net expense"],
                              monthlyExpenses: april2020,
                              isClickable: true,
                            ),
                            SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                notCollapsed();
                              },
                              child: Container(
                                child: Center(
                                  child: Text(
                                    "See Less",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: customPurple,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}
