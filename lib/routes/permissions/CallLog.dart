import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';

import '../PermissionTemplate.dart';

class CallLog extends StatefulWidget {

  CallLog(this.whoHasCallLog);
  final List<String> whoHasCallLog;

  @override
  _CallLogState createState() => _CallLogState();
}

var template = new PermissionTemplate();

class _CallLogState extends State<CallLog> {

  // BOX 1
  String myImage = "assets/blomma_test.jpg";
  String myHeader = "Would you like to share who you have called recently?";
  String myText = "\nYour call log contains a register of all phone calls you have conducted and details about for example who dialed and the call time. \n \nSince the beginning of 2019 Google has restricted all Android apps to access call log data except if you are the default phone app on your phone. This update is great since it protects data from being used by apps that do not really require it.";

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
            child: template.textBoxWithPic(null, myImage, myHeader , 25, myText, 18, 150),
          ),

          new Container(
          child: template.otherPermissionBox(null, null, widget.whoHasCallLog),
           ),
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