import 'package:flutter/material.dart';
import 'package:location/location.dart';
//import 'package:geolocation/geolocation.dart';

class PermissionLocationScreen extends StatefulWidget {
  @override
  _PermissionLocationScreenState createState() => _PermissionLocationScreenState();
}

class _PermissionLocationScreenState extends State<PermissionLocationScreen> {

  LocationData loc;
  var location = new Location();
  LocationData theLocation;

  void _getLocation() async {
    theLocation = await location.getLocation();
      location.onLocationChanged().listen((LocationData currentLocation) {
        loc = currentLocation;
        /*
        print('lat/lon:, ${theLocation.latitude},
                         ${theLocation.longitude}');
        */
      setState(() {
      });
    });
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
                Text(
                  'Location',
                  style: Theme
                      .of(context).textTheme.display2,
                ),
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

/*

Text(
              'Location',
                style: Theme
                    .of(context).textTheme.display2,
            ),
            Text( // the ?.method() operator checks
              '${loc?.latitude}', //  if the getter (lat/lon) is null,
              style: Theme
                  .of(context)
                  .textTheme
                  .display1, // if it is then
              //don't get value
            ),
            Text(
              '${loc?.longitude}',
              style: Theme
                  .of(context)
                  .textTheme
                  .display1,
            ),
            IconButton(
              icon: Icon(Icons.location_on, color: Colors.red),
              onPressed: _getLocation,
              tooltip: 'location',
            ),
 */