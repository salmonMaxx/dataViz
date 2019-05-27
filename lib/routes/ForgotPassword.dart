import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _email;
  String _newPassword;

  final focusUser = FocusNode();
  final focusPass = FocusNode();
  String url = 'https://34.74.219.4:443/forgot'; //server url
  //String url = 'http://192.168.43.25:3000/forgot'; //local url
  final formkey = new GlobalKey<FormState>();

  checkFields() {
    final form = formkey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<String> getSecurityQuestion() async {
    checkFields();
    var response;
    try{response = await http.post(url,
        body: json.encode({
          'username': _email,
          'password': _newPassword,
        }),
        headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
        });}
        catch(e){
        print('lets continue');
        }
    print(response.statusCode);
    if (response.statusCode == 200) {
      _showDialog(context, 'Password reset sent', 'A mail has been sent to your email adress with a confirmation link');
    } else {
      _showDialog(context, 'Failed to find email',
          'The email is not registered.');
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: 300.0,
            width: 300.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/logo_dataviz_1.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(500.0),
                  bottomRight: Radius.circular(500.0)),
            ),
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
                              focusUser,
                              focusPass),
                          SizedBox(
                            width: 20.0,
                            height: 20.0,
                          ),
                          _input(
                            "New password", true, "NEW PASSWORD", "Enter your new password", (value) => _newPassword = value, focusPass, focusPass),

                          new Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 80.0, right: 80.0, top: 20.0),
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
                                                  child: new Text("OK!",
                                                      style: new TextStyle(
                                                          fontSize: 30.0,
                                                          color: Colors.white))),
                                              /*child: Text("OK! "),*/
                                              onPressed: getSecurityQuestion),
                                        ),
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
                                  new Row(
                                    children: <Widget>[

                                    ],
                                  ),
                                  SizedBox(height: 15.0),
                                ],
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
              if (title == "Password reset sent")
                Navigator.of(context).pushReplacementNamed('login');
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
