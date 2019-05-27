import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email;
  String _password;
  final focusPass = FocusNode();
  final focusUser = FocusNode();
  String url = 'https://34.74.219.4:443/login'; //server url
  //String url = 'http://192.168.43.25:3000/login'; //local url
  final formkey = new GlobalKey<FormState>();

  checkFields() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<String> logIn() async {
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
    if (response.statusCode == 200) {
      Navigator.of(context).pushReplacementNamed('menu');
    } else {
      _showDialog(context, 'Failed to log in',
          'The combination of email and password is not valid');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 100.0, right: 100.0, top: 20.0),
            height: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logo_dataviz_1.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(500.0),
                  bottomRight: Radius.circular(500.0)),
            ),
          ),
          new Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    child: new Text(
                      "LOGIN",
                      style: new TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new OutlineButton(
                      color: Colors.transparent,
                      borderSide: const BorderSide(style: BorderStyle.none),
                      onPressed: () {
                        Navigator.of(context).pushNamed('signup');
                      },
                      child: new Text("SIGN UP",
                          style: new TextStyle(
                              fontSize: 25.0, color: Colors.white30))),
                ),
              ),
            ],
          ), //login and sign in menu button
          Center(
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Center(
                child: Form(
                  key: formkey,
                  child: Center(
                    child: ListView(
                      shrinkWrap: true,
                      children: <Widget>[
                        _input(
                            "required email",
                            false,
                            "EMAIL",
                            'Enter your Email',
                            (value) => _email = value,
                            focusUser,
                            focusPass),
                        SizedBox(
                          width: 20.0,
                          height: 20.0,
                        ),
                        _input(
                            "required password",
                            true,
                            "PASSWORD",
                            'Password',
                            (value) => _password = value,
                            focusPass,
                            focusPass),
                        new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Flexible(
                                  child: new Container(
                                    margin: EdgeInsets.only(top: 50.0),
                                      height: 60.0,
                                      width: 100,
                                      decoration: new BoxDecoration(
                                        color: Color(0xFF2E7D32),
                                        borderRadius:
                                        new BorderRadius.circular(25.0),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.indigo[300],
                                            offset: Offset(1.0, 1.0),
                                            blurRadius: 10.0,
                                          ),
                                        ],
                                      ),
                                  child: OutlineButton(
                                      borderSide: const BorderSide(
                                          style: BorderStyle.none),
                                          child: new Text("OK!",
                                              style: new TextStyle(
                                                  fontSize: 30.0,
                                                  color: Colors.white)),
                                      /*child: Text("OK! "),*/
                                      onPressed: logIn),
                                  ),),
                              ],
                            ),
                            SizedBox(height: 15.0),
                            new Row(
                              children: <Widget>[
                                Expanded(
                                  child: OutlineButton(
                                    borderSide: const BorderSide(
                                        style: BorderStyle.none),
                                    child: new Container(
                                        alignment: Alignment.center,
                                        height: 60.0,
                                        child: new Text("FORGOT PASSWORD",
                                            style: new TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white))),
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              'forgotPassword');
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
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
        style: new TextStyle(color: Colors.white),
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
              if (title == "Registration succesfull")
                Navigator.of(context).pushReplacementNamed('menu');
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
