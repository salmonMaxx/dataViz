import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class Phone extends StatefulWidget {

  Phone({Key key, this.whoHasPhone}) : super(key:key);
  final Map<String, dynamic> whoHasPhone;

  @override
  _PhoneState createState() => _PhoneState();
}

var template = new PermissionTemplate();

class _PhoneState extends State<Phone> {


  // BOX 1
  String myImage = "assets/sensors1.jpg";
  String myHeader = "PHONE";
  String myText = "Phonephoneiphone ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('PHONE'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            //Put in functions from the template below!!!
            child: template.textBoxWithPic(null, myImage, myHeader , null, myText, null, 50),
          ),

          //TAKE AWAY COMMENTS
          //new Container(
          //child: template.otherPermissionBox(null, null, widget.whoHasPhone['whoHasPhone']),
          // ),
        ],
      ),
    );
  }
}