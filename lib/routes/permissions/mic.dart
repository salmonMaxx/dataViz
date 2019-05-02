import 'package:flutter/material.dart';

class Mic extends StatefulWidget {
  @override
  _MicState createState() => _MicState();
}

class _MicState extends State<Mic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Mic', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,

      ),
    );
  }
}
