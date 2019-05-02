import 'package:flutter/material.dart';

class AudioFiles extends StatefulWidget {
  @override
  _AudioFilesState createState() => _AudioFilesState();
}

class _AudioFilesState extends State<AudioFiles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Audio Files', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,

      ),
    );
  }
}
