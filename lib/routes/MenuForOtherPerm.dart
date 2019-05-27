import 'package:flutter/material.dart';
import 'PermissionTemplate.dart';

import './permissions/Calendar.dart';
import './permissions/Phone.dart';
import './permissions/CallLog.dart';
import './permissions/Camera.dart';



class MenuForOtherPerm extends StatefulWidget {
  MenuForOtherPerm(this.appInfo);
  final Map<String, List<String>> appInfo;

  @override
  _MenuForOtherPermState createState() => _MenuForOtherPermState();
}

var template = new PermissionTemplate();

class _MenuForOtherPermState extends State<MenuForOtherPerm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('OTHER PERMISSIONS'),
      ),
      body: ListView(
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new Calendar(widget.appInfo["calendar"]));
              Navigator.of(context).push(route);
            },
            child: new Container(
              child: template.textBox(null, "CALENDAR", null, null, null, null),
            ),
          ),
          new GestureDetector(
            onTap: () {
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new CallLog(widget.appInfo["callLog"]));
              Navigator.of(context).push(route);
            },
            child: new Container(
              child: template.textBox(null, "CALL LOG", null, null, null, null),
            ),
          ),
          new GestureDetector(
            onTap: () {
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new Camera(widget.appInfo["camera"]));
              Navigator.of(context).push(route);
            },
            child: new Container(
              child: template.textBox(null, "CAMERA", null, null, null, null),
            ),
          ),
          new GestureDetector(
            onTap: () {
              var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new Phone(widget.appInfo["phone"]));
              Navigator.of(context).push(route);
            },
            child: new Container(
              child: template.textBox(null, "PHONE", null, null, null, null),
            ),
          ),
          new GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("sensors"),
            child: new Container(
              child: template.textBox(null, "SENSORS", null, null, null, null),
            ),
          ),
        ],
      ),
    );
  }
}
