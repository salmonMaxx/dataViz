import 'package:flutter/material.dart';

import 'package:dots_indicator/dots_indicator.dart';

import '../PermissionTemplate.dart';
import '../permissions/Sms.dart';
import '../LoginPage.dart';

class IntroPage extends StatefulWidget {
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
            SizedBox(
              height: 10,
            ),
            Text(
              "READY TO BE ENLIGHTED?!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            )
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
              height: 50,
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
              margin: EdgeInsets.all(30),
              child: Text(
                  "This app helps you get control of your phone and apps. \n\n"
                  "There are lots of apps that collect information about you in order to sell it in marketing purpose "
                  "or that eradicate your information incorrectly."
                  "\n\n Think before allowing permission requests!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            )
          ],
        ),
      );
    }

    /*page3() {
      currentIndexPage = 3;
      return SMS();
    }*/

    page4() {
      return LoginPage();
    }

    return Scaffold(
      body: PageView(children: <Widget>[
        page1(),
        page2(),

        //page3(),
        page4(),
      ]),
    );
  }
}

/*        new DotsIndicator(
          dotsCount: pageLength,
          position: currentIndexPage,
          decorator: DotsDecorator(
            color: Colors.black87,
            activeColor: Colors.redAccent,
          ),
        )*/
