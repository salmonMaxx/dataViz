import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class AudioFiles extends StatefulWidget {
  @override
  _AudioFilesState createState() => _AudioFilesState();
}

var template = new PermissionTemplate();

class _AudioFilesState extends State<AudioFiles> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('ACTIVITY LOG'),
      ),
      body: ListView(
        children: <Widget>[
          //Put in functions from the template below!!!
          new Container(
              child: Text("HEJ")
          ),
        ],
      ),
    );
  }
}
