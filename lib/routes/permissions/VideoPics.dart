import 'package:flutter/material.dart';

class VideoPics extends StatefulWidget {
  @override
  _VideoPicsState createState() => _VideoPicsState();
}

class _VideoPicsState extends State<VideoPics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Video and Pictures', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,

      ),
    );
  }
}
