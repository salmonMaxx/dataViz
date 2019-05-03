import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class OtherAppsPage extends StatefulWidget {
  @override
  _OtherAppsPageState createState() => _OtherAppsPageState();
}

class _OtherAppsPageState extends State<OtherAppsPage> {
  static const platform = const MethodChannel("dataViz.defentry/OtherApps/channel");
  var appCount;
  var installedApps;
  var installedAppsList;
  var theList = [];     // change this name it sucks, and also consider other stuff than the name
  List<String> blackList = ['Drive', 'Facebook', 'Twitter', 'Snapchat', 'Chrome', 'Instagram'];

  void _testTheLauncher(){
    installedApps.forEach( (element) =>
      print('label =  ${element["label"]} \npackage =  ${element["package"]}\n\n')
    );
  }

   _getAppListInfo(String key){
      installedApps.forEach((mapInList) => theList.add(mapInList[key]));
    return theList;
  }

  _openSettings() async {
    //bool isOpened = await PermissionHandler().openAppSettings();
  }

  Widget _getAppList(){
    return ListView.separated(
      separatorBuilder:
        (context, i) => Divider(
          color: Colors.black,
        ),
      padding: EdgeInsets.all(15.0),
      itemCount: theList.length,
      itemBuilder: (context, i){
      final blacklisted = (blackList.contains('${theList[i]}'));
        return new ListTile(
          title: Text(theList[i], style: TextStyle(fontWeight: FontWeight.w800),),
          trailing: Icon( blacklisted ? Icons.cancel : Icons.check_box,
                  color: (blacklisted ? Colors.red : Colors.green)),

        );
      },
        //itemCount: theList.length,
    );
  }

  Future<List<String>> _getPermissions() async{
    List<String> permissionsList;
    print("===========================================\n"
        "             get permissions                \n"
        "===========================================\n");
    try{
      permissionsList = await platform.invokeMethod('getPermissions');
      print("invoke method");

    }
    /*on PlatformException catch (e) {
      print('::::::::Platform exception:::::::::\n${e.message}');
    } */
    catch(e){
      print(e);
    }
    return permissionsList;
  }

  @override
  initState() {
    super.initState();
    // Get all apps
    LauncherAssist.getAllApps().then((apps) {
      setState(() {
        appCount = apps.length;
        installedApps = apps;
        _getAppListInfo("label");
        _getPermissions();
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apps installed: $appCount'),
      ),
      body: Container(
        child:
          _getAppList(),
          //Text('${_getPermissions?.toString()}'),
      ),
    );
  }
}
