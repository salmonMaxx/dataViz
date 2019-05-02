// routes
import './routes/LoginPage.dart';
import './routes/SignupPage.dart';
import  './routes/OtherAppsPage.dart';
import './routes/forgetMe.dart';
import './routes/PermissionTemplate.dart';
import './routes/menuPage.dart';
//routes --> permissions
import './routes/permissions/activity_log.dart';
import './routes/permissions/audio_files.dart';
import './routes/permissions/calender.dart';
import './routes/permissions/call_log.dart';
import './routes/permissions/camera.dart';
import './routes/permissions/contacts.dart';
import './routes/permissions/location.dart';
import './routes/permissions/mic.dart';
import './routes/permissions/phone.dart';
import './routes/permissions/sensors.dart';
import './routes/permissions/sms.dart';
import './routes/permissions/video_pics.dart';


//packages
import  'package:flutter/material.dart';
import  'package:location/location.dart';
//import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, fontFamily: 'Abel-Regular'
      ),
      home: MyHomePage(title: 'Location Page'),
      initialRoute: '/',
      routes: {
        'login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        'otherApps': (context) => OtherAppsPage(),
        'forgetMe': (context) => ForgetMe(),
        'permissions': (context) => PermissionTemplate(),
        'menu':(context) => MenuPage(),
        //PERMISSIONS
        'activity_log' : (context) => ActivityLog(),
        'audio_files' : (context) => AudioFiles(),
        'calender' : (context) => Calender(),
        'call_log' : (context) => CallLog(),
        'camera' : (context) => Camera(),
        'contacts' : (context) => Contacts(),
        'location' : (context) => LocationPermission(),
        'mic' : (context) => Mic(),
        'phone' : (context) => Phone(),
        'sensors' : (context) => Sensors(),
        'sms' : (context) => SMS(),
        'video_pics' : (context) => VideoPics(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

    @override
    _MyHomePageState createState() => _MyHomePageState();
  }


class _MyHomePageState extends State<MyHomePage> {
  LocationData loc;
  var location = new Location();
  LocationData theLocation;
  bool update = true;

  void _getLocation() async {
      // Changes to a State needs to be made inside the setState(() { *changes* });
      // body to include the changes in that states build method
      // setState SHOULD only have actual changes in it, not computation
      theLocation = await location.getLocation();
      setState(() {
        location.onLocationChanged().listen((LocationData currentLocation) {
          /*
            print('lat/lon:, ${theLocation.latitude},
                             ${theLocation.longitude}');*/
          loc = currentLocation;
        });
      });
      setState(() {

      });
      //}
    }

        void _toggleUpdate() {
      update = !update;
        print("update: $update");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
            IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.deepPurple),
              onPressed: () {
                Navigator.pushNamed(context, 'login');
              },
              tooltip: 'To Login-Page',
            ),
            IconButton(
              icon: Icon(Icons.apps, color: Colors.deepPurple),
              onPressed: () {
                Navigator.pushNamed(context, 'otherApps');
              },
              tooltip: 'To Other Apps Page',
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.pushNamed(
                  context, 'forgetMe',
                );
              },
              tooltip: 'To Login-Page',
            ),
            IconButton(
              icon: Icon(Icons.home, color: Colors.red),
              onPressed: () {
                Navigator.pushNamed(context, 'menu');
              },
              tooltip: 'To Other Apps Page',
            ),
          ],
        ),
      ),
    );
  }
}


  // CODE FROM WEEK THAT I DIDN'T WANT TO LOSE
  // IT'S ALL PERMISSIONS AND NICE TO HAVE AS A REMINDER
/*
  void permissionContact() async {
    //REQUEST PERMISSION
    dynamic permissionsRequestLocationAlways;
    dynamic permissionsRequestCalendar;
    dynamic permissionsRequestCamera;
    dynamic permissionsRequestMicrophone;
    dynamic permissionsRequestLocation;

    //print('============ def permission ============');
    PermissionGroup locationPermission       = PermissionGroup.location;
    PermissionGroup locationAlwaysPermission = PermissionGroup.locationAlways;
    PermissionGroup calendarPermission       = PermissionGroup.calendar;
    PermissionGroup cameraPermission         = PermissionGroup.camera;
    PermissionGroup microphonePermission     = PermissionGroup.microphone;

    //    A request followed by a rationale will
    permissionsRequestCalendar   = requestPermissionFor([cameraPermission, calendarPermission]);      //    give the user a dialogue (alert-box)
    bool cameraShow          = await PermissionHandler()                                              //    with the allow/deny choice
        .shouldShowRequestPermissionRationale(cameraPermission);
    bool calendarShow          = await PermissionHandler()
        .shouldShowRequestPermissionRationale(calendarPermission);
    //REQUEST STATUS
    /*
    print('============== requesting ==============');
    permissionsRequestCalendar   = requestPermissionFor(calendarPermission);
    permissionsRequestCamera     = requestPermissionFor(cameraPermission);
    permissionsRequestLocation   = requestPermissionFor(locationPermission);
    permissionsRequestMicrophone = requestPermissionFor(microphonePermission);
    */
    /*                     //CHECK STATUS
    Future permissionsCheckLocation       = checkPermissionStatus(locationPermission);
    Future permissionsCheckLocationAlways = checkPermissionStatus(locationAlwaysPermission);
    Future permissionsCheckCalendar       = checkPermissionStatus(calendarPermission);
    Future permissionsCheckCamera         = checkPermissionStatus(cameraPermission);
    Future permissionsCheckMicrophone     = checkPermissionStatus(microphonePermission);
    */
    /*
    print("STATUSES OF PERMISSIONS"
        "\nlocation:        $permissionsCheckLocation. "
        "\nlocation always: $permissionsCheckLocationAlways"
        "\ncalendar:        $permissionsCheckCalendar"
        "\ncamera:          $permissionsCheckCamera"
        "\nmicrophone:      $permissionsCheckMicrophone");
    */

    //bool isOpened = await PermissionHandler().openAppSettings();

    /*
    ServiceStatus serviceStatus = await PermissionHandler()
                         .checkServiceStatus(locationPermission);
    //bool isOpened = await PermissionHandler().openAppSettings();
    bool isShownCalendar = await PermissionHandler()
              .shouldShowRequestPermissionRationale(PermissionGroup.calendar);
    bool isShownCamera = await PermissionHandler()
        .shouldShowRequestPermissionRationale(PermissionGroup.camera);
    bool isShownMicrophone = await PermissionHandler()
        .shouldShowRequestPermissionRationale(PermissionGroup.microphone);
    print("Permissions: \n Location: $permissionsRequestLocation "
                        "\n Check location: $permissionsCheckLocation"
                        "\n LocationAlways: $permissionsRequestLocationAlways "
                        "\n Check locationAlways: $permissionsCheckLocationAlways"
                        "\n Service: $serviceStatus "
                        "\n isShown: $isShownCalendar");
     */
  }

  Future<Map> requestPermissionFor(List<PermissionGroup> group) async{
    return await PermissionHandler().requestPermissions(group);
  }

  checkPermissionStatus(PermissionGroup group) async{
    return await PermissionHandler().checkPermissionStatus(group);
  }

}
*/