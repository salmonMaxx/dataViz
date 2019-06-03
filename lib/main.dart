// routes
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:launcher_assist/launcher_assist.dart';

import './routes/LoginPage.dart';
import './routes/SignupPage.dart';
import './routes/ForgetMe.dart';
import './routes/ForgotPassword.dart';
import './routes/PermissionTemplate.dart';
import './routes/PermissionMicrophoneScreen.dart';
import './routes/MenuPage.dart';
import './routes/MenuForOtherPerm.dart';
import './routes/permissions/Sensors.dart';

//drawer --> sidebar menu

import './routes/drawer/AboutUs.dart';
import './routes/drawer/BigPicture.dart';

//intro
import './routes/intro/introPage.dart';

//routes --> permissions

import './routes/permissions/Sms.dart';

//packages
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dataViz',
      theme: ThemeData(
          primarySwatch: Colors.indigo[900],
          fontFamily: 'Abel-bold',
          backgroundColor: Colors.white70),
      home: MyHomePage(title: 'Location Page'),
      initialRoute: '/',
      routes: {
        'signup': (context) => SignupPage(),
        'forgetMe': (context) => ForgetMe(),
        'forgotPassword': (context) => ForgotPassword(),
        'permissions': (context) => PermissionTemplate(),
        'microphone': (context) => PermissionMicrophoneScreen(),
        'sensors': (context) => Sensors(),
        //'menu': (context) => MenuPage(_getPermissionLists()),
        //'menuOther': (context) => MenuForOtherPerm(),
        //drawer
        'big_picture': (context) => BigPicture(),
        'about_us': (context) => AboutUs(),
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
  Map<String, String> permissionMap;
  int appCount;
  var installedApps;
  var installedPackages;
  var installedLabels;
  var installedAppIcons;
  List<String> installedAppLabels;
  static const platform =
  const MethodChannel("dataViz/permissions"); //change channel string
  Map<String, List<String>> whoHasWhat;

  Map<String, List<String>> _getPermissionLists(){
    Map<String, List<String>> permissionMap = new Map();
    permissionMap['installedLabels']  = installedAppLabels;
    permissionMap['contacts']   =          _getPermissionToAppList("android.permission.READ_CONTACTS");
    permissionMap['microphone'] =           _getPermissionToAppList("android.permission.RECORD_AUDIO");
    permissionMap['sms']        =               _getPermissionToAppList("android.permission.READ_SMS");
    permissionMap['videoPics']  =  _getPermissionToAppList("android.permission.READ_EXTERNAL_STORAGE");
    permissionMap['location']   =   _getPermissionToAppList("android.permission.ACCESS_FINE_LOCATION");
    permissionMap['calendar']   =          _getPermissionToAppList("android.permission.READ_CALENDAR");
    permissionMap['phone']      = _getPermissionToAppList("android.permission.WRITE_EXTERNAL_STORAGE");
    permissionMap['callLog']    =          _getPermissionToAppList("android.permission.READ_CALL_LOG");
    permissionMap['camera']     =                 _getPermissionToAppList("android.permission.CAMERA");
    return permissionMap;
  }

  Future<Map<String, String>> _getPermissions() async {
    Map<String, String> permissionMap;
    try {
      permissionMap = await platform.invokeMapMethod('getPermissions');
    } catch (e) {
      print({e.toString()});
    }
    return permissionMap;
  }

  Future _loadApps() async {
    await LauncherAssist.getAllApps().then((apps) {
      setState(() {
        appCount = apps.length;
        installedApps =
            apps; //List of Map of label, package and icon; icon is bytearray
      });
    });
    installedAppLabels = _resolveTheListLabels(installedApps);
    installedPackages = _resolveTheListPackages(installedApps);
    //installedAppIcons = _resolveTheListIcons(installedApps);
  }

  _resolveTheListPackages(List<dynamic> theList) {
    List<String> packageList = [];
    theList?.forEach((element) => packageList.add(element["package"]));
    //.toLowerCase().replaceAll(new RegExp(r"\s+\b|\b\s|\s|\b"), "") to remove spaces and make lowercase
    return packageList;
  }

  _resolveTheListLabels(List<dynamic> theList) {
    List<String> labelList = []; //make me the length of the list!!
    theList?.forEach((element) => labelList.add(element["label"]));
    //.toLowerCase().replaceAll(new RegExp(r"\s+\b|\b\s|\s|\b"), "") to remove spaces and make lowercase
    return labelList;
  }

  _resolveTheListIcons(List<dynamic> theList) {
    Uint8List iconList;
    theList.forEach((element) => iconList.add(element["icon"]));
    //.toLowerCase().replaceAll(new RegExp(r"\s+\b|\b\s|\s|\b"), "") to remove spaces and make lowercase
    return iconList;
  }

  _capitalizeString(String str) {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

  List<String> _getPermissionToAppList(String permission) {
    List<String> appsWithPermission = [];
    permissionMap?.forEach((package, permissionListString) {
      if (permissionListString.split(",").contains(permission)) {
        //translate package into label with the installedApps variable
        installedApps?.forEach((index) {
          if (index["package"] == package) {
            appsWithPermission.add(index["label"]);
          }
        });
      }
    });
    //print('$permission is given to: $appsWithPermission');
    return appsWithPermission;
  }

  @override
  void initState() {
    super.initState();
    _loadApps();
    print('loaded apps. . . \n');
    _waitForPermissions().then((permissions) =>
        setState(() {
          permissionMap = permissions;
        })
    );
    print('loaded permissions. . . \n');
  }

  _waitForPermissions() async {
    return await _getPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.local_florist, color: Colors.pink),
                    iconSize: 48.0,
                    onPressed: (){
                      var list = _getPermissionToAppList("android.permission.READ_SMS");
                      var route = new MaterialPageRoute(
                        builder: (BuildContext context) =>
                          new IntroPage(_getPermissionLists()));
                      Navigator.of(context).push(route);
                    },
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.blueGrey),
                    iconSize: 48.0,
                    onPressed: () {
                      var route = new MaterialPageRoute(
                          builder: (BuildContext context) => new MenuPage(_getPermissionLists()));
                      Navigator.of(context).push(route);
                    },
                    tooltip: 'location',
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

   permissionsRequestCalendar   = requestPermissionFor();

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
