import 'dart:ui';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:calculator_devsoc/history.dart';
import 'package:calculator_devsoc/screens/home/convertor.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calculator_devsoc/services/auth.dart';
import 'package:flutter/widgets.dart';

class Landscape extends StatefulWidget {
  const Landscape({super.key});

  @override
  State<Landscape> createState() => _LandscapeState();
}

class _LandscapeState extends State<Landscape> {
  final AuthService _auth = AuthService();
  void cal() {
    if (op == '+') {
      value1 = double.parse(value);
      equal += value1;
    }

    if (op == '-') {
      value1 = double.parse(value);
      if (k1 == 1) {
        equal = value1;
      } else {
        equal -= value1;
      }
    }

    if (op == '*') {
      value1 = double.parse(value);
      if (k2 == 1) {
        equal = value1;
      } else {
        equal *= value1;
      }
    }
  }

  int timestamp = DateTime.now().microsecondsSinceEpoch;

  bool toggle = false;
  String calculations = '';
  String final_value = '';
  double value1 = 0;
  double value2 = 0;
  var val = List<double>.filled(100, 0);
  double equal = 0;
  int k = 0;
  int k1 = 0;
  int k2 = 0;
  int k3 = 0;
  String value = "";
  String op = "";

  addData(String calculations, String final_value, int timestamp) async {
    if (calculations == "" && final_value == "")
      print("enter Required fields");
    else {
      FirebaseFirestore.instance
          .collection("calculations")
          .doc("uid")
          .collection("history")
          .doc(calculations)
          .set({
        "Calculations": calculations,
        "Result": final_value,
        "createdAt": timestamp,
      }).then((value1) {
        print("data inserted");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.fromLTRB(13.5, 0, 5, 15),
                    child: Column(children: <Widget>[
                      //ALL THE MAIN ROW STUFF STARTS HERE _ MARKER
                      //ROW1
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 319,
                            alignment: Alignment.center,
                            // color: Colors.red,
                            child: AutoSizeText(
                              '$value',
                              style: TextStyle(
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                                fontSize: 100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Row(
                        children: <Widget>[
                          //History button
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                fixedSize: Size.fromRadius(35),
                                backgroundColor: Colors.grey[400],
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    enableDrag: true,
                                    isDismissible: true,
                                    backgroundColor: Colors.yellow[50],
                                    context: context,
                                    builder: (BuildContext context) {
                                      return ShowData();
                                    });
                              },
                              child: Icon(
                                Icons.access_time,
                                color: Colors.black,
                                size: 26,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[400],
                            ),
                            onPressed: () {
                              setState(() {
                                value = '';
                                equal = 0;
                              });
                            },
                            child: const Text(
                              'AC',
                              style: TextStyle(
                                fontFamily: 'Trito Writter',
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                if (toggle) {
                                  value = '';
                                  value = value + '7';
                                  calculations += '7';
                                  toggle = false;
                                } else {
                                  value = value + '7';
                                  calculations += '7';
                                }
                              });
                            },
                            child: const Text(
                              '7',
                              style: TextStyle(
                                fontSize: 33.0,
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                if (toggle) {
                                  value = '';
                                  value = value + '8';
                                  calculations += '8';
                                  toggle = false;
                                } else {
                                  value = value + '8';
                                  calculations += '8';
                                }
                              });
                            },
                            child: const Text(
                              '8',
                              style: TextStyle(
                                fontSize: 33.0,
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                if (toggle) {
                                  value = '';
                                  value = value + '9';
                                  calculations += '9';
                                  toggle = false;
                                } else {
                                  value = value + '9';
                                  calculations += '9';
                                }
                              });
                            },
                            child: const Text(
                              '9',
                              style: TextStyle(
                                fontSize: 33.0,
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                op = '*';
                                calculations += ' ' + op + ' ';
                                k2 += 1;
                                cal();

                                value = '';
                              });
                            },
                            child: const Text(
                              'x',
                              style: TextStyle(
                                fontSize: 35.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                op = '/';
                                calculations += ' ' + op + ' ';
                                k3 += 1;
                                cal();

                                value = '';
                              });
                            },
                            child: const Text(
                              '/',
                              style: TextStyle(
                                fontFamily: 'Trito Writter',
                                fontSize: 35.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //Backspace button
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                fixedSize: Size.fromRadius(35),
                                backgroundColor: Colors.amber[700],
                              ),
                              onPressed: () {
                                setState(() {
                                  value = value.substring(0, value.length - 1);
                                });
                              },
                              child: Icon(
                                Icons.backspace_outlined,
                                color: Colors.white,
                                size: 25,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 0.5,
                      ),

                      Row(
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[400],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '-';
                                calculations += '-';
                              });
                            },
                            child: const Text(
                              '+/-',
                              style: TextStyle(
                                fontFamily: 'Trito Writter',
                                fontSize: 20,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                if (toggle) {
                                  value = '';
                                  value = value + '3';
                                  calculations += '3';
                                  toggle = false;
                                } else {
                                  value = value + '3';
                                  calculations += '3';
                                }
                              });
                            },
                            child: const Text(
                              '3',
                              style: TextStyle(
                                fontSize: 33.0,
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                if (toggle) {
                                  value = '';
                                  value = value + '4';
                                  calculations += '4';
                                  toggle = false;
                                } else {
                                  value = value + '4';
                                  calculations += '4';
                                }
                              });
                            },
                            child: const Text(
                              '4',
                              style: TextStyle(
                                fontSize: 33.0,
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                if (toggle) {
                                  value = '';
                                  value = value + '5';
                                  calculations += '5';
                                  toggle = false;
                                } else {
                                  value = value + '5';
                                  calculations += '5';
                                }
                              });
                            },
                            child: const Text(
                              '5',
                              style: TextStyle(
                                fontSize: 33.0,
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                if (toggle) {
                                  value = '';
                                  value = value + '6';
                                  calculations += '6';
                                  toggle = false;
                                } else {
                                  value = value + '6';
                                  calculations += '6';
                                }
                              });
                            },
                            child: const Text(
                              '6',
                              style: TextStyle(
                                fontSize: 33.0,
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value += '.';
                                calculations += '.';
                              });
                            },
                            child: const Text(
                              '.',
                              style: TextStyle(
                                fontSize: 40.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //SUBTRACTION OPERATION
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value1 = double.parse(value);
                                k1 += 1;
                                op = '-';
                                calculations += ' ' + op + ' ';
                                cal();

                                value = '';
                              });
                            },
                            child: const Text(
                              '-',
                              style: TextStyle(
                                fontFamily: 'Trito Writter',
                                fontSize: 55.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.5,
                      ),

                      Row(
                        children: <Widget>[
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                fixedSize: Size.fromRadius(35),
                                backgroundColor: Colors.grey[400],
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    enableDrag: true,
                                    isDismissible: true,
                                    backgroundColor: Colors.yellow[50],
                                    context: context,
                                    builder: (BuildContext context) {
                                      return currency_convertor();
                                    });
                              },
                              child: Icon(
                                Icons.currency_exchange_rounded,
                                color: Colors.black,
                                size: 26,
                              )),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[400],
                            ),
                            onPressed: () {
                              setState(() {
                                value1 = double.parse(value);
                                value1 = value1 / 100;
                                value = value1.toString();
                                final_value = value;
                              });
                            },
                            child: const Text(
                              '%',
                              style: TextStyle(
                                fontFamily: 'Trito Writter',
                                fontSize: 33.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                if (toggle) {
                                  value = '';
                                  value = value + '0';
                                  calculations += '0';
                                  toggle = false;
                                } else {
                                  value = value + '0';
                                  calculations += '0';
                                }
                              });
                            },
                            child: const Text(
                              '0',
                              style: TextStyle(
                                fontSize: 33.0,
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                if (toggle) {
                                  value = '';
                                  value = value + '1';
                                  calculations += '1';
                                  toggle = false;
                                } else {
                                  value = value + '1';
                                  calculations += '1';
                                }
                              });
                            },
                            child: const Text(
                              '1',
                              style: TextStyle(
                                fontSize: 33.0,
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                if (toggle) {
                                  value = '';
                                  value = value + '2';
                                  calculations += '2';
                                  toggle = false;
                                } else {
                                  value = value + '2';
                                  calculations += '2';
                                }
                              });
                            },
                            child: const Text(
                              '2',
                              style: TextStyle(
                                fontSize: 33.0,
                                fontFamily: 'Trito Writter',
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //ADDITION OPERATION
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value1 = double.parse(value);
                                val[k] = value1;
                                k += 1;
                                op = '+';
                                calculations += ' ' + op + ' ';
                                cal();
                                value = '';
                              });
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(
                                fontFamily: 'Trito Writter',
                                fontSize: 60.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value2 = double.parse(value);
                                if (op == '+') {
                                  equal += value2;
                                }

                                if (op == '-') {
                                  equal -= value2;
                                }

                                if (op == '*') {
                                  equal *= value2;
                                }
                                if (op == '/') {
                                  equal = equal / value2;
                                }
                                if (op == '%') {
                                  equal = value1 / 100;
                                }

                                value = "${equal.toString()}";
                                for (var i = 0; i < value.length; i++) {
                                  if (value[i] == '.') {
                                    if (value[i + 1] == '0')
                                      value = value.substring(0, i);
                                  }
                                }
                                final_value = value;
                                equal = 0;
                                int i;
                                for (i = 0; i < 100; i++) {
                                  val[i] = 0;
                                }
                                k2 = 0;
                                k1 = 0;
                                k3 = 0;
                                k = 0;

                                addData(calculations, final_value, timestamp);

                                print(calculations);
                                calculations = '';
                                print(value);
                                toggle = true;
                              });
                            },
                            child: const Text(
                              '=',
                              style: TextStyle(
                                fontFamily: 'Trito Writter',
                                fontSize: 60.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(35),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = '';
                                equal = 0;
                              });
                            },
                            child: const Text(
                              '( )',
                              style: TextStyle(
                                fontFamily: 'Trito Writter',
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.5,
                      ),
                      //FIFTH ROW
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.5,
                      ),
                    ]))
              ]),
        ]));
  }
}
