import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class Phone extends StatefulWidget {

  Phone(this.whoHasPhone);
  final List <String> whoHasPhone;

  @override
  _PhoneState createState() => _PhoneState();
}

var template = new PermissionTemplate();

class _PhoneState extends State<Phone> {


  // BOX 1
  String myImage = "assets/phone2.jpg";
  String myHeader = "Who would you like us to call?";
  String myText = "The phone permission is regarded as one of the most vulnerable permissions since it allows for an app to make calls from your phone without asking the user. Even though it is fortuneatly very uncommon this could allow the app to call numbers which requieres you to pay money. Furthermore, an app with this permission could open your dialer with an already written number just for the user to confirm.";

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
            child: template.textBoxWithPic(null, myImage, myHeader , 18, myText, 15, 100),
          ),
          new Container(
          child: template.otherPermissionBox(null, null, widget.whoHasPhone),
           ),
        ],
      ),
    );
  }
}