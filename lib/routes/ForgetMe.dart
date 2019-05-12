import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgetMe extends StatefulWidget {
  @override
  _ForgetMeState createState() => _ForgetMeState();
}

class _ForgetMeState extends State<ForgetMe> {
  TextEditingController statusText = TextEditingController();
  String _email;
  String _password;
  String url = 'http://192.168.43.25:3000/delete'; //change to server later

  changeText(String msg) {
    setState(() {
      if (msg.startsWith('N')) {
        statusText.text = 'You will now be forgotten!';
      } else {
        Navigator.pop(context);
      }
    });
  }

  Future<String> deleteFromDB() async{
    print('Now you are forgotten');
    var response = await http.post(url, body: json.encode({
      'username': _email,
      'password': _password,
    }),
    headers: {"Content-Type": "application/json", "Accept": "application/json",});
    print(response.body);
    if (response.statusCode == 200) {
      _showDialog(context, "Account deleted", "Nice job! Continue to protect your data. You will be redirected to the startpage!");
    }
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Forget Me!'),
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done_outline),
            tooltip: 'Press to be forgotten',
            //onPressed: deleteFromDB(),
          )
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
                child: ListView(shrinkWrap: true, children: <Widget>[
              SizedBox(
                width: 20,
                height: 180,
                child: Card(child: Text('FANTASTIC! \n \n'
                    'We really encourage our users to delete their accounts to protect their data.'
                    'Remember that you have the right to delete your data on other apps and plattforms as well. '
                    '\n\nTake back controll of your data! ',
                  style: TextStyle(fontSize: 18),
                ),),
              ),
              new Padding(
                padding: EdgeInsets.all(8),
                child: TextField(
                  controller: statusText,
                  onChanged: (v) => statusText.text = v,
                ),
              ),
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
                                      changeText(
                                          'Now you have pushed the button');
                                    },
                                    splashColor: Colors.amber,
                                    color: Colors.lightGreenAccent,
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: RaisedButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      changeText('Cancel');
                                    },
                                    splashColor: Colors.amber,
                                    color: Colors.red[900],
                                  ),
                                )
                              ],
                            )
                          ]))))
            ])),
          ))
        ],
      ),
    );
  }
}

void _showDialog(BuildContext context, String title, String body) {
  // flutter defined function
  showDialog(
    context:  context,
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
              if(title == "Registration succesfull")
                Navigator.of(context).pushReplacementNamed('menu');
              else{
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      );
    },
  );
}
