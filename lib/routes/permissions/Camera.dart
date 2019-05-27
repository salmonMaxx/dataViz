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
  String myHeader = "Would you like to get recognised - always?";
  String myText = "An app that has the camera permission can, of course, take photos. Taking photos is not very dangerous by itself but often photos are uploaded to cloud servers where they are anonymously aggregated and used to develop face recognition algorithms. Thus, uploaded photos can help increasing surveillance in society.";

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