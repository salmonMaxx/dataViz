import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgetMe extends StatefulWidget {
  @override
  _ForgetMeState createState() => _ForgetMeState();
}

class _ForgetMeState extends State<ForgetMe> {
  String _email;
  String _password;
  String url = 'http://192.168.43.25:3000/delete'; //change to server later
  final focusUser = FocusNode();
  final focusPass = FocusNode();
  final formkey = new GlobalKey<FormState>();

  checkFields() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<String> deleteFromDB() async {
    checkFields();
    var response = await http.post(url,
        body: json.encode({
          'username': _email,
          'password': _password,
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        });
    print(response.body);
    if (response.statusCode == 200) {
      _showDialog(context, "Account deleted",
          "Nice job! Continue to protect your data. You will be redirected to the signup page!");
    }
    else{
      _showDialog(context, "Failed to delete account", "Make sure to enter the correct credentials.");
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Forget Me!'),
        backgroundColor: Colors.indigo[900],
        actions: <Widget>[
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            color: Colors.deepPurple[300],
            height: 120,
            width: 110,
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Center(
                      child: Form(
                    key: formkey,
                    child: Center(
                        child: ListView(shrinkWrap: true, children: <Widget>[
                      SizedBox(
                        width: 20,
                        height: 200,
                        child: Card(
                          child: Text(
                            'FANTASTIC! \n \n'
                            'We really encourage our users to delete their accounts to protect their data. '
                            'Remember that you have the right to delete your data on other apps and plattforms as well. '
                            '\n\nTake back controll of your data! ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      _input(
                          "required email",
                          false,
                          "EMAIL",
                          'Enter your account\'s email',
                          (value) => _email = value,
                          focusUser,
                          focusPass),
                      SizedBox(
                        width: 20.0,
                        height: 20.0,
                      ),
                      _input("required password", true, "PASSWORD", 'Password',
                          (value) => _password = value, focusPass, focusPass),
                      new Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: RaisedButton(
                                            child: Text('Forget me'),
                                            onPressed: () {
                                              deleteFromDB();
                                            },
                                            splashColor: Colors.amber,
                                            color: Colors.lightGreenAccent,
                                          ),
                                          flex: 1,
                                        ),
                                        Expanded(
                                          child: RaisedButton(
                                            child: Text('Cancel'),
                                            onPressed: () {},
                                            splashColor: Colors.amber,
                                            color: Colors.red[900],
                                          ),
                                        )
                                      ],
                                    )
                                  ]))))
                    ])),
                  ))))
        ],
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String body) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(title),
          content: new Text(body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                if (title == "Account deleted")
                  Navigator.of(context).pushReplacementNamed('signup');
                else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  Widget _input(String validation, bool, String label, String hint, save,
      FocusNode currentFocus, FocusNode nextFocus) {
    if (nextFocus != currentFocus) {
      return new TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        obscureText: bool,
        style: new TextStyle(color: Colors.black),
        validator: (value) => value.isEmpty ? validation : null,
        onSaved: save,
        onFieldSubmitted: (term) {
          FocusScope.of(context).requestFocus(nextFocus);
        },
      );
    } else {
      return new TextFormField(
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
        obscureText: bool,
        validator: (value) => value.isEmpty ? validation : null,
        onSaved: save,
        focusNode: currentFocus,
        onFieldSubmitted: (term) {
          currentFocus.unfocus();
        },
      );
    }
  }
}
