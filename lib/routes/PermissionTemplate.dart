import 'package:flutter/material.dart';

class PermissionTemplate extends StatefulWidget {
  @override
  _PermissionTemplateState createState() => _PermissionTemplateState();
}

boxRight(String myImage, String myHeader, String myText) {
  return new Container(
    height: 150,
    decoration: BoxDecoration(
        color: Colors.indigo[900],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.indigo[300],
            offset: Offset(1.0, 1.0),
            blurRadius: 10.0,
          ),
        ],
        borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
    margin: EdgeInsets.all(10),
    child: Row(
      children: <Widget>[
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 130,
            height: 130,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.indigo[500], width: 2),
              image: new DecorationImage(
                image: new AssetImage(myImage),
                alignment: Alignment.center,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Flexible(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(left: 5, top: 7.5),
                child: new Text(
                  myHeader,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 5),
                child: new Text(
                  myText,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

boxLeft(String myImage, String myHeader, String myText) {
  return new Container(
    height: 150,
    decoration: BoxDecoration(
        color: Colors.indigo[900],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.indigo[300],
            offset: Offset(1.0, 1.0),
            blurRadius: 10.0,
          ),
        ],
        borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
    margin: EdgeInsets.all(10),
    child: Row(
      children: <Widget>[
        Flexible(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(left: 10, top: 7.5),
                child: new Text(
                  myHeader,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              new Container(
                margin: const EdgeInsets.only(left: 10),
                child: new Text(
                  myText,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        Flexible(
          child: new Container(
            padding: EdgeInsets.all(0),
            width: 130,
            height: 130,
            alignment: Alignment.centerRight,
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.indigo[500], width: 2),
              image: new DecorationImage(
                image: new AssetImage(myImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

boxLeft1(String myImage, String myHeader, String myText) {
  return new Container(
    height: 150,
    decoration: BoxDecoration(color: Colors.indigo[100]),
    margin: EdgeInsets.all(10),
    child: Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(myHeader,
                style: TextStyle(color: Colors.indigo[900], fontSize: 25)),
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(0),
            margin:
                EdgeInsets.only(left: 50.0, top: 7.5, bottom: 7.5, right: 10.0),
            decoration: new BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.indigo[900], width: 2),
              image: new DecorationImage(
                image: new AssetImage(myImage),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

//INFORMATION BOX
// Boxes with pictures are bigger and better for longer information,
//Parameters are first the pic then your header + text:)))
// MyHeightPic is also flex, standard is 150 but it depends
// if more than one pic is used, the width of every pic can be inserted, the tot width should be 370


textBoxWithPic(String myImage, String myHeader, String myText, double myHeightPic) {
  return new Container(
    decoration: BoxDecoration(
        color: Colors.indigo[900],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.indigo[300],
            offset: Offset(1.0, 1.0),
            blurRadius: 10.0,
          ),
        ],
        borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              height: myHeightPic,
              width: 370,
              margin: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.indigo[500], width: 2),
                borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                image: new DecorationImage(
                  image: new AssetImage(myImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: new Text(
                myHeader,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: new Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
              child: new Text(
                myText,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ),
          ],
        ),
      ],
    ),
  );
}

textBoxWith2Pics(String myImage1, String myImage2, String myHeader, String myText, double myHeightPic) {
  return new Container(
    decoration: BoxDecoration(
        color: Colors.indigo[900],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.indigo[300],
            offset: Offset(1.0, 1.0),
            blurRadius: 10.0,
          ),
        ],
        borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
            child: new Container(
              height: myHeightPic,
              width: 185,
              margin: EdgeInsets.only(top: 10, bottom:10, left:10, right: 5),
              decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.indigo[500], width: 2),
                borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                image: new DecorationImage(
                  image: new AssetImage(myImage1),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ),
            Flexible(
              child: new Container(
                height: myHeightPic,
                width: 185,
                margin: EdgeInsets.only(top: 10, bottom:10, left:5, right: 10),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.indigo[500], width: 2),
                  borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                  image: new DecorationImage(
                    image: new AssetImage(myImage2),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: new Text(
                myHeader,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: new Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10.0),
                child: new Text(
                  myText,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

textBoxWith3Pics(String myImage1, String myImage2, String myImage3, String myHeader, String myText,
     double myHeightPic) {
  return new Container(
    decoration: BoxDecoration(
        color: Colors.indigo[900],
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.indigo[300],
            offset: Offset(1.0, 1.0),
            blurRadius: 10.0,
          ),
        ],
        borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
    margin: EdgeInsets.all(10),
    child: Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: new Container(
                height: myHeightPic,
                width: 150,
                margin: EdgeInsets.only(top: 10, bottom:10, left:10, right: 5),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.indigo[500], width: 2),
                  borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                  image: new DecorationImage(
                    image: new AssetImage(myImage1),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              child: new Container(
                height: myHeightPic,
                width: 150,
                margin: EdgeInsets.only(top: 10, bottom:10, left:5, right: 5),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.indigo[500], width: 2),
                  borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                  image: new DecorationImage(
                    image: new AssetImage(myImage2),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Flexible(
              child: new Container(
                height: myHeightPic,
                width: 150,
                margin: EdgeInsets.only(top: 10, bottom:10, left:5, right: 10),
                decoration: new BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(color: Colors.indigo[500], width: 2),
                  borderRadius: new BorderRadius.all(const Radius.circular(30.0)),
                  image: new DecorationImage(
                    image: new AssetImage(myImage3),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: new Text(
                myHeader,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
              child: new Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                child: new Text(
                  myText,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}



class _PermissionTemplateState extends State<PermissionTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Permissions <3',
            textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,
      ),
      body: new ListView(
    children: <Widget>[
      new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: textBoxWithPic(
                  'assets/test1.jpg',
                  "YOUR DATA",
                  "How much data do u u u u u u u u send out every day?",150.0),
            ),
            new Container(
              child: textBoxWith2Pics(
                  'assets/test1.jpg', 'assets/test1.jpg',
                  "YOUR DATA",
                  "How much data do u u u u u u u u send out every day? ",150.0),
            ),
            new Container(
              child: textBoxWith3Pics(
                  'assets/test1.jpg', 'assets/test1.jpg', 'assets/test1.jpg',
                  "YOUR DATA",
                  "How much data do u u u u u u u u send out every day?", 150.0),
            ),
          ]),
    ],
      ),
    );
  }
}
