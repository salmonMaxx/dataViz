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

_querySMS() async {
  SmsQuery query = new SmsQuery();
  List<SmsMessage> threads = await query.getAllSms;

  threads.sort((a, b) => a.address.compareTo(b.address));
  String favouriteContact;
  int counter = 0;
  int maxCounter = 0;
  for (var i = 0; i < threads.length - 1; i++) {
    if (threads[i].address == threads[i + 1].address) {
      counter++;
      if (counter > maxCounter) {
        maxCounter = counter;
        favouriteContact = threads[i].address;
      }
    } else {
      counter = 0;
    }
  }
  print('Favourite: ' +
      favouriteContact +
      ' with ' +
      maxCounter.toString() +
      ' sms');
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
      ]),
    );
  }
}
