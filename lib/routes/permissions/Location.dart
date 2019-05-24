import 'package:flutter/material.dart';
import 'package:location/location.dart' as lc;
import 'package:dataViz/routes/PermissionTemplate.dart';
//import 'package:geolocation/geolocation.dart' as GeoLocator;

class Location extends StatefulWidget {
  Location(this.whoHasLocation);
  final List<String> whoHasLocation;

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
    location.onLocationChanged().listen(
      (lc.LocationData currentLocation) {
        if (mounted) {
          setState(
            () {
              loc = currentLocation;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _getLocation();
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('LOCATION'),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    temp.textBox(
                        BoxDecoration(
                            gradient: temp.colorGradient(
                                Alignment.centerRight, Alignment.centerLeft),
                            borderRadius: new BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        "Big Brother follows you?",
                        null,
                        "The location permission grants an app to see the exact location of your device in real time. Wherever you go.",
                        15,
                        EdgeInsets.only(left: 10, right: 10, bottom: 5)),
                    Center(
                      child: loc?.longitude == null
                          ? temp.textBox(null, 'getting location...', null,
                              'working on it...', 8, null)
                          : temp.textBox(
                              BoxDecoration(
                                  gradient: temp.colorGradient(
                                      Alignment.topCenter, Alignment.bottomCenter),
                                  borderRadius: new BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0))),
                              // the ?.method() operator checks
                              'This devices lat/long: ',
                              null,
                              '${loc?.longitude}\n${loc?.latitude}',
                              null,
                              EdgeInsets.only(left: 10, right: 10, top: 5)
                              // if it is then
                              //don't get value, print null
                              ),
                    ),
                    temp.textBox(
                        BoxDecoration(
                            gradient: temp.colorGradient(
                                Alignment.bottomCenter, Alignment.topCenter),
                            borderRadius: new BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        "Here you are!",
                        null,
                        "Try walking around in the room to see how accurate this data actually is.",
                        18,
                        EdgeInsets.only(left: 10, right: 10, bottom: 5)),
                    temp.boxRight(
                      null,
                      'assets/location_map.jpg',
                      '',
                      "A users personal location might be useful to have. A map application might use this to show you the fastest path to your destination and might also train its algorithms with that same data at the same time.\n\nThe device location can also be used for not-so-obvious reasons such as geotagging photos taken.",
                    ),
                    temp.boxxLeft(
                        null,
                        'assets/location_code.jpg',
                        '',
                      "Though, there are drawbacks. Some apps will use the permission to use a devices location to sell to marketers for profit or other malicious use cases.\n\nA devices location is easily connected to a persons home, workplace or school or other frequently visited locations. Perhaps this is not something that everybody is comfortable with sharing and thus need to be mindful of which apps are granted this permission.",),
                    temp.otherPermissionBox(null, null, widget.whoHasLocation),
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
        ],
      ),
    );
  }
}
