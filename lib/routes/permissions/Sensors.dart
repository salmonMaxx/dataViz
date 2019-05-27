import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class Sensors extends StatefulWidget {

  /*Sensors({Key key, this.whoHasSensors}) : super(key:key);
  final Map<String, dynamic> whoHasSensors;*/


  @override
  _SensorsState createState() => _SensorsState();
}

var template = new PermissionTemplate();

class _SensorsState extends State<Sensors> {
  // BOX 1
  String myImage = "assets/sensors1.jpg";
  String myHeader = "Your phone follows your every move";
  String myText = "A normal modern smartphone is equipped with numerous sensors that you may never have heard of. There are motion sensors feeling movements and rotations, environmental sensors measuring air temperature, air pressure, and humidity and position sensors that automatically register magnetic fields near the phone. To mention some. Most of these sensors are available for all apps and impossible to deny, the only exception is sensors that measure the body, for example, heart rate measurements.";

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
            child: template.textBoxWithPic(null, myImage , myHeader , 20, myText, 14, 200),
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