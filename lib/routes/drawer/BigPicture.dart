import 'package:flutter/material.dart';

class BigPicture extends StatefulWidget {
  @override
  _BigPictureState createState() => _BigPictureState();
}

class _BigPictureState extends State<BigPicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('BIG PICTURE', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,

      ),
    );
  }
}
