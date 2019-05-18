import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';

import '../PermissionTemplate.dart';

class CallLog extends StatefulWidget {

  CallLog({Key key, this.whoHasCallLog}) : super(key:key);
  final Map<String, dynamic> whoHasCallLog;

  @override
  _CallLogState createState() => _CallLogState();
}

var template = new PermissionTemplate();

class _CallLogState extends State<CallLog> {

  // BOX 1
  String myImage = "assets/blomma_test.jpg";
  String myHeader = "SOMETHING ABOUT CALL LOG";
  String myText = "Call Log";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('CALL LOG'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            //Put in functions from the template below!!!
            child: template.textBoxWithPic(null, myImage, myHeader , null, myText, null, 150),
          ),

          //TAKE AWAY COMMENTS
          //new Container(
          //child: template.otherPermissionBox(null, null, widget.whoHasCallLog['whoHasCallLog']),
          // ),
        ],
      ),
    );
  }
}

/*
// GET WHOLE CALL LOG
Iterable<CallLogEntry> entries = await CallLog.get();

// QUERY CALL LOG (ALL PARAMS ARE OPTIONAL)
var now = DateTime.now();
int from = now.subtract(Duration(days: 60)).millisecondsSinceEpoch;
int to = now.subtract(Duration(days: 30)).millisecondsSinceEpoch;
Iterable<CallLogEntry> entries = await CallLog.query(
dateFrom: from,
dateTo: to,
durationFrom: 0,
durationTo: 60,
name: 'John Doe',
number: '901700000',
type: CallType.incoming,
);*/