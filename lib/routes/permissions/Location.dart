import 'package:flutter/material.dart';
import 'package:location/location.dart' as lc;
import 'package:torsdags_test/routes/PermissionTemplate.dart';
//import 'package:geolocation/geolocation.dart';

class Location extends StatefulWidget {
  
  Location({Key key, this.whoHasLocation}) : super(key:key);
  final Map<String, dynamic> whoHasLocation;
  
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {

  lc.LocationData loc;
  var location = new lc.Location();
  lc.LocationData theLocation;
  PermissionTemplate temp = new PermissionTemplate();

  void _getLocation() async {
    theLocation = await location.getLocation();
    location.onLocationChanged().listen((lc.LocationData currentLocation) {
      setState(() {
        loc = currentLocation;
      },
      );
    },
    );
  }

  @override
  Widget build(BuildContext context) {
    _getLocation();
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: loc?.latitude == null?
                  Text('getting location...',
                    style: Theme
                        .of(context)
                        .textTheme
                        .display1,)
                      :
                  Text(// the ?.method() operator checks
                    '${loc?.latitude}', //  if the getter (lat/lon) is null,
                    style: Theme
                        .of(context)
                        .textTheme
                        .display1, // if it is then
                    //don't get value, print null
                  ),

                ),
                Center(
                  child: loc?.longitude == null?
                  Text('getting location...',
                    style: Theme
                        .of(context)
                        .textTheme
                        .display1,)
                      :
                  Text(// the ?.method() operator checks
                    '${loc?.longitude}', //  if the getter (lat/lon) is null,
                    style: Theme
                        .of(context)
                        .textTheme
                        .display1, // if it is then
                    //don't get value, print null
                  ),
                ),
                temp.otherPermissionBox(null, null, widget.whoHasLocation['whoHasLocation']),
              ],
            ),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Icon(Icons.my_location),
                  onPressed: _getLocation,
                ),
              ],
            ),*/
          ],
        ),
      ),
    );
  }
}
