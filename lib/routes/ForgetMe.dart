import 'package:flutter/material.dart';
import 'PermissionTemplate.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgetMe extends StatefulWidget {
  @override
  _ForgetMeState createState() => _ForgetMeState();
}

class _ForgetMeState extends State<ForgetMe> {
  String _email;
  String _password;
  String url = 'http://34.74.219.4:80/delete'; //server url
  //String url = 'http://192.168.43.25:3000/delete'; //local url
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
    } else {
      _showDialog(context, "Failed to delete account",
          "Make sure to enter the correct credentials.");
    }
  }

  String forgetpic = 'assets/forgetmepic.jpg';

  var template = new PermissionTemplate();

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        centerTitle: true,
        title: Text('FORGET ME!'),
        backgroundColor: Colors.indigo[900],
        actions: <Widget>[],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Form(
                  key: formkey,
                  child: template.textWithPic(
                      context,
                      forgetpic,
                      "FANTASTIC!",
                      60,
                      'We really encourage our users to delete their accounts to protect their data.'
                      '\nRemember that you have the right to delete your data on other apps and plattforms as well. '
                      '\n\nTake back controll of your data! ',
                      null,
                      130,
                      Colors.indigo[900]),
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
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                padding: EdgeInsets.all(5.0),
                                child: Text('Forget me',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                ),
                                onPressed: () {
                                  deleteFromDB();
                                },
                                splashColor: Colors.amber,
                                color: Colors.green,
                              ),
                              flex: 1,
                            ),
                            Expanded(
                              child: RaisedButton(
                                padding: EdgeInsets.all(5.0),
                                child: Text('Cancel',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),),
                                onPressed: () {Navigator.popAndPushNamed(context, "homepage");} ,
                                splashColor: Colors.amber,
                                color: Colors.red[900],
                                
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
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
