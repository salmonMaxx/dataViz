import 'package:flutter/material.dart';

//routes --> Permissions
import './permissions/activity_log.dart';
import './permissions/audio_files.dart';
import './permissions/calender.dart';
import './permissions/call_log.dart';
import './permissions/camera.dart';
import './permissions/contacts.dart';
import './permissions/location.dart';
import './permissions/mic.dart';
import './permissions/phone.dart';
import './permissions/sensors.dart';
import './permissions/sms.dart';
import './permissions/video_pics.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    Widget bigCircle = new Container(
      width: 310.0,
      height: 310.0,
      decoration: new BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: new Border.all(color: Colors.indigo[300], width: 20.0)
      ),
    );
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('dataViz', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
      ),
      body: Center(
        child: new Stack(
          children: <Widget>[
            bigCircle,
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('camera'), iconData: Icons.camera_alt),
              top: 0.0,
              left: 130.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('calender'), iconData: Icons.calendar_today),
              top: 17.42,
              left: 65.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('phone'), iconData: Icons.phone_forwarded),
              top: 17.42,
              left: 195.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('sms'), iconData: Icons.email),
              top: 65.0,
              left: 242.58,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('contacts'), iconData: Icons.contacts),
              top: 65.0,
              left: 17.42,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('video_pics'), iconData: Icons.personal_video),
              top: 130.0,
              left: 260.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('activity_log'), iconData: Icons.directions_bike),
              top: 130.0,
              left: 0.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('call_log'), iconData: Icons.group_add),
              top: 195.0,
              left: 242.58,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('audio_files'), iconData: Icons.insert_emoticon),
              top: 195.0,
              left: 17.42,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('mic'), iconData: Icons.keyboard_voice),
              top: 242.58,
              left: 65.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('sensors'), iconData: Icons.local_florist),
              top: 242.58,
              left: 195.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('location'), iconData: Icons.location_on),
              top: 260.0,
              left: 130.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("12"), iconData: Icons.lightbulb_outline),
              top: 130.0,
              left: 130.0,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('dataViz', textAlign: TextAlign.center, style: new TextStyle(fontSize: 50.0, color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
            ),
            ListTile(
              title: Text('BLACKLIST', style: new TextStyle(fontSize: 30.0, color: Colors.indigo[900])),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('BIG PICTURE',style: new TextStyle(fontSize: 30.0, color: Colors.indigo[900])),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 50.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          color: Colors.black,
        ),
      ),
    );
  }
}

