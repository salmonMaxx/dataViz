import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';
class AudioFiles extends StatefulWidget {

  AudioFiles({Key key, this.whoHasAudioFiles}) : super(key:key);
  final Map<String, dynamic> whoHasAudioFiles;

  @override
  _AudioFilesState createState() => _AudioFilesState();

}

var template = new PermissionTemplate();

class _AudioFilesState extends State<AudioFiles> {
  // BOX 1
  String myImage1 = "assets/audiofile1.jpg";
  String myImage2 = "assets/audiofile2.jpg";
  String myHeader = "INFORMATION BOX";
  String myText = "something about audio files!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('AUDIO FILES'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            //Put in functions from the template below!!!
            child: template.textBoxWith2Pics(null, myImage1 , myImage2, myHeader , null, myText, null, 100),
          ),

          //TAKE AWAY COMMENTS
          //new Container(
          //child: template.otherPermissionBox(null, null, widget.whoHasAudioFiles['whoHasAudioFiles']),
          // ),
        ],
      ),
    );
  }
}