import 'package:flutter/material.dart';
import '../PermissionTemplate.dart';

class ForgetMe1 extends StatefulWidget {
  @override
  _ForgetMe1State createState() => _ForgetMe1State();
}

class _ForgetMe1State extends State<ForgetMe1> {
  //assets
  String forgetpic = 'assets/forgetmepic.jpg';

  PermissionTemplateChild template = new PermissionTemplateChild();

  deleteFromDB() {
    print('Now you are forgotten');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('dataViz',
            textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.indigo[900],
      ),
      body: new ListView(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              template.textWithPic(
                  context,
                  forgetpic,
                  "FANTASTIC!", 60,
                  'We really encourage our users to delete their accounts to protect their data.'
                  '\nRemember that you have the right to delete your data on other apps and plattforms as well. '
                  '\n\nTake back controll of your data! ', null,
                  150, Colors.indigo[900]),
              new Center(
                child: new OutlineButton(
                  padding: EdgeInsets.all(20.0),
                  borderSide: const BorderSide (style: BorderStyle.none),
                  onPressed: () {
                    template.popUp(context,
                        'You will now be forgotten!',
                        "When pressing OK! you will be signed out and not a part of our database any more.",
                        'OK!',
                    Colors.greenAccent, "login", deleteFromDB
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: new BorderRadius.all(const Radius.circular(10.0))),
                      child:
                      Text("FORGET ME NOW!",
                          style: new TextStyle(fontSize: 30.0))
                    ),
    ),
    ),
    ],
          ),
        ],
      ),
    );
  }
}

class PermissionTemplateChild extends PermissionTemplate {
  PermissionTemplateChild();
}
