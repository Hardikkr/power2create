import 'package:flutter/material.dart';
import 'package:power2create/custom/custom_color.dart';

class AddNewExpense extends StatefulWidget {
  @override
  _AddNewExpenseState createState() => _AddNewExpenseState();
}

class _AddNewExpenseState extends State<AddNewExpense> {
  String title;
  String modeOfPayment;
  DateTime currentDate = DateTime.now();

  void setTitle(String value) {
    setState(() {
      title = value;
    });
  }

  void setModeofPayment(String value) {
    setState(() {
      modeOfPayment = value;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2022),
    );
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: customPurple,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 15),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25.0),
                ),
              ),
              child: ListView(
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                clipBehavior: Clip.none,
                children: <Widget>[
                  Text(
                    "New Expense",
                    style: TextStyle(
                      fontSize: 26,
                      color: customPurple,
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Date",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          height: 40,
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
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              currentDate.toString(),
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      IconButton(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: Icon(
                          Icons.calendar_today_rounded,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Title",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 40,
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: SizedBox(height: 0),
                        value: title,
                        items: <String>[
                          "Library Rent",
                          "Maid Payment",
                          "Newspapers",
                          "Magazines",
                          "Internet",
                          "Other",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Choose a title"),
                        onChanged: (value) {
                          setTitle(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  RichText(
                    text: TextSpan(
                      text: "Amount",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                      ),
                      children: <InlineSpan>[
                        TextSpan(
                          text: " In Rupees",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          autofocus: false,
                          decoration: InputDecoration(border: InputBorder.none, hintText: "Enter the Amount in Rupees"),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Mode of Payment",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 40,
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: DropdownButton<String>(
                        isExpanded: true,
                        underline: SizedBox(height: 0),
                        value: modeOfPayment,
                        items: <String>[
                          "10000",
                          "5000",
                          "Other",
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        hint: Text("Choose a Mode of Payment"),
                        onChanged: (value) {
                          setModeofPayment(value);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Note",
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 100,
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          autofocus: false,
                          maxLines: 4,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add your note here",
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        fixedSize: Size(50, 20),
                        primary: customPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Add",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  //? OLD ADD BUTTON STYLE
                  // Container(
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: <Widget>[
                  //       ElevatedButton(
                  //         style: ElevatedButton.styleFrom(
                  //           padding: EdgeInsets.symmetric(horizontal: 50),
                  //           primary: customPurple,
                  //           shape: RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(20),
                  //             ),
                  //           ),
                  //         ),
                  //         onPressed: () {},
                  //         child: Text(
                  //           "Add",
                  //           style: TextStyle(fontSize: 18),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
