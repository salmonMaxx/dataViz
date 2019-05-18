import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  void _openSetting() {
    PhotoManager.openSetting();
  }

  _capitalizeString(String str) {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

  List <String> theList = ["MANAGE YOUR PERMISSIONS"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('SETTINGS', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.indigo[900],
      ),
      body: ListView.separated(
        separatorBuilder: (context, i) => Divider(
          color: Colors.indigo[900],
        ),
        padding: EdgeInsets.all(15.0),
        itemCount: theList.length,
        itemBuilder: (context, i) {
          return new ListTile(
            title: Text(
              _capitalizeString(theList[i]),
              style: TextStyle(color: Colors.indigo[900], fontSize: 25),
            ),
            onTap: () {_openSetting();},
          );
        },
      ),
    );
  }
}
