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

//drawer --> sidebar menu

import './routes/drawer/AboutUs.dart';
import './routes/drawer/BigPicture.dart';
import './routes/drawer/FeedBack.dart';
import './routes/drawer/Settings.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Abel-bold',
          backgroundColor: Colors.white70),
      home: MyHomePage(title: 'Location Page'),
      initialRoute: '/',
      routes: {
        'login': (context) => LoginPage(),
        'signup': (context) => SignupPage(),
        'forgetMe': (context) => ForgetMe(),
        'forgotPassword': (context) => ForgotPassword(),
        'permissions': (context) => PermissionTemplate(),
        'microphone': (context) => PermissionMicrophoneScreen(),
        'menu': (context) => MenuPage(),

        //drawer
        'big_picture': (context) => BigPicture(),
        'settings': (context) => Settings(),
        'about_us': (context) => AboutUs(),
        'feedback': (context) => FeedBack(),
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
  List<String> whoHasLocationPermission;

  Future<Map<String, String>> _getPermissions() async {
    Map<String, String> permissionMap;
    try {
      permissionMap = await platform.invokeMapMethod('getPermissions');
    } catch (e) {
      print("in blacklist: _getPermissions catch clause: \n${e.toString()}");
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
    theList.forEach((element) => packageList.add(element["package"]));
    //.toLowerCase().replaceAll(new RegExp(r"\s+\b|\b\s|\s|\b"), "") to remove spaces and make lowercase
    return packageList;
  }

  _resolveTheListLabels(List<dynamic> theList) {
    List<String> labelList = []; //make me the length of the list!!
    theList.forEach((element) => labelList.add(element["label"]));
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
    permissionMap.forEach((package, permissionListString) {
      if (permissionListString.split(",").contains(permission)) {
        //translate package into label with the installedApps variable
        installedApps.forEach((index) {
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
    _getPermissions().then((permissions) => permissionMap = permissions);
    print('loaded permissions. . . \n');
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
                          new Sms(list));
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
                          builder: (BuildContext context) => new MenuPage(
                            appInfo: {
                              'installedLabels': installedAppLabels,
                              'contacts' : _getPermissionToAppList("android.permission.READ_CONTACTS"),
                              'microphone' : _getPermissionToAppList("android.permission.RECORD_AUDIO"),
                              'sms' : _getPermissionToAppList("android.permission.READ_SMS"),
                              'videoPics' : _getPermissionToAppList("android.permission.READ_EXTERNAL_STORAGE"),
                              'location' : _getPermissionToAppList("android.permission.ACCESS_FINE_LOCATION"),
                              'calendar' : _getPermissionToAppList("android.permission.READ_CALENDAR"),
                              'phone' : _getPermissionToAppList("android.permission.WRITE_EXTERNAL_STORAGE"),
                              'callLog' : _getPermissionToAppList("android.permission.READ_CALL_LOG"),

                              //keep adding here to get more into the menu page
                              //TODO Contacts, microphone, sms, video and images, location
                            },
                          ));
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
