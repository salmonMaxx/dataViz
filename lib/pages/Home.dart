import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: new Scaffold(
            appBar: AppBar(title: Text('HOME'),),
            body: Center(
                child: Column(mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Hello! You are on page the page called "home"',
                      style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
                    )
                  ],)
            )
        )
    );
  }
}
