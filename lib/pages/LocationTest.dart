import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class LocationTest extends StatefulWidget {
  @override
  _LocationTestState createState() => _LocationTestState();
}

class _LocationTestState extends State<LocationTest> {

  Map<String, double> currentLocation = new Map();
  //StreamSubscription<Map<String, double>> locationSubscription;
  dynamic locationSubscription;
  Location location = new Location();
  String error;

  @override
  void initState() {
    super.initState();

    //default is 0
    currentLocation['longitude'] = 0.0;
    currentLocation['latitude'] = 0.0;

    initPlatformState();
    locationSubscription = location.onLocationChanged().listen((dynamic result) { //Map<String, double>
      setState( () {
        currentLocation = result;
      });
    });
  }

  void initPlatformState() async {
    dynamic myLocation; //Map<String, double>
    try{
      myLocation = await location.getLocation;
      error = "";
    } on PlatformException catch(e){
      if(e.code=='PERMISSION_DENIED'){
        error = 'Permission denied';
      }
      else if(e.code == 'PERMISSION_DENIED_NEVER_ASK'){
        error = 'Permission denied - please ask user to enable from app settings';
      }
      myLocation = null;
    }
    setState(() {
      currentLocation = myLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(title: Text('LOCATION'),),
          body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'Latitude/Longitude: ${currentLocation['latitude']} / ${currentLocation['longitude']}',
                  style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
              )
            ],)
          )
      )
    );
  }
}
