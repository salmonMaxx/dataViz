import 'package:flutter/material.dart';

import '../PermissionTemplate.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();

  Calendar(this.whoHasCalendar);
  final List <String> whoHasCalendar;

}

var template = new PermissionTemplate();

class _CalendarState extends State<Calendar> {

  String myHeader = "INFORMATION BOX";
  String myText = "We can see you";
  String  myImage1 =  "assets/calender1.jpg";
  String  myImage2 =  "assets/calender2.jpg";
  String  myImage3 =  "assets/calender3.jpeg";

  String myHeader2 = "FUN FACT";
  String myText2 = "hey girl, what you doing?!";
  String  myImage4 =  "assets/calender4.jpg";

  getDate() {
    final timeStamp = new DateTime.now().millisecondsSinceEpoch.toString();
    return timeStamp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('CALENDER'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(child: template.textBox(null, getDate(), null, "Todays date", null, null)),
          new Container(
            //Put in functions from the template below!!!
              child: template.textBoxWithPic(null, myImage4, myHeader , null, myText, null, 150)
          ),
          new Container(
            child: template.textBoxWith3Pics(null, myImage3, myImage2, myImage1, myHeader , null, myText, null, 100),
          ),
          new Container(
          child: template.otherPermissionBox(null, null, widget.whoHasCalendar),
          ),
        ],
      ),
    );
  }
}