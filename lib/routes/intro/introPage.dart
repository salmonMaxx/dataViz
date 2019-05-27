import 'package:flutter/material.dart';

import 'package:dots_indicator/dots_indicator.dart';

import '../PermissionTemplate.dart';
import '../permissions/Sms.dart';
import '../LoginPage.dart';

class IntroPage extends StatefulWidget {

  IntroPage(this.whoHasThis);
  Map<String, List<String>> whoHasThis;

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _pageController = PageController();
  int pageLength = 3;
  int currentIndexPage;
  @override
  Widget build(BuildContext context) {
    bigCircle() {
      return Container(
          width: 310.0,
          height: 310.0,
          decoration: new BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ));
    }

    page1() {
      currentIndexPage = 1;
      return Scaffold(
        backgroundColor: Colors.indigo[900],
        body: Column(
          children: <Widget>[
            new SizedBox(
              height: 100,
            ),
            Center(
              child: new Stack(
                children: <Widget>[
                  bigCircle(),
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
                ],
              ),
            ),
            Text(
              "READY TO BE ENLIGHTED?!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left:30, right:30, top: 40),
              child: Text(
                  "Swipe to the right -->",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),
          ],
        ),
      );
    }

    page2() {
      currentIndexPage = 2;
      return Scaffold(
        backgroundColor: Colors.indigo[700],
        body: Column(
          children: <Widget>[
            new SizedBox(
              height: 20,
            ),
            Center(
              child: new Stack(
                children: <Widget>[
                  bigCircle(),
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
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left:30, right:30, top:10),
              child: Text(
                  "In this app you will:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
            margin: EdgeInsets.only(left:30, right:30, top:10),
      child: Text(
      "- See what permissions your apps have access to\n"
      "- See if any of your phones apps are BLACKLISTED\n"
      "- Get guidance how to handle your permissions\n\n",
      textAlign: TextAlign.center,
      style: TextStyle(
      color: Colors.white,
      fontSize: 20,
      )),
      ),
            Container(
              margin: EdgeInsets.only(left:30, right:30),
              child: Text(
                      "Lets take control over your phone!!!\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
            margin: EdgeInsets.only(left:30, right:30),
              child: Text(
                      "Swipe to the right -->",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),

          ],
        ),
      );
    }

    page31() {
      currentIndexPage = 2;
      return Scaffold(
        backgroundColor: Colors.indigo[500],
        body: Column(
          children: <Widget>[
            new SizedBox(
              height: 200,
            ),

            Container(
              margin: EdgeInsets.only(left:20, right:20, bottom: 20),
              child: Text(
                  "LETS CHECKOUT HOW TO DO THIS!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left:25, right:25, top:10),
              child: Text(
                  "I belive you accept different permissions for all kinds of apps. \n"
                      "But have you ever asked your self why this app need this information "
                      "and what kind of information they really can collect about you!\n\n"

                      "For example, SMS, kind of private, huh?!\n"
                      "Lets see what we can reach and what other apps on your phone that have this permission!!"
                  ,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
            Container(
              margin: EdgeInsets.only(left:30, right:30, top: 20),
              child: Text(
                  "Swipe to the right -->",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
            ),

          ],
        ),
      );
    }

    page3() {
      currentIndexPage = 3;
      return Sms(widget.whoHasThis['sms'], false);
    }

    page4() {
      return LoginPage(widget.whoHasThis);
    }

    return Scaffold(
      body: PageView(children: <Widget>[
        page1(),
        page2(),
        page31(),
        page3(),
        page4(),
      ]),
    );
  }
}


