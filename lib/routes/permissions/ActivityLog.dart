import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class ActivityLog extends StatefulWidget {
  @override
  _ActivityLogState createState() => _ActivityLogState();
}

var template = new PermissionTemplate();

class _ActivityLogState extends State<ActivityLog> {

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
          new Container(
            //Put in functions from the template below!!!
            child: Text("HEJ")
          ),
        ],
      ),
    );
  }
}
