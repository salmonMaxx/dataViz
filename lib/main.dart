import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      // ===============================
      // ========== ROUTES =============
      // ===============================

      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: 'flutter home'),
        'first': (context) => FirstRoute(),
        'second': (context) => SecondRoute(),
      },
      home: FirstRoute(),
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
  int _counter = 0;

  void doTheThing(){
    permissionContact();
    _incrementCounter();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

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
              'You have pushed the button this many times:',
            ),
            RaisedButton(
              onPressed: _incrementCounter,
              child:
                Text("increment")
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: doTheThing,
        tooltip: 'Does both the permissions and increment',
        child: Icon(Icons.add),
      ),
    );

  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('back'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Go away'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute())
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Away"),
      ),
      body: Center(
        child: Container(
          height: 100.0,
          child: RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
            child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.attach_money),
                Icon(Icons.attach_money),
                Icon(Icons.attach_money),
                Text(
                    'Go back!'
                ),
                Icon(Icons.attach_money),
                Icon(Icons.attach_money),
                Icon(Icons.attach_money),
                IconButton(
                  icon: Icon(Icons.attach_money),
                  onPressed: () {
                    print ('dollar dollar bill y`all');
                  }
                ),
              ]),
              color: Colors.blue,
          ),
        ),
      ),
    );
  }
}