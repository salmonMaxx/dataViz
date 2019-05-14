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
      body: new ListTile(
            title: Text("MANAGE YOUR PERMISSIONS", style: new TextStyle(fontSize: 25)),
            onTap: _openSetting,
          ),
    );
  }
}
