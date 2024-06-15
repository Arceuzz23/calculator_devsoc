import 'package:calculator_devsoc/orientation_widget.dart';
import 'package:calculator_devsoc/random.dart';
import 'package:calculator_devsoc/screens/home/landscape.dart';
import 'package:calculator_devsoc/screens/home/potrait.dart';
import 'package:calculator_devsoc/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calculator_devsoc/services/database.dart';
import 'package:provider/provider.dart';
import 'package:calculator_devsoc/screens/home/brew_list.dart';
import 'package:calculator_devsoc/random.dart';

class Home_screen extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    // return StreamProvider<QuerySnapshot?>.value(
    //   initialData: null,
    //   value: DatabaseService(uid: '').calc,
    //   child: Scaffold(
    //     backgroundColor: Colors.brown[50],
    //     appBar: AppBar(
    //       title: Text('Calculator',
    //           style: TextStyle(
    //             color: Colors.white,
    //           )),
    //       backgroundColor: Colors.brown[400],
    //       elevation: 0.0,
    //     ),
    //     body: BrewList(),
    //   ),
    // );

    return SafeArea(
      child: OrientationWidget(
        potrait: Potrait(),
        landscape: Landscape(),
      ),
    );

    // return ShowData();
  }
}
