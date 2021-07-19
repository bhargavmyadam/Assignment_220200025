import 'package:flutter/Material.dart';
import 'screen3.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String? _id;
  String? _password;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xff2FC4B2),
              ),
              alignment: Alignment.center,
              child: Text(
                'CRUX FLUTTER SUMMER GROUP',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: this._formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: Text(
                      'ID Number',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Please enter your BITS ID Number.',
                      ),
                      onChanged: (String? str) {
                        this._id = str;
                      },
                      onSaved: (String? str) {
                        this._id = str;
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid ID Number';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: Text(
                      'Password',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Please enter your Password.',
                      ),
                      onChanged: (String? str) {
                        this._password = str;
                      },
                      onSaved: (String? str) {
                        this._password = str;
                      },
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Please enter a valid password';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                    child: Text(
                      'Batch',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    child: MyDropdownButton(),
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text(
                          'Receive Regular Updates ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: MySwitch(),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                    child: Text(
                      'Are you excited for this !!',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                    child: MyRadio(),
                  ),
                  Container(
                    //padding: EdgeInsets.fromLTRB(10, 30, 10, 0),
                    child: TextButton(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color(0xff2FC4B2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                          ),
                        ),
                      ),
                      onPressed: () {
                        if (this._formkey.currentState!.validate()) {
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
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account "),
                        TextButton(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xff2FC4B2),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
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
      ),
    );
  }
}

class MySwitch extends StatefulWidget {
  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: this.value,
      onChanged: (value) {
        setState(() {
          this.value = value;
        });
      },
      activeColor: Color(0xff2FC4B2),
      activeTrackColor: Color(0xff2FC4B2),
      inactiveThumbColor: Color(0xff2FC4B2),
    );
  }
}

class MyRadio extends StatefulWidget {
  @override
  _MyRadioState createState() => _MyRadioState();
}

class _MyRadioState extends State<MyRadio> {
  String? value = '';
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
              groupValue: this.value,
              value: 'Yes',
              onChanged: (String? value) {
                setState(() {
                  this.value = value;
                });
              },
              activeColor: Colors.grey,
            ),
            Text('Yes'),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Radio(
              groupValue: this.value,
              value: 'No',
              onChanged: (String? value) {
                setState(() {
                  this.value = value;
                });
              },
              activeColor: Colors.grey,
            ),
            Text('No'),
          ],
        ),
      ],
    );
  }
}

class MyDropdownButton extends StatefulWidget {
  @override
  _MyDropdownButtonState createState() => _MyDropdownButtonState();
}

class _MyDropdownButtonState extends State<MyDropdownButton> {
  static List<String> items = <String>['2020', '2019', '2018', '2017', '2016'];
  String? value = items.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String?>(
      value: this.value,
      isExpanded: true,
      items: items
          .map(
            (item) => DropdownMenuItem<String?>(
              value: item,
              child: Text(item),
            ),
          )
          .toList(),
      onChanged: (String? value) {
        setState(() {
          this.value = value;
        });
      },
    );
  }
}
