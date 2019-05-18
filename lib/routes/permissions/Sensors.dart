import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class Sensors extends StatefulWidget {

  Sensors({Key key, this.whoHasSensors}) : super(key:key);
  final Map<String, dynamic> whoHasSensors;


  @override
  _SensorsState createState() => _SensorsState();
}

var template = new PermissionTemplate();

class _SensorsState extends State<Sensors> {
  // BOX 1
  String myImage = "assets/sensors1.jpg";
  String myHeader = "INFORMATION BOX";
  String myText = "Movement!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('SENSORS'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            //Put in functions from the template below!!!
            child: template.textBoxWithPic(null, myImage , myHeader , null, myText, null, 200),
          ),

          //TAKE AWAY COMMENTS
          //new Container(
          //child: template.otherPermissionBox(null, null, widget.whoHasSensors['whoHasSensors']),
          // ),
        ],
      ),
    );
  }
}