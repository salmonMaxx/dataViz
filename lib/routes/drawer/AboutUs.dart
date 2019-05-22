import 'package:flutter/material.dart';
import '../PermissionTemplate.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String myText =
      'Why care about app permissions? Maybe you have heard that “data is the new oil” but what does that actually mean? With this app, we want to visualize what different types of data there is and why you should care about protecting it. \n \n Behind the development of the app are three students at Uppsala University who want to raise awareness of data gathering and encourage users to make thoughtful decisions about their personal data. The only data we save is your username and your encrypted password, all other app functions are not stored.';
  var template = new PermissionTemplate();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('ABOUT US',
            textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(children: <Widget>[
        new Container(
            child: template.textBoxWithPic(null, 'assets/logo_dataviz_1.png',
                'About us', null, myText, 17, 200))
      ]),
    );
  }
}
