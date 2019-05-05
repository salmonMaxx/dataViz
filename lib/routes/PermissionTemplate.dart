import 'package:flutter/material.dart';

class PermissionTemplate extends StatefulWidget {
  @override
  _PermissionTemplateState createState() => _PermissionTemplateState();
}

boxRight(String myImage, String myHeader, String myText) {
  return new Container(
    height: 150,
    decoration: BoxDecoration(
        color: Colors.indigo[100],
        borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
    margin: EdgeInsets.all(10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(0),
            margin:
                EdgeInsets.only(left: 10.0, top: 7.5, bottom: 7.5, right: 50.0),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.indigo[900], width: 2),
              image: new DecorationImage(
                image: new AssetImage(myImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Expanded(
          child: Text(myHeader,
              style: TextStyle(color: Colors.indigo[900], fontSize: 25)),
        ),
      ],
    ),
  );
}

boxLeft(String myImage, String myHeader, String myText) {
  return new Container(
    height: 150,
    decoration: BoxDecoration(color: Colors.indigo[100]),
    margin: EdgeInsets.all(10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(myHeader,
                style: TextStyle(color: Colors.indigo[900], fontSize: 25)),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(0),
            margin:
                EdgeInsets.only(left: 50.0, top: 7.5, bottom: 7.5, right: 10.0),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.indigo[900], width: 2),
              image: new DecorationImage(
                image: new AssetImage(myImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

class _PermissionTemplateState extends State<PermissionTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Permissions <3',
            textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,
      ),
      body: boxRight(
          'assets/test1.jpg', "HEJ HEJ HEJ HEJ HEJ", "HEJ HEJ HEJ HEJ HEJ"),
    );
  }
}
