import 'package:calculator_devsoc/api/api_client.dart';
import 'package:calculator_devsoc/api/drop_down.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text(
          'Currency Convertor',
          style: TextStyle(
              fontFamily: 'Lcd',
              fontSize: 25,
              color: Color.fromARGB(255, 180, 175, 175)),
        ),
        centerTitle: true,
        bottom: PreferredSize(
            child: Container(
              color: Colors.amber,
              height: 1.0,
              width: 350,
            ),
            preferredSize: Size.fromHeight(4.0)),
      ),
      // body: DropDown(currencies, from, (from) {}),
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: "Input Value",
                          labelStyle: TextStyle(color: Colors.black),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onSubmitted: (value) async {
                          rate = await client.convertCurrency(from, to);
                          setState(
                            () {
                              result = (rate * double.parse(value))
                                  .toStringAsFixed(3);
                            },
                          );
                        },
                      ),
                    ),
                  ],
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
                    child: Icon(Icons.swap_horiz),
                    elevation: 0,
                    backgroundColor: Colors.amber,
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
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [Text("Result"), Text(result)],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
