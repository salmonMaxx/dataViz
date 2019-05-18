import 'package:flutter/material.dart';

class PermissionTemplate extends StatefulWidget {
  @override
  _PermissionTemplateState createState() => _PermissionTemplateState();

  boxRight(
      Decoration myBoxDeco, String myImage, String myHeader, String myText) {
    Radius borderRadius = const Radius.circular(10.0);
    if (myBoxDeco == null) {
      myBoxDeco = BoxDecoration(
          gradient: colorGradient(Alignment.topRight, Alignment.bottomLeft),
          borderRadius: new BorderRadius.all(borderRadius));
    }
    return new Container(
      height: 150,
      decoration: myBoxDeco,
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
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
                  child: myHeader.isNotEmpty ? new Text(
                    myHeader,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ) : null,
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

  boxLeft(
      Decoration myBoxDeco, String myImage, String myHeader, String myText) {
    Radius borderRadius = const Radius.circular(10.0);
    if (myBoxDeco == null) {
      myBoxDeco = BoxDecoration(
          gradient: colorGradient(Alignment.topRight, Alignment.bottomLeft),
          borderRadius: new BorderRadius.all(borderRadius));
    }
    return new Container(
      height: 150,
      decoration: myBoxDeco,
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        children: <Widget>[
          Flexible(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  margin: const EdgeInsets.only(left: 10, top: 7.5),
                  child: myHeader.isNotEmpty ? new Text(
                    myHeader,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ) : null,
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
              child: myHeader.isNotEmpty ? Text(myHeader,
                  style: TextStyle(color: Colors.indigo[900], fontSize: 25)) : null,
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(0),
              margin: EdgeInsets.only(
                  left: 50.0, top: 7.5, bottom: 7.5, right: 10.0),
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

  textWithPic(
      String myImage,
      String myHeader,
      double myHeaderSize,
      String myText,
      double myTextSize,
      double myHeightPic,
      Color myBorderColor) {
    Radius borderRadius = const Radius.circular(5.0);
    Color myTextColor = Colors.indigo[900];
    if (myHeightPic == null) {
      myHeightPic = 150;
    }
    if (myBorderColor == null) {
      myBorderColor = Colors.transparent;
    }
    if (myHeaderSize == null) {
      myHeaderSize = 25;
    }
    if (myTextSize == null) {
      myTextSize = 20;
    }
    return new Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
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
                  borderRadius: new BorderRadius.all(borderRadius),
                  border: new Border.all(color: myBorderColor, width: 3),
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
                      color: myTextColor,
                      fontSize: myHeaderSize,
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
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: new Text(
                    myText,
                    style: TextStyle(
                        color: myTextColor,
                        fontSize: myTextSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //INFORMATION BOX
  // myBoxDeco --> put in null if you like it
  // --> put in following and change the directions or more.
  /*BoxDecoration(
  gradient: colorGradient(Alignment.topRight, Alignment.bottomLeft),
  borderRadius: new BorderRadius.all(borderRadius));*/

  textBox(Decoration myBoxDeco, String myHeader, double myHeaderSize,
      String myText, double myTextSize, EdgeInsets myMargin) {
    Radius borderRadius = const Radius.circular(5.0);
    Color myTextColor = Colors.white;
    if (myHeaderSize == null) {
      myHeaderSize = 25;
    }
    if (myTextSize == null) {
      myTextSize = 20;
    }
    if (myBoxDeco == null) {
      myBoxDeco = BoxDecoration(
          gradient: colorGradient(Alignment.topRight, Alignment.bottomLeft),
          borderRadius: new BorderRadius.all(borderRadius));
    }
    if (myMargin == null) {
      myMargin = EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5);
    }
    return new Container(
      decoration: myBoxDeco,
      margin: myMargin,
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: myHeader.isNotEmpty ? new Text(
                  myHeader,
                  style: TextStyle(
                      color: myTextColor,
                      fontSize: myHeaderSize,
                      fontWeight: FontWeight.bold),
                ) : null,
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: new Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: new Text(
                    myText,
                    style: TextStyle(color: myTextColor, fontSize: myTextSize),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  textBoxWithPic(
      Decoration myBoxDeco,
      String myImage,
      String myHeader,
      double myHeaderSize,
      String myText,
      double myTextSize,
      double myHeightPic) {
    Radius borderRadius = const Radius.circular(5.0);
    Color myTextColor = Colors.white;
    if (myHeightPic == null) {
      myHeightPic = 150;
    }
    if (myHeaderSize == null) {
      myHeaderSize = 25;
    }
    if (myTextSize == null) {
      myTextSize = 20;
    }
    if (myBoxDeco == null) {
      myBoxDeco = BoxDecoration(
          gradient: colorGradient(Alignment.topRight, Alignment.bottomLeft),
          borderRadius: new BorderRadius.all(borderRadius));
    }
    return new Container(
      decoration: myBoxDeco,
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
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
                  borderRadius: new BorderRadius.all(borderRadius),
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
              Flexible(
                child: new Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: myHeader.isNotEmpty ? new Text(
                    myHeader,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: myTextColor,
                        fontSize: myHeaderSize,
                        fontWeight: FontWeight.bold),
                  ) : null,
                ),
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: new Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: new Text(
                    myText,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: myTextColor,
                        fontSize: myTextSize,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  textBoxWith2Pics(
      Decoration myBoxDeco,
      String myImage1,
      String myImage2,
      String myHeader,
      double myHeaderSize,
      String myText,
      double myTextSize,
      double myHeightPic) {
    Radius borderRadius = const Radius.circular(10.0);
    if (myHeightPic == null) {
      myHeightPic = 150;
    }
    if (myHeaderSize == null) {
      myHeaderSize = 25;
    }
    if (myTextSize == null) {
      myTextSize = 20;
    }
    if (myBoxDeco == null) {
      myBoxDeco = BoxDecoration(
          gradient: colorGradient(Alignment.topRight, Alignment.bottomLeft),
          borderRadius: new BorderRadius.all(borderRadius));
    }
    return new Container(
      decoration: myBoxDeco,
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: new Container(
                  height: myHeightPic,
                  width: 185,
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(borderRadius),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(borderRadius),
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
                child: myHeader.isNotEmpty ? new Text(
                  myHeader,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: myHeaderSize,
                      fontWeight: FontWeight.bold),
                ) : null,
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: new Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10.0),
                  child: new Text(
                    myText,
                    style: TextStyle(color: Colors.white, fontSize: myTextSize),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  textBoxWith3Pics(
      Decoration myBoxDeco,
      String myImage1,
      String myImage2,
      String myImage3,
      String myHeader,
      double myHeaderSize,
      String myText,
      double myTextSize,
      double myHeightPic) {
    Radius borderRadius = const Radius.circular(10.0);
    if (myHeightPic == null) {
      myHeightPic = 150;
    }
    if (myHeaderSize == null) {
      myHeaderSize = 25;
    }
    if (myTextSize == null) {
      myTextSize = 20;
    }
    if (myBoxDeco == null) {
      myBoxDeco = BoxDecoration(
          gradient: colorGradient(Alignment.topRight, Alignment.bottomLeft),
          borderRadius: new BorderRadius.all(borderRadius));
    }
    return new Container(
      decoration: myBoxDeco,
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: new Container(
                  height: myHeightPic,
                  width: 150,
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(borderRadius),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(borderRadius),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(borderRadius),
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
                child: myHeader.isNotEmpty ? new Text(
                  myHeader,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ) : null,
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: new Container(
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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

  highlightNumbers(String bigText1, String smallText1, String bigText2,
      String smallText2, String bigText3, String smallText3) {
    Radius borderRadius = const Radius.circular(10.0);
    double myHeight = 100;
    return new Container(
      decoration:
          BoxDecoration(borderRadius: new BorderRadius.all(borderRadius)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: myHeight,
                  margin: EdgeInsets.only(right: 2.5),
                  decoration: BoxDecoration(
                      color: Colors.indigo[400],
                      borderRadius: new BorderRadius.all(borderRadius)),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            child: new Text(
                              bigText1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: new Text(
                                smallText1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: myHeight,
                  margin: EdgeInsets.only(left: 2.5, right: 2.5),
                  decoration: BoxDecoration(
                      color: Colors.indigo[600],
                      borderRadius: new BorderRadius.all(borderRadius)),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            child: new Text(
                              bigText2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: new Text(
                                smallText2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: myHeight,
                  margin: EdgeInsets.only(left: 2.5),
                  decoration: BoxDecoration(
                      color: Colors.indigo[900],
                      borderRadius: new BorderRadius.all(borderRadius)),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            child: new Text(
                              bigText3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: new Text(
                                smallText3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  colorGradient(Alignment myStart, Alignment myEnd) {
    return LinearGradient(
      // Where the linear gradient begins and ends
      begin: myStart,
      end: myEnd,
      // Add one stop for each color. Stops should increase from 0 to 1
      stops: [0.1, 0.5, 0.7, 0.9],
      colors: [
        // Colors are easy thanks to Flutter's Colors class.
        Colors.indigo[900],
        Colors.indigo[700],
        Colors.indigo[600],
        Colors.indigo[400],
      ],
    );
  }

  Future<void> popUp(
      BuildContext context,
      String myHeader,
      String myText,
      String myButtonText,
      Color myColor,
      String myNavigationAddress,
      otherFunction) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: myColor,
          title: Text(myHeader,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          content: Text(myText,
              style: TextStyle(color: Colors.indigo[900], fontSize: 20)),
          actions: <Widget>[
            FlatButton(
              child: Text(
                myButtonText,
                textAlign: TextAlign.center,
                style: new TextStyle(color: Colors.indigo[900], fontSize: 30),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed(myNavigationAddress);
                otherFunction();
              },
            ),
          ],
        );
      },
    );
  }

  _capitalizeString(String str) {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

  otherPermissionBox(Decoration myBoxDeco, EdgeInsets myMargin, List theList) {
    Radius borderRadius = const Radius.circular(5.0);
    Color myTextColor = Colors.white;
    if (myBoxDeco == null) {
      myBoxDeco = BoxDecoration(
          gradient: colorGradient(Alignment.topRight, Alignment.bottomLeft),
          borderRadius: new BorderRadius.all(borderRadius));
    }
    if (myMargin == null) {
      myMargin = EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5);
    }
    return new Container(
      decoration: myBoxDeco,
      margin: myMargin,
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                height: 50,
                margin: const EdgeInsets.all(10),
                child: new Text(
                  "INSTALLED APPS WITH \nTHIS PERMISSION: ",
                  style: TextStyle(
                      color: myTextColor,
                      fontSize: 23,
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
                  height: 200,
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: ListView.separated(
                    separatorBuilder: (context, i) => Divider(
                          color: Colors.white,
                        ),
                    padding: EdgeInsets.all(15.0),
                    itemCount: theList.length,
                    itemBuilder: (context, i) {
                      return new ListTile(
                        title: Text(
                          _capitalizeString(theList[i]),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onTap: null,
                      );
                    },
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

//-------------------------------------------------------------------------------STOP

// FOLLOWING IS NOT IMPORTANT; JUST FOR INSPO IN THE END, not exactly the same parameters....  -->

class _PermissionTemplateState extends State<PermissionTemplate> {
  boxRight(String myImage, String myHeader, String myText) {
    Radius borderRadius = const Radius.circular(10.0);
    return new Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.indigo[900],
          borderRadius: new BorderRadius.all(borderRadius)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
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
    Radius borderRadius = const Radius.circular(10.0);
    return new Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.indigo[900],
          borderRadius: new BorderRadius.all(borderRadius)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
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
              margin: EdgeInsets.only(
                  left: 50.0, top: 7.5, bottom: 7.5, right: 10.0),
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

  textBoxWithPic(
      String myImage, String myHeader, String myText, double myHeightPic) {
    Radius borderRadius = const Radius.circular(10.0);
    return new Container(
      decoration: BoxDecoration(
          gradient: colorGradient(Alignment.topRight, Alignment.bottomLeft),
          borderRadius: new BorderRadius.all(borderRadius)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
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
                  borderRadius: new BorderRadius.all(borderRadius),
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
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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

  textBoxWith2Pics(String myImage1, String myImage2, String myHeader,
      String myText, double myHeightPic) {
    Radius borderRadius = const Radius.circular(10.0);
    return new Container(
      decoration: BoxDecoration(
          gradient: colorGradient(Alignment.bottomLeft, Alignment.topRight),
          borderRadius: new BorderRadius.all(borderRadius)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: new Container(
                  height: myHeightPic,
                  width: 185,
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(borderRadius),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(borderRadius),
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
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10.0),
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

  textBoxWith3Pics(String myImage1, String myImage2, String myImage3,
      String myHeader, String myText, double myHeightPic) {
    Radius borderRadius = const Radius.circular(10.0);
    return new Container(
      decoration: BoxDecoration(
          gradient: colorGradient(Alignment.topRight, Alignment.bottomLeft),
          color: Colors.indigo[900],
          borderRadius: new BorderRadius.all(borderRadius)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: new Container(
                  height: myHeightPic,
                  width: 150,
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 5),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(borderRadius),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(borderRadius),
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
                  margin:
                      EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 10),
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: new BorderRadius.all(borderRadius),
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
                  margin:
                      const EdgeInsets.only(left: 10, right: 10, bottom: 10),
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

  highlightNumbers(String bigText1, String smallText1, String bigText2,
      String smallText2, String bigText3, String smallText3) {
    Radius borderRadius = const Radius.circular(10.0);
    double myHeight = 100;
    return new Container(
      decoration:
          BoxDecoration(borderRadius: new BorderRadius.all(borderRadius)),
      margin: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Column(
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  height: myHeight,
                  margin: EdgeInsets.only(right: 2.5),
                  decoration: BoxDecoration(
                      color: Colors.indigo[400],
                      borderRadius: new BorderRadius.all(borderRadius)),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            child: new Text(
                              bigText1,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: new Text(
                                smallText1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: myHeight,
                  margin: EdgeInsets.only(left: 2.5, right: 2.5),
                  decoration: BoxDecoration(
                      color: Colors.indigo[600],
                      borderRadius: new BorderRadius.all(borderRadius)),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            child: new Text(
                              bigText2,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: new Text(
                                smallText2,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: myHeight,
                  margin: EdgeInsets.only(left: 2.5),
                  decoration: BoxDecoration(
                      color: Colors.indigo[900],
                      borderRadius: new BorderRadius.all(borderRadius)),
                  child: Column(
                    children: <Widget>[
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 5),
                            child: new Text(
                              bigText3,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Flexible(
                            child: new Container(
                              margin: const EdgeInsets.only(
                                  left: 10, right: 10, bottom: 10),
                              child: new Text(
                                smallText3,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  colorGradient(Alignment myStart, Alignment myEnd) {
    return LinearGradient(
      // Where the linear gradient begins and ends
      begin: myStart,
      end: myEnd,
      // Add one stop for each color. Stops should increase from 0 to 1
      stops: [0.1, 0.5, 0.7, 0.9],
      colors: [
        // Colors are easy thanks to Flutter's Colors class.
        Colors.indigo[900],
        Colors.indigo[700],
        Colors.indigo[600],
        Colors.indigo[400],
      ],
    );
  }

// functions

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*
      backgroundColor: Colors.white70,
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('PERMISSIONS',
            textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(),
      new ListView(
        children: <Widget>[
          new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  child: highlightNumbers('123', 'Num of apps', '123', 'Num of apps','123', 'Num of apps')
                ),
                new Container(
                  child: textBoxWithPic(
                      'assets/Data-Science-vs.-Big-Data-vs.jpg',
                      "YOUR DATA",
                      "How much data do u u u u u u u u send out every day?",150.0),
                ),
                new Container(
                  child: textBoxWith2Pics(
                      'assets/Data-Science-vs.-Big-Data-vs.jpg', 'assets/Data-Science-vs.-Big-Data-vs.jpg',
                      "YOUR DATA",
                      "How much data do u u u u u u u u send out every day? ",150.0),
                ),
                new Container(
                  child: textBoxWith3Pics(
                      'assets/Data-Science-vs.-Big-Data-vs.jpg', 'assets/test1.jpg', 'assets/Data-Science-vs.-Big-Data-vs.jpg',
                      "YOUR DATA",
                      "How much data do u u u u u u u u send out every day?", 150.0),
                ),
                new Container(
                  child: boxRight(
                      'assets/Data-Science-vs.-Big-Data-vs.jpg',
                      "YOUR DATA",
                      "How much data do u u u u u u u u send out every day?"),
                ),
                new Container(
                  child: boxLeft(
                      'assets/test1.jpg',
                      "YOUR DATA",
                      "How much data do u u u u u u u u send out every day?"),
                ),
              ]),
        ],
      ),*/
        );
  }
}
