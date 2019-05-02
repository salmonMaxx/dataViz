// routes
import './routes/LoginPage.dart';
import './routes/SignupPage.dart';
import  './routes/OtherAppsPage.dart';
import './routes/forgetMe.dart';
import './routes/PermissionTemplate.dart';
import './routes/PermissionLocationScreen.dart';
import './routes/PermissionMicrophoneScreen.dart';
import './routes/menuPage.dart';

//packages
import  'package:flutter/material.dart';

//import 'package:permission_handler/permission_handler.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Location Page'),
      initialRoute: '/',
      routes: {
        'login': (context) => LoginPage(),
        'signup': (context) => SignupPage(),
        'otherApps': (context) => OtherAppsPage(),
        'forgetMe': (context) => ForgetMe(),
        'permissions': (context) => PermissionTemplate(),
        'location': (context) => PermissionLocationScreen(),
        'microphone': (context) => PermissionMicrophoneScreen(),
        'menu':(context) => MenuPage(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Row( mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column( mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.person_pin, color: Colors.deepPurple),
                    iconSize: 48.0,
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    tooltip: 'To Login-Page',
                  ),
                  IconButton(
                    icon: Icon(Icons.apps, color: Colors.deepPurple),
                    iconSize: 48.0,
                    onPressed: () {
                      Navigator.pushNamed(context, 'otherApps');
                    },
                    tooltip: 'To Other Apps Page',
                  ),
                  IconButton(
                    icon: Icon(Icons.remove_circle, color: Colors.red),
                    iconSize: 48.0,
                    onPressed: () {
                      Navigator.pushNamed(
                        context, 'forgetMe',
                      );
                    },
                    tooltip: 'To Login-Page',
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.location_on, color: Colors.red),
                    iconSize: 48.0,
                    onPressed: () {
                      Navigator.pushNamed(
                          context, 'location',
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.blueGrey),
                    iconSize: 48.0,
                    onPressed: () {
                      Navigator.pushNamed(
                             context, 'menu',
                      );
                    },
                    tooltip: 'location',
                  ),
                  IconButton(
                    icon: Icon(Icons.mic, color: Colors.blueGrey),
                    iconSize: 48.0,
                    onPressed: () {
                      Navigator.pushNamed(
                        context, 'microphone',
                      );
                    },
                    tooltip: 'microphone',
                  ),
                ],
              ),
            ],
          ),
        ],
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

    print('============ def permission ============');
    PermissionGroup locationPermission       = PermissionGroup.location;
    PermissionGroup locationAlwaysPermission = PermissionGroup.locationAlways;
    PermissionGroup calendarPermission       = PermissionGroup.calendar;
    PermissionGroup cameraPermission         = PermissionGroup.camera;
    PermissionGroup microphonePermission     = PermissionGroup.microphone;

        A request followed by a rationale will
    permissionsRequestCalendar   = requestPermissionFor([cameraPermission, calendarPermission]);      //    give the user a dialogue (alert-box)
    bool cameraShow          = await PermissionHandler()                                              //    with the allow/deny choice
        .shouldShowRequestPermissionRationale(cameraPermission);
    bool calendarShow          = await PermissionHandler()
        .shouldShowRequestPermissionRationale(calendarPermission);
   REQUEST STATUS

    print('============== requesting ==============');
    permissionsRequestCalendar   = requestPermissionFor(calendarPermission);
    permissionsRequestCamera     = requestPermissionFor(cameraPermission);
    permissionsRequestLocation   = requestPermissionFor(locationPermission);
    permissionsRequestMicrophone = requestPermissionFor(microphonePermission);
                    //CHECK STATUS
    Future permissionsCheckLocation       = checkPermissionStatus(locationPermission);
    Future permissionsCheckLocationAlways = checkPermissionStatus(locationAlwaysPermission);
    Future permissionsCheckCalendar       = checkPermissionStatus(calendarPermission);
    Future permissionsCheckCamera         = checkPermissionStatus(cameraPermission);
    Future permissionsCheckMicrophone     = checkPermissionStatus(microphonePermission);

    print("STATUSES OF PERMISSIONS"
        "\nlocation:        $permissionsCheckLocation. "
        "\nlocation always: $permissionsCheckLocationAlways"
        "\ncalendar:        $permissionsCheckCalendar"
        "\ncamera:          $permissionsCheckCamera"
        "\nmicrophone:      $permissionsCheckMicrophone");


    bool isOpened = await PermissionHandler().openAppSettings();


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

  }

  Future<Map> requestPermissionFor(List<PermissionGroup> group) async{
    return await PermissionHandler().requestPermissions(group);
  }

  checkPermissionStatus(PermissionGroup group) async{
    return await PermissionHandler().checkPermissionStatus(group);
  }
    */