import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  final Uri currencyURL = Uri.https("freecurrencyapi.com", "/v1/currencies",
      {"apiKey": "fca_live_C8MAWKTQ1aflkzCziqC1Ca0lz5W02thUR1oYErvj"});

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyURL);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);
      var list;
      return body;
    } else {
      throw Exception("Failed to connect to API");
    }
  }
}
