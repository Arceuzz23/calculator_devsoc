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

  bool isPassVisible = false;
  Icon pass = Icon(
    Icons.visibility_off_outlined,
    color: Colors.grey,
  );
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                height: 10000,
                width: 1000,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("assets/images/cal_blurr1.jpg"),
                  fit: BoxFit.cover,
                  opacity: 0.5,
                )),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 169,
                    ),
                    Text(
                      "SIGN UP",
                      style: TextStyle(
                          fontSize: 50, fontFamily: 'Computo Monospace'),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                decoration: textInputDecoration.copyWith(
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(45),
                                      borderSide:
                                          BorderSide(color: Colors.lime)),
                                  hintText: 'Email',
                                ),
                                validator: (val) =>
                                    val!.isEmpty ? 'Enter an email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                decoration: textInputDecoration.copyWith(
                                    prefixIcon: Icon(
                                      Icons.lock_outline_rounded,
                                      color: Colors.grey,
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isPassVisible = !isPassVisible;
                                          if (isPassVisible)
                                            pass = Icon(
                                              Icons.visibility,
                                              color: Colors.grey,
                                            );
                                          else
                                            pass = Icon(
                                              Icons.visibility_off_outlined,
                                              color: Colors.grey,
                                            );
                                        });
                                      },
                                      icon: pass,
                                    ),
                                    hintText: 'Password',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    )),
                                validator: (val) => val!.length < 6
                                    ? 'Password must be more than 6 characters'
                                    : null,
                                obscureText: isPassVisible ? false : true,
                                onChanged: (val) {
                                  setState(() => password = val);
                                }),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                              ),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromRGBO(236, 61, 61, 1)),
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      setState(() => loading = true);
                                      dynamic result = await _auth
                                          .registerWithEmailAndPassword(
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
                                        fontSize: 19,
                                        fontFamily: 'Trito Writter',
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                      ))),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already a user? ",
                                  style: TextStyle(
                                    fontFamily: 'Trito Writter',
                                    fontSize: 18,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    widget.toggleview();
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: const TextStyle(
                                      fontFamily: 'Trito Writter',
                                      fontSize: 18,
                                      color: Color.fromRGBO(236, 61, 61, 1),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              error,
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.0),
                            )
                          ],
                        )),
                  ],
                )),
          );
  }
}
