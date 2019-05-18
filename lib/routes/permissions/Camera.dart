import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class Camera extends StatefulWidget {

  Camera({Key key, this.whoHasCamera}) : super(key:key);
  final Map<String, dynamic> whoHasCamera;

  @override
  _CameraState createState() => _CameraState();
}

var template = new PermissionTemplate();

class _CameraState extends State<Camera> {

  // BOX 1
  String myImage = "assets/camera1.jpg";
  String myHeader = "1 PIC = 1000 WORDS";
  String myText = "What if someone can see you trough your phones camera?! scarey right?? ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('CAMERA'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            //Put in functions from the template below!!!
              child: template.textBoxWithPic(null, myImage, myHeader , null, myText, null, 150),
          ),

          //TAKE AWAY COMMENTS
          //new Container(
            //child: template.otherPermissionBox(null, null, widget.whoHasCamera['whoHasCamera']),
         // ),
        ],
      ),
    );
  }
}