import 'package:flutter/material.dart';

class SMS extends StatefulWidget {
  @override
  _SMSState createState() => _SMSState();
}

class _SMSState extends State<SMS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('SMS', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,

      ),
    );
  }
}
