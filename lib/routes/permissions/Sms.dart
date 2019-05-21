import 'package:flutter/material.dart';
import 'package:sms/sms.dart';
import '../PermissionTemplate.dart';
import 'package:async/async.dart';
import 'package:sms/contact.dart';

class SMS extends StatefulWidget {
  SMS({Key key, this.whoHasSMS}) : super(key: key);
  final Map<String, dynamic> whoHasSMS;

  @override
  _SMSState createState() => _SMSState();
}

var template = new PermissionTemplate();
//var smsInfo = new TextEditingController();
String smsInfo = 'Find out who you have contacted the most and what you have talked about by clicking the button';

_querySMS() async {
  SmsQuery query = new SmsQuery();
  List<SmsMessage> threads = await query.getAllSms;

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
  smsInfo=('The contact you have been texting the most with is ' +
      favouriteContact +
      ' with ' +
      maxSMS.toString() +
      ' sms saved on your phone!');
  counter = 0;
  int dayMaxSMS = 0;
  String favouriteDate;
  threads.retainWhere((test) => test.address == favouriteContact);
  threads.sort((a, b) => a.address.compareTo(b.address));
  for (var i = 0; i<maxSMS-1; i++){
    if(threads[i].dateSent.year == threads[i+1].dateSent.year && threads[i].dateSent.month ==
    threads[i+1].dateSent.month && threads[i].dateSent.day == threads[i+1].dateSent.day){
      counter ++;
      print(threads[i].body);
      print(threads[i].dateSent);
      if(counter > dayMaxSMS){
        dayMaxSMS = counter;
        favouriteDate = threads[i].dateSent.toString();
      }
      else{
        counter = 0;
      }
    }
  }
  print (dayMaxSMS);
  print(favouriteDate);

  /*for (var i = 0; i < threads.length; i++) {
    print(threads[i].body);
  }
  print(threads);*/

  //var list = await query.querySms({1, 0, _address, 1, SmsMessage, true});
  /*await query.querySms({
    address: getContactAddress()
  });*/
  //print(messages[1].toString());

  //await query.querySms({adress: 'PostNord'});
}

class _SMSState extends State<SMS> {
  // BOX 1
  String myImage = "assets/sensors1.jpg";
  String myHeader = "SMS";
  String myText = "Secrets, nonono!";
  String leftText = 'Test';

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
          child: template.boxRight(null, myImage, myHeader, myText),
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
        )

            //TAKE AWAY COMMENTS
            //new Container(
            //child: template.otherPermissionBox(null, null, widget.whoHasPhone['whoHasPhone']),
            // ),
            ),
        new Container(

          child: new Row(crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
            Expanded(

              child: template.textBox(null, 'Favourite contact', null, smsInfo, null, null)
            )
          ],)
        )
      ]),
    );
  }
}
