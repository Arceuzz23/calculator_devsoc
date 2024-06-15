import 'package:calculator_devsoc/models/user.dart';
import 'package:calculator_devsoc/screens/authenticate/authenticate.dart';
import 'package:calculator_devsoc/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Users?>(context);

    if (user == null)
      return Authenticate();
    else {
      return Home_screen();
    }
  }
}
