import 'package:flutter/material.dart';
import './BlackList.dart';
import './permissions/Contacts.dart';
import './permissions/Location.dart';
import './permissions/Mic.dart';
import './permissions/Sms.dart';
import './permissions/VideoPics.dart';

Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Discover all Permissions!',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.indigo[900], fontSize: 25)),
        content: Text(
            'Go through the icons in the menu to see the importance of different permissions and how your apps uses them.',
            style: TextStyle(color: Colors.indigo[900], fontSize: 20)),
        actions: <Widget>[
          FlatButton(
            child: Text('OK!',
                textAlign: TextAlign.center,
                style: new TextStyle(color: Colors.indigo[900], fontSize: 25)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class MenuPage extends StatefulWidget {
  MenuPage({Key key, this.appInfo}) : super(key: key);
  Map<String, List<String>> appInfo;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    Widget image = new DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logo_dataviz_1.png'),
        ),
      ),
    );
    Widget bigCircle = new Container(
      width: 310.0,
      height: 310.0,
      decoration: new BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: new Border.all(color: Colors.indigo[300], width: 20.0)),
    );

    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.info),
            tooltip: 'INFO',
            onPressed: () {
              _ackAlert(context);
            },
          ),
        ],
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text('dataViz',
            textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
      ),
      body: Center(
        child: new Stack(
          children: <Widget>[
            bigCircle,
            new Positioned(
              //LIGHT
              child: new Center(
                child: Container(
                  width: 600,
                  height: 600,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/light.png'),
                    ),
                  ),
                ),
              ),
              top: -150.0,
              left: -150.0,
            ),
            new Positioned(
              child: new Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      //image: AssetImage('assets/mabu-lightbulb.png'), //HAVE TO CHANGE PIC
                      image: AssetImage('assets/lamp1.png'),
                    ),
                  ),
                ),
              ),
              top: 80.0,
              left: 80.0,
            ),
            //Permission menu
            new Positioned(
              child: new CircleButton(
                  onTap: () {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new BlackList(widget.appInfo["installedLabels"]));
                    Navigator.of(context).push(route);
                  },
                  iconData: Icons.list),
              top: 0.0,
              left: 130.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new Contacts(widget.appInfo["contacts"]));
                    Navigator.of(context).push(route);
                  },
                  iconData: Icons.calendar_today),
              top: 17.42,
              left: 65.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('phone'),
                  iconData: Icons.phone_forwarded),
              top: 17.42,
              left: 195.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('sms'),
                  iconData: Icons.email),
              top: 65.0,
              left: 242.58,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('contacts'),
                  iconData: Icons.contacts),
              top: 65.0,
              left: 17.42,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new VideoPics(widget.appInfo["videoPics"]));
                    Navigator.of(context).push(route);
                  },
                  iconData: Icons.personal_video),
              top: 130.0,
              left: 260.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('activity_log'),
                  iconData: Icons.directions_bike),
              top: 130.0,
              left: 0.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('call_log'),
                  iconData: Icons.group_add),
              top: 195.0,
              left: 242.58,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('audio_files'),
                  iconData: Icons.insert_emoticon),
              top: 195.0,
              left: 17.42,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new Mic(widget.appInfo["microphone"]));
                    Navigator.of(context).push(route);
                  },
                  iconData: Icons.keyboard_voice),
              top: 242.58,
              left: 65.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => Navigator.of(context).pushNamed('sensors'),
                  iconData: Icons.local_florist),
              top: 242.58,
              left: 195.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                        new Location(widget.appInfo["location"]));
                    Navigator.of(context).push(route);
                  },
                  iconData: Icons.location_on),
              top: 260.0,
              left: 130.0,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('dataViz',
                  textAlign: TextAlign.center,
                  style: new TextStyle(fontSize: 50.0, color: Colors.white)),
              decoration: BoxDecoration(
                color: Colors.indigo[900],
              ),
            ),
            ListTile(
              title: Text('BIG PICTURE',
                  style:
                      new TextStyle(fontSize: 30.0, color: Colors.indigo[900])),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('big_picture');
              },
            ),
            ListTile(
              title: Text('BLACKLIST',
                  style:
                      new TextStyle(fontSize: 30.0, color: Colors.indigo[900])),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('blacklist');
              },
            ),
            ListTile(
              title: Text('SETTINGS',
                  style:
                      new TextStyle(fontSize: 30.0, color: Colors.indigo[900])),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('settings');
              },
            ),
            ListTile(
              title: Text('ABOUT US',
                  style:
                      new TextStyle(fontSize: 30.0, color: Colors.indigo[900])),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('about_us');
              },
            ),
            ListTile(
              title: Text('FEEDBACK',
                  style:
                      new TextStyle(fontSize: 30.0, color: Colors.indigo[900])),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('feedback');
              },
            ),
            ListTile(title: Text('')),
            ListTile(
              title: Text('FORGET ME!',
                  style: new TextStyle(
                    fontSize: 30.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('forgetMe');
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
