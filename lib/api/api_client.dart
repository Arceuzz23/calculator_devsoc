import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class api_client {
  final Uri currencyUrl = Uri.https("free.currconv.com", "/api/v7/currencies",
      {"apiKey": "050b5c7fdbad2add9d24"});

  Future<List<String>> getCurrency() async {
    http.Response response = await http.get(currencyUrl);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      var list = body["results"];
      List<String> currencyList = (list.keys).toList();
      print(currencyList);
      return currencyList;
    } else {
      throw Exception("Failed to connect to API");
    }
  }

  Future<double> convertCurrency(String from, String to) async {
    final Uri convertUrl = Uri.https("free.currconv.com", "/api/v7/convert", {
      "apiKey": "050b5c7fdbad2add9d24",
      "q": "${from}_${to}",
      "compact": "ultra"
    });
    http.Response response = await http.get(convertUrl);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      double rate = body["${from}_${to}"];
      return rate;
    } else {
      throw Exception("Failed to connect to API");
    }
  }
}
