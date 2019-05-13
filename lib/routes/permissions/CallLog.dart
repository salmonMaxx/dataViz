import 'package:flutter/material.dart';
import 'package:call_log/call_log.dart';

class CallLog extends StatefulWidget {
  @override
  _CallLogState createState() => _CallLogState();
}

class _CallLogState extends State<CallLog> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Call Log', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,

      ),
      body: new ListView(
      children: <Widget>[
       new Column(
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