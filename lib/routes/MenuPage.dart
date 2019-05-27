import 'package:flutter/material.dart';
import './BlackList.dart';
import './permissions/Contacts.dart';
import './permissions/Location.dart';
import './permissions/Mic.dart';
import './permissions/VideoPics.dart';
import './permissions/Sms.dart';
import './MenuForOtherPerm.dart';

import 'package:photo_manager/photo_manager.dart';

Future<void> _ackAlert(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content:
        new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Flexible(
              child: Text('Discover all Permissions!\n',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.indigo[900], fontSize: 25, fontWeight: FontWeight.bold)),),

            new Flexible(
              child:
              Text(
                  'Go through the icons in the menu to see the importance of different permissions and how your apps uses them.\n',
                  style: TextStyle(color: Colors.indigo[900], fontSize: 20)),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new CircleButton(iconData: Icons.email),
                new Text ("SMS", textAlign: TextAlign.start, style: TextStyle(color: Colors.indigo[900], fontSize: 20)),
              ],),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new CircleButton(iconData: Icons.contacts),
                new Text ("CONTACTS", textAlign: TextAlign.start, style: TextStyle(color: Colors.indigo[900], fontSize: 20)),
              ],),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new CircleButton(iconData: Icons.camera_roll),
                new Text ("VIDEO & IMAGES", textAlign: TextAlign.start, style: TextStyle(color: Colors.indigo[900], fontSize: 20)),
              ],),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new CircleButton(iconData: Icons.mic),
                new Text ("MIC", textAlign: TextAlign.start, style: TextStyle(color: Colors.indigo[900], fontSize: 20)),
              ],),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new CircleButton(iconData: Icons.location_on),
                new Text ("LOCATION",textAlign: TextAlign.start, style: TextStyle(color: Colors.indigo[900], fontSize: 20)),
              ],),
            new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new CircleButton(iconData: Icons.apps),
                new Text ("OTHER PERMISSIONS", textAlign: TextAlign.start, style: TextStyle(color: Colors.indigo[900], fontSize: 20)),
              ],),],),
        actions: <Widget>[

          FlatButton(
            child: Text('OK!',
                textAlign: TextAlign.center,
                style: new TextStyle(color: Colors.indigo[900], fontSize: 25)),
            onPressed: () {
              Navigator.of(context).pop();
            },),

          ],
      );
    },
  );
}

class MenuPage extends StatefulWidget {
  MenuPage(this.appInfo);
  final Map<String, List<String>> appInfo;

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void getImages() async {
    var result = await PhotoManager.requestPermission();
    if (!(result == true)) {
      print("You have to grant album privileges");
      return;
    }
  }

  Widget build(BuildContext context) {
    Widget bigCircle = new Container(
      width: 310.0,
      height: 310.0,
      decoration: new BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: new Border.all(color: Colors.indigo[300], width: 20.0)),
    );

    void _openSetting() {
      PhotoManager.openSetting();
    }

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
              child: new Column(
                children: <Widget>[
                  new GestureDetector(
                    onTap: () {_ackAlert(context);},
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/lamp1.png'),
                        ),
                      ),
                    ),
                  ),
                ],
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
                            new Sms(widget.appInfo["sms"], true));
                    Navigator.of(context).push(route);
                  },
                  iconData: Icons.email),
              top: 0.0,
              left: 130.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new VideoPics(widget.appInfo["videoPics"]));
                    Navigator.of(context).push(route);
                    getImages();
                  },
                  iconData: Icons.camera_roll),
              left: 17.42,
              top: 195,
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
              left: 17.42,
              top: 65.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new Contacts(widget.appInfo["contacts"]));
                    Navigator.of(context).push(route);
                  },
                  iconData: Icons.contacts),
              left: 242.58,
              top: 65,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new Mic(widget.appInfo["microphone"]));
                    Navigator.of(context).push(route);
                  },
                  iconData: Icons.mic),
              left: 242.58,
              top: 195,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () {
                    var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new MenuForOtherPerm(widget.appInfo));
                    Navigator.of(context).push(route);
                  },
                  iconData: Icons.apps),
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
                var route = new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new BlackList(widget.appInfo["installedLabels"]));
                Navigator.of(context).push(route);
              },
            ),
            ListTile(
              title: Text('MANAGE PERMISSIONS',
                  style:
                      new TextStyle(fontSize: 30.0, color: Colors.indigo[900])),
              onTap: () {
                _openSetting();
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
