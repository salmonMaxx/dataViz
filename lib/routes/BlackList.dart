import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:launcher_assist/launcher_assist.dart';

class BlackList extends StatefulWidget {
  @override
  _BlackListState createState() => _BlackListState();
}

class _BlackListState extends State<BlackList> {

  Map<String,String> permissionMap;
  int appCount;
  var installedApps;
  var installedPackages;
  var installedLabels;
  var installedAppIcons;
  List<String> installedAppLabels;
  static const platform = const MethodChannel("kalle"); //change channel string
  List<String> blackList = _getBlackList();

  static _getBlackList() {
    return ["3 In 1 Diamond Slots + Bonus",
      "777 Jackpot Slots-Free Casino",
      "Arranger Keyboard",
      "Audiosdroid Audio Studio DAW",
      "Aux-Direct",
      "Aux-Direct Pro",
      "CALCULATEUR DE CREDIT",
      "Christmas Slots Free",
      "Classic Slot Machine Free",
      "Creepypasta",
      "Diamond 777 Slot Machine",
      "Diamond Vault Slots – Vegas",
      "DigiHUD Pro Speedometer",
      "DigiHUD Speedometer",
      "Double Diamond 777 Slots-Vegas",
      "Double Gold Slots",
      "En Fuego 777 Slot Machine",
      "Fit 360 Fitness & Bodybuilding",
      "Flashlight Gallery",
      "Flashlight Gallery Lite",
      "Flashlight Gallery Pro",
      "Flygstatus & Schemalägga – FlightHero Free",
      "Flygstatus & Schemalägga – FlightHero Pro",
      "Free Adblocker Browser – Adblock & Popup Blocker",
      "Free Triple Star Slot Machine",
      "FX Music Karaoke Player",
      "Geo Quiz",
      "Geo Quiz Pro",
      "GLOB ANOK",
      "Halloween Corner",
      "Halloween Slots Free",
      "Irish Money Wheel Slots",
      "Jokes",
      "London Live Bus Times – TfL Buses",
      "Lucky 777 Slot Machine – FREE",
      "Magical Slots",
      "Math Quiz HD",
      "Math Quiz HD Pro",
      "Medical ID (Free) Nödsituation",
      "Medical ID (ICE): Nödsituation",
      "Money Wheel Slot Machine 2",
      "Money Wheel Slot Machine Game",
      "Network Signal Info Pro",
      "Office Jerk Free",
      "Ovu Period Tracker Gratis",
      "Phone Analyzer",
      "Phone Analyzer Pro",
      "Ping and Trace Pro",
      "Ping Pro",
      "Pixlr",
      "Power Browser – Fast Internet Explorer",
      "Private Browser & Incognito Browser",
      "RecMe Free Screen Recorder",
      "Red Hot 777 Slots: FREE",
      "Salaire Brut ou Net",
      "Scare Joke HD (Prank)",
      "Scare Joke HD Pro (Prank)",
      "Simple weather & clock widget",
      "Speech2Text Translator",
      "Statistics",
      "Statistics Pro",
      "TAXINA",
      "Termometer (fria)",
      "Triple 777 Slots – Free Casino",
      "Triple Diamond 777 Slots",
      "Triple Diamond Slot Machine",
      "Under the Sea Slots",
      "Veganized – Vegan Recipes, Nutrition, Grocery List",
      "VoiceFX – Voice Changer with voice effects",
      "WEATHER NOW",
      "West Midlands Transport: Live Bus, Train Timetable",
      "WiFi Overview 360 Pro",
      "WiFi-o-Matic",
      "WiFi-o-Matic Pro",
      "15 dagars väderprognos",
      "Car Navigation: GPS & Maps",
      "Family Locator and GPS Tracker",
      "Flush Pro – Restroom Finder",
      "Flush – Toilet Finder & Map",
      "Guide for Animal Crossing NL",
      "London Tube Live – Underground",
      "My Aurora Forecast & Alerts",
      "My Earthquake Alerts & Feed",
      "My Moon Phase Pro – Alerts",
      "My Tide Times Pro – Tide Chart",
      "My Tide Times – Tables & Chart",
      "Peel TV Guide",
      "Perfect365",
      "Speed Cameras & Traffic",
      "Sygic GPS-navigering & Kartor"
    ];
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
      appBar: AppBar(
        title: Text(
          'Blacklist: $appCount apps installed',
        ),
      ),
      body:
      _getAppList(),
    );
  }

  _whichHasWhich(){
    installedPackages.forEach((package) =>
        print(
            '$package has permissions:\n${permissionMap[package]}\n\n'
        )
    );
  }

  Future<Map<String,String>> _getPermissions() async {
    //Add support for checking if any "extra permissions" are given here, to rinse them out before they can get in!!
    Map<String, String> permissionMap;
    try{
      permissionMap = await platform.invokeMapMethod('getPermissions');
      //permissionMap.forEach((k, v) => print("app: $k \n\n\n\n\n permissions: $v \n\n\n\n"));
    } catch(e){
      print("in blacklist: _getPermissions catch clause: \n${e.toString()}");
    }
    permissionMap.forEach((k, v) => print("app: $k \npermissions: $v\n\n"));
    return permissionMap;
  }


  Future _loadApps() async {
    await LauncherAssist.getAllApps().then((apps) {
      setState(() {
        appCount = apps.length;
        installedApps = apps;   //List of Map of label, package and icon; icon is bytearray
      });
    });
    installedAppLabels = _resolveTheListLabels(installedApps);
    installedPackages = _resolveTheListPackages(installedApps);
    installedAppIcons = _resolveTheListIcons(installedApps);
  }

  _resolveTheListPackages(List<dynamic> theList){
    List<String> packageList = [];
    theList.forEach((element) =>
        packageList.add(element["package"])
    );
    //.toLowerCase().replaceAll(new RegExp(r"\s+\b|\b\s|\s|\b"), "") to remove spaces and make lowercase
    return packageList;
  }

  _resolveTheListLabels(List<dynamic> theList){
    List<String> labelList = [];
    theList.forEach((element) =>
        labelList.add(element["label"])
    );
    //.toLowerCase().replaceAll(new RegExp(r"\s+\b|\b\s|\s|\b"), "") to remove spaces and make lowercase
    return labelList;
  }

  _resolveTheListIcons(List<dynamic> theList){
    Uint8List iconList;
    theList.forEach((element) =>
        iconList.add(element["icon"])
    );
    //.toLowerCase().replaceAll(new RegExp(r"\s+\b|\b\s|\s|\b"), "") to remove spaces and make lowercase
    return iconList;
  }

  _capitalizeString(String str){
    return str.substring(0,1).toUpperCase() + str.substring(1);
  }

  Widget _getAppList(){
    return ListView.separated(
      separatorBuilder:
          (context, i) => Divider(
        color: Colors.black,
      ),
      padding: EdgeInsets.all(15.0),
      itemCount: appCount,
      itemBuilder: (context, i){
        //find installedAppLabels and match its package with the blacklisted
        //packages
        final blacklisted = (blackList.contains(_capitalizeString(installedAppLabels[i])));
        return new ListTile(
          title: Text(_capitalizeString(installedAppLabels[i]), style: TextStyle(fontWeight: FontWeight.w800),),
          trailing: Icon( blacklisted ? Icons.cancel : Icons.check_box,
              color: (blacklisted ? Colors.red : Colors.green)),
          onTap: null,
        );
      },
    );
  }
}
