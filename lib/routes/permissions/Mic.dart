import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class Mic extends StatefulWidget {

  Mic({Key key, this.whoHasMic}) : super(key:key);
  final Map<String, dynamic> whoHasMic;

  @override
  _MicState createState() => _MicState();
}

var template = new PermissionTemplate();

class _MicState extends State<Mic> {

  // BOX 1
  String myImage = "assets/audiofile2.jpg";
  String myHeader = "MIC";
  String myText = "sing, speak and more ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('MIC'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            //Put in functions from the template below!!!
            child: template.textBoxWithPic(null, myImage , myHeader , null, myText, null, 80),
          ),

          //TAKE AWAY COMMENTS
          /*new Container(
          child: template.otherPermissionBox(null, null, widget.whoHasMic['whoHasMic']),
           ),*/
        ],
      ),
    );
  }
}