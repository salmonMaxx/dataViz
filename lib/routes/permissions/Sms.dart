import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class SMS extends StatefulWidget {

  SMS({Key key, this.whoHasSMS}) : super(key:key);
  final Map<String, dynamic> whoHasSMS;

  @override
  _SMSState createState() => _SMSState();
}

var template = new PermissionTemplate();

class _SMSState extends State<SMS> {

  // BOX 1
  String myImage = "assets/sensors1.jpg";
  String myHeader = "SMS";
  String myText = "Secrets, nonono!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('SMS'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            //Put in functions from the template below!!!
            child: template.boxRight(null, myImage, myHeader, myText),
          ),

          //TAKE AWAY COMMENTS
          //new Container(
          //child: template.otherPermissionBox(null, null, widget.whoHasPhone['whoHasPhone']),
          // ),
        ],
      ),
    );
  }
}