import 'package:flutter/material.dart';
import 'package:launcher_assist/launcher_assist.dart';

class OtherAppsPage extends StatefulWidget {
  @override
  _OtherAppsPageState createState() => _OtherAppsPageState();
}

class _OtherAppsPageState extends State<OtherAppsPage> {

  var appCount;
  var installedApps;
  var installedAppsList;
  var theList = [];     // change this name it sucks, and also consider other stuff than the name

  void _testTheLauncher(){
    installedApps.forEach( (element) =>
      print('label =  ${element["label"]} \npackage =  ${element["package"]}\n\n')
    );
  }

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
        return new ListTile(
          title: Text(theList[i]),
          leading: Icon(Icons.thumb_up),
          trailing: Icon(Icons.thumb_up),
        );
      },
        //itemCount: theList.length,
    );
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
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Apps installed: $appCount'),
      ),
      body: Container(
        child: _getAppList(),
      ),
    );
  }
}
