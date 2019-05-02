import 'package:flutter/material.dart';

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
    );
  }
}
