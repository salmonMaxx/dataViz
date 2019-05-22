import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import '../PermissionTemplate.dart';

class Sms extends StatefulWidget {
  Sms(this.whoHasSMS);
  final List<String> whoHasSMS;

  @override
  _SmsState createState() => _SmsState();
}

var template = new PermissionTemplate();
//var smsInfo = new TextEditingController();
String smsInfo =
    'Find out who you have contacted the most and what you have talked about by clicking the button';
String favouriteDateString = 'Press the message icon to see this feature';
List smsList = new List.filled(1, favouriteDateString, growable: true);
final smsController = TextEditingController();

class _SmsState extends State<Sms> {
  // BOX 1
  String myImage = "assets/sensors1.jpg";
  String myHeader = "Big Brother reads you..?";
  String myText = "\nBy allowing the SMS permission an app can read text messages stored on your device and SIM card. Before 2019, all apps with this permission were also allowed to send text messages but Google updated it to only allow your device’s default app to send SMS. However, if you have sent any private or confidential information through SMS we advise you to really think an extra time before allowing an app to read your SMS.";


  Future<void> _querySMS() async {
    SmsQuery query = new SmsQuery();
    List<SmsMessage> threads = await query.getAllSms;

    //Calculates which contact you have talked the most to
    threads.sort((a, b) => a.address.compareTo(b.address));
    String favouriteContact;
    int counter = 0;
    int maxSMS = 0;
    for (var i = 0; i < threads.length - 1; i++) {
      if (threads[i].address == threads[i + 1].address) {
        counter++;
        if (counter > maxSMS) {
          maxSMS = counter;
          favouriteContact = threads[i].address;
        }
      } else {
        counter = 0;
      }
    }
    setState(() {
      smsInfo = ('The contact you have been texting the most with is ' +
          favouriteContact +
          ' with ' +
          maxSMS.toString() +
          ' sms saved on your phone!');
    });

    //Calculates which day you and your favourite contact talked the most
    counter = 0;
    int dayMaxSMS = 0;
    DateTime favouriteDate;
    threads.retainWhere((test) => test.address == favouriteContact);
    threads.sort((a, b) => a.dateSent.compareTo(b.dateSent));
    for (var i = 0; i < maxSMS - 1; i++) {
      if (threads[i].dateSent.year == threads[i + 1].dateSent.year &&
          threads[i].dateSent.month == threads[i + 1].dateSent.month &&
          threads[i].dateSent.day == threads[i + 1].dateSent.day) {
        counter++;
        if (counter > dayMaxSMS) {
          dayMaxSMS = counter;
          favouriteDate = threads[i].dateSent;
        }
      } else {
        counter = 0;
      }
    }
    setState(() {
      favouriteDateString = 'These messages with your favourite are from ' + favouriteDate.year.toString() + '-' + favouriteDate.month.toString() + '-' + favouriteDate.day.toString() + ':\n';
      smsList[0] = favouriteDateString;
    });

    //Add day with favourite SMS to list
    threads.retainWhere((test) =>
    test.dateSent.year == favouriteDate.year &&
        test.dateSent.month == favouriteDate.month &&
        test.dateSent.day == favouriteDate.day);
    if(smsList.length==1) {
      for (var i = 0; i < dayMaxSMS - 1; i++) {
        smsList.add(threads[i].body);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('SMS'),
      ),
      body: ListView(children: <Widget>[
        new Container(
          //Put in functions from the template below!!!
          child: template.textBoxWithPic(null, myImage, myHeader, null, myText, null, null),
        ),
        new Container(
            child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: IconButton(
                  icon: Icon(Icons.sms),
                  iconSize: 80,
                  onPressed: () {
                    _querySMS();
                  }),
            ),
          ],
        )),
        new Container(
            child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: template.textBox(
                    null, 'Favourite contact', null, smsInfo, null, null)),
          ],
        )),
        new Container(
            child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: template.textBoxInteract(
                    null,
                    'Do you remember this intense conversation?',
                    18,
                    smsList.toString(),
                    15,
                    null))
          ],
        )),
      ]),
    );
  }
}
