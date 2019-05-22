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

  String myHeader = "The Calendar Permission";
  String myText = "When you allow an app to read and write in your calendar you may give away lots of personal data. It is common to save personal data like phone numbers and adresses in the calendar which whould easily be accesiable for the app. If you are an active user of your calendar it would also allow for a hostile app to track your behaviour in a highly unpleasant way.";
  String  myImage1 =  "assets/calender1.jpg";
  String  myImage2 =  "assets/calender2.jpg";
  String  myImage3 =  "assets/calender3.jpeg";

  String myHeader2 = "FUN FACT";
  String myText2 = "hey girl, what you doing?!";
  String  myImage4 =  "assets/calender4.jpg";

  getDate() {
    //final String timeStamp = new DateTime.now().year.toString() + "-" + DateTime.now().month.toString() + "-" + DateTime.now().day.toString();
    String timeStamp = DateTime.now().weekday.toString();
    if (timeStamp == 1.toString()){
      timeStamp = 'Monday';
    }
    else if (timeStamp == 2.toString()){
      timeStamp = 'Tuesday';
    }
    else if (timeStamp == 3.toString()){
      timeStamp = 'Wednesday';
    }
    else if (timeStamp == 4.toString()){
      timeStamp = 'Thursday';
    }
    else if (timeStamp == 5.toString()){
      timeStamp = 'Friday';
    }
    else if (timeStamp == 6.toString()){
      timeStamp = 'Saturday';
    }
    else if (timeStamp == 7.toString()){
      timeStamp = 'Sunday';
    }
    return timeStamp;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('CALENDAR'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(child: template.textBox(null, 'Have you scheduled security?', 22, "Today it is " + getDate() + ", a perfect day to start securing your data!", 20, null)),
          new Container(
            //Put in functions from the template below!!!
              child: template.textBoxWithPic(null, myImage4, myHeader , null, myText, null, 150)
          ),
          /*new Container(
            child: template.textBoxWith3Pics(null, myImage3, myImage2, myImage1, myHeader , null, myText, null, 100),
          ),*/
          new Container(
          child: template.otherPermissionBox(null, null, widget.whoHasCalendar),
          ),
        ],
      ),
    );
  }
}