import 'package:calculator_devsoc/api/api_client.dart';
import 'package:calculator_devsoc/api/drop_down.dart';
import 'package:flutter/material.dart';
import 'package:calculator_devsoc/shareds/const.dart';

class currency_convertor extends StatefulWidget {
  const currency_convertor({super.key});

  @override
  State<currency_convertor> createState() => _currency_convertorState();
}

class _currency_convertorState extends State<currency_convertor> {
  api_client client = api_client();

  double rate = 0.0;
  String result = "";

  List<String> currencies = [];
  String from = " ";
  String to = "";

  Future<List<String>> getCurrencyList() async {
    return await client.getCurrency();
  }

  @override
  void initState() {
    super.initState();
    (() async {
      List<String> list = await client.getCurrency();
      setState(() {
        currencies = list;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/money.jpg"),
            fit: BoxFit.cover,
            opacity: 0.5,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 150,
              ),
              Text(
                "Currency",
                style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Computo Monospace',
                    color: const Color.fromARGB(255, 0, 0, 0)),
              ),
              Text(
                "Convertor",
                style: TextStyle(fontSize: 40, fontFamily: 'Computo Monospace'),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: 325,
                child: TextField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Input Value',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Trito Writter',
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.amber, width: 1.0)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2.0),
                      )),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Trito Writter',
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.number,
                  onSubmitted: (value) async {
                    rate = await client.convertCurrency(from, to);
                    setState(
                      () {
                        result =
                            (rate * double.parse(value)).toStringAsFixed(3);
                      },
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DropDown(currencies, from, (value) {
                    setState(() {
                      from = value;
                    });
                  }),
                  SizedBox(
                    width: 20,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      String temp = from;
                      setState(
                        () {
                          from = to;
                          to = temp;
                        },
                      );
                    },
                    child: Icon(
                      Icons.swap_horiz,
                      size: 40,
                      color: Colors.black,
                    ),
                    elevation: 0,
                    backgroundColor: Color.fromARGB(0, 255, 255, 255),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  DropDown(currencies, to, (value) {
                    setState(() {
                      to = value;
                    });
                  }),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 325,
                  height: 69,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 254, 254),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.amber),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Result: ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: 'Trito Writter',
                        ),
                      ),
                      Text(
                        result,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontFamily: 'Trito Writter',
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
