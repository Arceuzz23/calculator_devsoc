import 'package:calculator_devsoc/services/auth.dart';
import 'package:calculator_devsoc/shareds/const.dart';
import 'package:calculator_devsoc/shareds/loading.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  final Function toggleview;
  register({required this.toggleview});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
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
            backgroundColor: Colors.brown[50],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign up to Calci',
                  style: TextStyle(
                    color: Colors.white,
                  )),
              actions: <Widget>[
                TextButton.icon(
                  icon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  label: Text('Sign in',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  onPressed: () {
                    widget.toggleview();
                  },
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TextFormField(
                              decoration: textInputDecoration.copyWith(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(45),
                                    borderSide: BorderSide(color: Colors.lime)),
                                hintText: 'Email',
                              ),
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter an email' : null,
                              onChanged: (val) {
                                setState(() => email = val);
                              }),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                            decoration: textInputDecoration.copyWith(
                                hintText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                            validator: (val) => val!.length < 6
                                ? 'Password must be more than 6 characters'
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() => password = val);
                            }),
                        SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(
                                        email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'please supply a valid email';
                                    loading = false;
                                  });
                                }
                              }
                            },
                            child: Text('Register',
                                style: TextStyle(
                                  color: Colors.black,
                                ))),
                        SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red, fontSize: 14.0),
                        )
                      ],
                    ))),
          );
  }
}
