import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class OtherAppsPage extends StatefulWidget {
  @override
  _OtherAppsPageState createState() => _OtherAppsPageState();
}

class _OtherAppsPageState extends State<OtherAppsPage> {
  static const platform = const MethodChannel("dataViz/OtherApps/channel");
  var appCount;
  var installedApps;
  var installedAppsList;
  bool setUpLoading;
  var theList = [];     // change this name it sucks, and also consider other stuff than the name
  List<String> blackList = ['Drive', 'Facebook', 'Twitter', 'Snapchat', 'Chrome', 'Instagram'];

   _getAppListInfo(String key){
      installedApps.forEach((mapInList) => theList.add(mapInList[key]));
    return theList;
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
      print("===========================================\n"
        "             invoke method done                \n"
          "===========================================\n");

    }
    /*on PlatformException catch (e) {
      print('::::::::Platform exception:::::::::\n${e.message}');
    } */
    catch(e){
      print("in blacklist: \n$e");
    }
    return permissionsList;
  }

  Future _loadApps() async{
    await LauncherAssist.getAllApps().then((apps) {
      setState(() {
        appCount = apps.length;
        installedApps = apps;
        _getAppListInfo("label");
        _getPermissions();
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apps installed: $appCount'),
      ),
      body: Container(
        child:
          _loadThenBuild(),
          //Text('${_getPermissions?.toString()}'),
      ),
    );
  }
}
