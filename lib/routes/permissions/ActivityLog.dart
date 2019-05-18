import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class ActivityLog extends StatefulWidget {

  ActivityLog({Key key, this.whoHasActivityLog}) : super(key:key);
  final Map<String, dynamic> whoHasActivityLog;

  @override
  _ActivityLogState createState() => _ActivityLogState();
}

var template = new PermissionTemplate();

class _ActivityLogState extends State<ActivityLog> {

  String myHeader = "Information box";
  String myText = "hey girl, what you doing?!";
  String  myImageLeft =  "assets/activity1.jpeg";
  String  myImageRight =  "assets/activity2.jpeg";

  String myHeader2 = "FUN FACT";
  String myText2 = "hey girl, what you doing?!";
  String  myImage2 =  "assets/activity3.jpeg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('ACTIVITY LOG'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            child: template.textBoxWith2Pics(null, myImageLeft, myImageRight, myHeader , null, myText, null, 100),
          ),
          new Container(
            //Put in functions from the template below!!!
            child: template.boxRight(null, myImage2, myHeader2, myText2)
          ),

          //new Container(
              //child: template.otherPermissionBox(null, null, widget.whoHasActivityLog['whoHasActivityLog']),
            //),
          ],
      ),
    );
  }
}
