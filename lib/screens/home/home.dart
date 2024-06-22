import 'package:calculator_devsoc/orientation_widget.dart';
import 'package:calculator_devsoc/history.dart';
import 'package:calculator_devsoc/screens/home/landscape.dart';
import 'package:calculator_devsoc/screens/home/potrait.dart';
import 'package:calculator_devsoc/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calculator_devsoc/services/database.dart';
import 'package:provider/provider.dart';
import 'package:calculator_devsoc/history.dart';

class Home_screen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: OrientationWidget(
        potrait: Potrait(),
        landscape: Landscape(),
      ),
    );
  }
}
