import './PermissionTemplate.dart';
//import '../assets/blackListCsv.csv';

import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:torsdags_test/routes/PermissionTemplate.dart';
import 'package:path_provider/path_provider.dart';

class OtherAppsPage extends StatefulWidget {
  @override
  _OtherAppsPageState createState() => _OtherAppsPageState();
}

class _OtherAppsPageState extends State<OtherAppsPage> {
  static const platform = const MethodChannel("kalle"); //change channel string
  var appCount;
  var installedApps;
  var installedAppsList;
  bool setUpLoading;
  var appLabels = [];     // change this name it sucks, and also consider other stuff than the name
  var appPackages = [];
  Map<String, String> labelPackageMap;
  List<String> blackList = ["Drive"];
  String blackListDir = "assets/blackListCsv.csv";
  PermissionTemplate template = new PermissionTemplate();
  List<String> packageNames;
  Future<Map<String,String>> permissionsNamePermission;


   void _getAppListInfo(){
      //installedApps.forEach((mapInList) =>
      for(Map app in installedApps) {

        labelPackageMap[app["label"]].put(app["package"]);
        print("label: ${app["label"]}\nhas package ${labelPackageMap[app["label"]]}");
        /*appLabels.add(app["label"]);
        print(app["label"]);
        appPackages.add(app["package"]);
        print("${app["package"]}\n");*/
      }
    }

  Widget _getAppList(){
    return ListView.separated(
      separatorBuilder:
        (context, i) => Divider(
          color: Colors.black,
        ),
      padding: EdgeInsets.all(15.0),
      itemCount: appLabels.length,
      itemBuilder: (context, i){
      final blacklisted = (blackList.contains('${appLabels[i]}'));
        return new ListTile(
          title: Text(appLabels[i], style: TextStyle(fontWeight: FontWeight.w800),),
          trailing: Icon( blacklisted ? Icons.cancel : Icons.check_box,
                  color: (blacklisted ? Colors.red : Colors.green)),
          onTap: null, //(_nameToPackage(appLabels[i]))

        );
      },
    );
  }

  Future<Map<String,String>> _getPermissions() async {
    //Add support for checking if any "extra permissions" are given here, to rinse them out before they can get in!!

    Map<String, String> permissionMap;
//    print("===========================================\n"
//        "             get permissions 4each              \n"
//        "===========================================\n");
    try{
      permissionMap = await platform.invokeMapMethod('getPermissions');
      //permissionMap.forEach((k, v) => print("app: $k \n\n\n\n\n permissions: $v \n\n\n\n"));

    } catch(e){
        print("in blacklist: _getPermissions catch clause: \n${e.toString()}");
    }
    //print(permissionMap);
    return permissionMap;
  }

  Future _loadApps() async{
    await LauncherAssist.getAllApps().then((apps) {
      setState(() {
        appCount = apps.length;
        installedApps = apps;
        _getAppListInfo();
        permissionsNamePermission = _getPermissions();
        print("loadApps done ... ");
      });
    });
      setState(() {
        setUpLoading = false;
      });

  }

  Widget _loadThenBuild(){
    if(setUpLoading){
      return new Container(
          child: new CircularProgressIndicator()
      );
    }
    else {
      return _getAppList();
    }

  }

  @override
  initState() {
    super.initState();
    setUpLoading = true;
    _loadApps();
    // Get all apps
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/blackListCsv.csv');
  }


  /*
  _nameToPackage(String appName){
     //take resolved name (drive) and find it's
    // package (google.com.drive)
    installedApps.forEach((mapInList) =>
        appName == mapInList["label"] ? print("$appName") : print("")
    );
  }
  */


  _permissionsForPackage(String appName){
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apps installed: $appCount'),
      ),
      body: Container(
          child: _loadThenBuild(),
      ),
    );
  }
}