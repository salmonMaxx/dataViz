import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatefulWidget {
  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  String _email;
  String _password;
  final focusEmail = FocusNode();
  final focusPass = FocusNode();
  String url = 'http://34.74.219.4:80/register'; //server url
  //String url = 'http://192.168.43.25:3000/register'; //local url

  final formkey = new GlobalKey<FormState>();
  checkFields() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<String> signUp() async {
    print('makeRequest is running');
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
    print(response.statusCode);
    if (response.statusCode == 200) {
      _showDialog(context, "Registration succesfull", "Welcome to the app!");
    } else if (response.statusCode == 422) {
      _showDialog(context, "Couldn't create account",
          "You have to use a correct email.");
    } else if (response.statusCode == 409) {
      _showDialog(context, "Couldn't create acount", "User exists already.");
    } else if (response.statusCode == 400) {
      _showDialog(context, "Couldn't create account",
          "You have to fill in all fields.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.pink[300],
      appBar: AppBar(
        /*title: Image(image:AssetImage("Pictures/nobel2.jpg"), height: 30.0,fit: BoxFit.fitHeight,),*/

        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: 20.0,
            width: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(500.0),
                  bottomRight: Radius.circular(500.0)),
            ),
          ),
          new Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
                  child: new OutlineButton(
                      color: Colors.transparent,
                      borderSide: const BorderSide(style: BorderStyle.none),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: new Text("LOGIN",
                          style: new TextStyle(
                              fontSize: 25.0, color: Colors.white30))),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Container(
                    alignment: Alignment.center,
                    height: 60.0,
                    child: new Text(
                      "SIGN UP",
                      style: new TextStyle(fontSize: 25.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                          focusEmail,
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
                                      child: OutlineButton(
                                          borderSide: const BorderSide(
                                              style: BorderStyle.none),
                                          child: new Container(
                                              alignment: Alignment.center,
                                              height: 60.0,
                                              decoration: new BoxDecoration(
                                                color: Color(0xFF2E7D32),
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        25.0),
                                                boxShadow: <BoxShadow>[
                                                  BoxShadow(
                                                    color: Colors.indigo[300],
                                                    offset: Offset(1.0, 1.0),
                                                    blurRadius: 10.0,
                                                  ),
                                                ],
                                              ),
                                              child: new Text(
                                                  "Create new account",
                                                  style: new TextStyle(
                                                      fontSize: 20.0,
                                                      color: Colors.white))),
                                          /*child: Text("OK! "),*/
                                          onPressed: signUp),
                                    ),
                                    SizedBox(
                                      height: 18.0,
                                      width: 18.0,
                                    ),
                                    SizedBox(
                                      height: 18.0,
                                      width: 18.0,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
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
        validator: (value) => value.isEmpty ? validation : null,
        onSaved: save,
        textInputAction: TextInputAction.next,
        focusNode: currentFocus,
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
