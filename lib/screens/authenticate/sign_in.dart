import 'package:calculator_devsoc/services/auth.dart';
import 'package:calculator_devsoc/shareds/const.dart';
import 'package:calculator_devsoc/shareds/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleview;
  SignIn({required this.toggleview});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign in to Calci',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              actions: <Widget>[
                TextButton.icon(
                    icon: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      widget.toggleview();
                    },
                    label: Text('Register',
                        style: TextStyle(
                          color: Colors.white,
                        )))
              ],
            ),
            body: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/calci_bckimg.jpg"),
                fit: BoxFit.cover,
              )),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              // child: Form(
              //     key: _formKey,
              //     child: Column(
              //       children: <Widget>[
              //         SizedBox(
              //           height: 20,
              //         ),
              //         TextFormField(
              //             decoration:
              //                 textInputDecoration.copyWith(hintText: 'Email'),
              //             validator: (val) =>
              //                 val!.isEmpty ? 'Enter an email' : null,
              //             onChanged: (val) {
              //               setState(() => email = val);
              //             }),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         TextFormField(
              //             decoration: textInputDecoration.copyWith(
              //                 hintText: 'Password'),
              //             obscureText: true,
              //             validator: (val) => val!.length < 6
              //                 ? 'Password must be more than 6 characters'
              //                 : null,
              //             onChanged: (val) {
              //               setState(() => password = val);
              //             }),
              //         SizedBox(
              //           height: 20,
              //         ),
              //         ElevatedButton(
              //             onPressed: () async {
              //               if (_formKey.currentState!.validate()) {
              //                 setState(() => loading = true);
              //                 dynamic result =
              //                     await _auth.singInWithEmailAndPassword(
              //                         email, password);
              //                 if (result == null) {
              //                   setState(() {
              //                     error = 'wrong credentials';
              //                     loading = false;
              //                   });
              //                 }
              //               }
              //             },
              //             child: Text('Sign in',
              //                 style: TextStyle(
              //                   color: Colors.black,
              //                 ))),
              //         SizedBox(
              //           height: 12.0,
              //         ),
              //         Text(
              //           error,
              //           style: TextStyle(color: Colors.red, fontSize: 14.0),
              //         )
              //       ],
              //     ))
            ),
          );
  }
}
