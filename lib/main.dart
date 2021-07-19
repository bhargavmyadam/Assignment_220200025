import 'package:assignment220200025/screen3.dart';
import 'package:flutter/material.dart';
import 'screen2.dart';
import 'screen3.dart';

void main() {
  runApp(MaterialApp(
    home: Screen1(),
  ));
  //runApp();
}

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  String? _id;

  String? _password;

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: Center(
              child: Text(
                ' CRUX FLUTTER \nSUMMER GROUP',
                style: TextStyle(
                    color: Color(0xff2FC4B2),
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    'ID Number',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Please enter your BITS ID number.',
                      focusColor: Color(0xff2FC4B2),
                    ),
                    onChanged: (String str) {
                      this._id = str;
                    },
                    onSaved: (String? str) {
                      this._id = str;
                    },
                    validator: (String? value) {
                      if (value == '') {
                        return 'Please enter a valid ID number.';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Text(
                    'Password',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Please enter your password.',
                    ),
                    onChanged: (String str) {
                      this._password = str;
                    },
                    onSaved: (String? str) {
                      this._password = str;
                    },
                    validator: (String? value) {
                      if (value == '') {
                        return 'Please enter a valid password.';
                      }
                      return null;
                    },
                    obscureText: true,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                  child: TextButton(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xff2FC4B2),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        update(this._id);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Screen3();
                            },
                          ),
                        );
                      } else {
                        setState(() {});
                      }
                    },
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  alignment: Alignment.center,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Color(0xff2FC4B2),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account "),
                      TextButton(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Color(0xff2FC4B2),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Screen2();
                              },
                            ),
                          );
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
