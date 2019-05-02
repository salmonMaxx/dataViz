import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image = new DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/pic/logo_dataviz_1'),
        ),
      ),
    );
    Widget bigCircle = new Container(
      width: 310.0,
      height: 310.0,
      decoration: new BoxDecoration(
          color: Colors.indigo[700],
          shape: BoxShape.circle,
          border: new Border.all(color: Colors.indigo[300], width: 20.0)
      ),
    );

    return new Material(
      color: Colors.indigo[900],
      child: new Center(
        child: new Stack(
          children: <Widget>[
            bigCircle,
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("Cool"), iconData: Icons.camera_alt),
              top: 0.0,
              left: 130.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("1"), iconData: Icons.calendar_today),
              top: 17.42,
              left: 65.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("2"), iconData: Icons.phone_forwarded),
              top: 17.42,
              left: 195.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("3"), iconData: Icons.email),
              top: 65.0,
              left: 242.58,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("4"), iconData: Icons.contacts),
              top: 65.0,
              left: 17.42,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("5"), iconData: Icons.personal_video),
              top: 130.0,
              left: 260.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("6"), iconData: Icons.directions_bike),
              top: 130.0,
              left: 0.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("7"), iconData: Icons.group_add),
              top: 195.0,
              left: 242.58,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("8"), iconData: Icons.insert_emoticon),
              top: 195.0,
              left: 17.42,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("9"), iconData: Icons.keyboard_voice),
              top: 242.58,
              left: 65.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("10"), iconData: Icons.local_florist),
              top: 242.58,
              left: 195.0,
            ),
            new Positioned(
              child: new CircleButton(
                  onTap: () => print("11"), iconData: Icons.location_on),
              top: 260.0,
              left: 130.0,
            ),
            new Positioned(
              child: image,
              top: 130,
              left: 130,
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