import 'package:flutter/material.dart';
import 'package:power2create/custom/custom_color.dart';

class FilterButton extends StatefulWidget {
  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  DateTime currentDate = DateTime.now();

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
    return PopupMenuButton(
      offset: Offset(0, 45),
      iconSize: 30,
      icon: Icon(
        Icons.filter_alt_rounded,
        color: Colors.white,
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            enabled: false,
            child: StatefulBuilder(
              builder: (context, setState) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Sort By:",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.radio_button_checked_rounded,
                          color: Colors.black,
                        ),
                        SizedBox(width: 6),
                        Text(
                          "Date",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    //? OLD FILTER BUTTON STYLE
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: <Widget>[
                    //     Container(
                    //       height: 20,
                    //       width: 75,
                    //       padding: EdgeInsets.symmetric(horizontal: 10),
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         boxShadow: <BoxShadow>[
                    //           BoxShadow(
                    //             color: Colors.grey,
                    //             offset: Offset(0, 1),
                    //             spreadRadius: 0.8,
                    //             blurRadius: 3,
                    //           ),
                    //         ],
                    //       ),
                    //       child: Text(currentDate.toString()),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {
                    //         _selectDate(context);
                    //       },
                    //       icon: Icon(
                    //         Icons.calendar_today_rounded,
                    //         color: Colors.black,
                    //         size: 20,
                    //       ),
                    //     ),
                    //     Container(
                    //       height: 20,
                    //       width: 75,
                    //       padding: EdgeInsets.symmetric(horizontal: 10),
                    //       decoration: BoxDecoration(
                    //         color: Colors.white,
                    //         borderRadius: BorderRadius.all(Radius.circular(10)),
                    //         boxShadow: <BoxShadow>[
                    //           BoxShadow(
                    //             color: Colors.grey,
                    //             offset: Offset(0, 1),
                    //             spreadRadius: 0.8,
                    //             blurRadius: 3,
                    //           ),
                    //         ],
                    //       ),
                    //       child: Text(currentDate.toString()),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {
                    //         _selectDate(context);
                    //       },
                    //       icon: Icon(
                    //         Icons.calendar_today_rounded,
                    //         color: Colors.black,
                    //         size: 20,
                    //       ),
                    //     ),
                    //   ],
                    // ),

                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            height: 25,
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
                            child: Center(child: Text("From")),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 6,
                          child: Container(
                            height: 25,
                            width: 100,
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
                            child: Center(child: Text("To")),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: IconButton(
                            onPressed: () {
                              _selectDate(context);
                            },
                            icon: Icon(
                              Icons.calendar_today_rounded,
                              color: Colors.black,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 45,
                              ),
                              primary: customPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Apply",
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ];
      },
    );
  }
}
