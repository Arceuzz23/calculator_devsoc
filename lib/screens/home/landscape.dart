import 'package:flutter/material.dart';

class Landscape extends StatefulWidget {
  const Landscape({super.key});

  @override
  State<Landscape> createState() => _LandscapeState();
}
class _LandscapeState extends State<Landscape> {
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

  double value1 = 0;
  double value2 = 0;
  var val = List<double>.filled(100, 0);
  double equal = 0;
  int k = 0;
  int k1 = 0;
  int k2 = 0;
  String value = "";
  String op = "";
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
                          ),
                          Text(
                            '$value',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 69,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Row(
                        children: <Widget>[],
                      ),
                      SizedBox(
                        height: 0.5,
                      ),
                      Row(
                        children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              fixedSize: Size.fromRadius(38),
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
                                fontSize: 21.2,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '7';
                              });
                            },
                            child: const Text(
                              '7',
                              style: TextStyle(
                                fontSize: 33.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '8';
                              });
                            },
                            child: const Text(
                              '8',
                              style: TextStyle(
                                fontSize: 33.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '9';
                              });
                            },
                            child: const Text(
                              '9',
                              style: TextStyle(
                                fontSize: 33.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                op = '*';
                                k2 += 1;
                                cal();
                                value = '';
                              });
                            },
                            child: const Text(
                              'x',
                              style: TextStyle(
                                fontSize: 38.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value1 = double.parse(value);
                                op = '/';
                                cal();
                                value = '';
                              });
                            },
                            child: const Text(
                              '/',
                              style: TextStyle(
                                fontSize: 35.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[400],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '-';
                              });
                            },
                            child: const Text(
                              '+/-',
                              style: TextStyle(
                                fontSize: 21.5,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value += '3';
                              });
                            },
                            child: const Text(
                              '3',
                              style: TextStyle(
                                fontSize: 36.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '4';
                              });
                            },
                            child: const Text(
                              '4',
                              style: TextStyle(
                                fontSize: 33.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '5';
                              });
                            },
                            child: const Text(
                              '5',
                              style: TextStyle(
                                fontSize: 33.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '6';
                              });
                            },
                            child: const Text(
                              '6',
                              style: TextStyle(
                                fontSize: 33.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '.';
                              });
                            },
                            child: const Text(
                              '.',
                              style: TextStyle(
                                fontSize: 45.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value1 = double.parse(value);
                                k1 += 1;
                                op = '-';
                                cal();
                                value = '';
                              });
                            },
                            child: const Text(
                              '-',
                              style: TextStyle(
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[400],
                            ),
                            onPressed: () {
                              setState(() {
                                value1 = double.parse(value);
                                value1 = value1 / 100;
                                value = value1.toString();
                              });
                            },
                            child: const Text(
                              '%',
                              style: TextStyle(
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '0';
                              });
                            },
                            child: const Text(
                              '0',
                              style: TextStyle(
                                fontSize: 33.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '1';
                              });
                            },
                            child: const Text(
                              '1',
                              style: TextStyle(
                                fontSize: 33.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.grey[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value = value + '2';
                              });
                            },
                            child: const Text(
                              '2',
                              style: TextStyle(
                                fontSize: 33.0,
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
                              fixedSize: Size.fromRadius(38),
                              backgroundColor: Colors.amber[700],
                            ),
                            onPressed: () {
                              setState(() {
                                value1 = double.parse(value);

                                val[k] = value1;
                                k += 1;
                                op = '+';
                                cal();
                                value = '';
                              });
                            },
                            child: const Text(
                              '+',
                              style: TextStyle(
                                fontSize: 40.0,
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
                              fixedSize: Size.fromRadius(38),
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
                                  equal = value1 / value2;
                                }
                                if (op == '%') {
                                  equal = value1 / 100;
                                }
                                value = "${equal.toString()}";
                                equal = 0;
                                int i;
                                for (i = 0; i < 100; i++) {
                                  val[i] = 0;
                                }
                                k2 = 0;
                                k1 = 0;
                              });
                            },
                            child: const Text(
                              '=',
                              style: TextStyle(
                                fontSize: 36.0,
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
                          /*ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          fixedSize: Size.fromRadius(38),
                          backgroundColor: Colors.grey[700],
                        ),
                        onPressed: () {
                          setState(() {
                            value = value + '%';
                          });
                        },
                        child: const Text(
                          '%',
                          style: TextStyle(

                            fontSize: 33.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),*/

                          SizedBox(
                            width: 10,
                          ),

                          //EB
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

