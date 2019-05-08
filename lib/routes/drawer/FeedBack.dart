import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('FEEDBACK', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,

      ),
    );
  }
}
