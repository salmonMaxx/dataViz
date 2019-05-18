import 'package:flutter/material.dart';
import 'PermissionTemplate.dart';

class ForgetMe extends StatefulWidget {
  @override
  _ForgetMeState createState() => _ForgetMeState();
}

class _ForgetMeState extends State<ForgetMe> {
  TextEditingController statusText = TextEditingController();

  changeText(String msg) {
    setState(() {
      if (msg.startsWith('N')) {
        statusText.text = 'You will now be forgotten!';
      } else {
        Navigator.pop(context);
      }
    });
  }

  deleteFromDB() {
    print('Now you are forgotten');
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
              template.textWithPic(
                  forgetpic,
                  "FANTASTIC!",
                  60,
                  'We really encourage our users to delete their accounts to protect their data.'
                  '\nRemember that you have the right to delete your data on other apps and plattforms as well. '
                  '\n\nTake back controll of your data! ',
                  null,
                  150,
                  Colors.indigo[900]),
              new Container(
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
                                    child: Text('Forget me',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold)),
                                    onPressed: () {
                                      template.popUp(context,
                                          'You will now be forgotten!',
                                          "When pressing OK! you will be signed out and not a part of our database any more.",
                                          'OK!',
                                          Colors.green, "login", deleteFromDB
                                      );
                                    },
                                    splashColor: Colors.amber,
                                    color: Colors.green,
                                  ),
                                  flex: 1,
                                ),
                                Expanded(
                                  child: RaisedButton(
                                    child: Text('Cancel', style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
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
            ],
          ),
        ],
      ),
    );
  }
}
