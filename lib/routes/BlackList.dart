import 'package:flutter/material.dart';

class BlackList extends StatefulWidget {

  BlackList({Key key, this.appInfo}) : super(key: key);
  final appInfo;

  @override
  _BlackListState createState() =>
      _BlackListState(); //maybe pass through class again?
}

class _BlackListState extends State<BlackList> {

  List<String> blackList;
  List<String> installedAppLabels;

  @override
  Widget build(BuildContext context) {
    blackList = widget.appInfo["blackList"];
    installedAppLabels = widget.appInfo["installedLabels"];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Blacklist: ${installedAppLabels.length} apps installed',
        ),
      ),
      body: _getAppList(),
    );
  }

  _capitalizeString(String str) {
    return str.substring(0, 1).toUpperCase() + str.substring(1);
  }

  Widget _getAppList() {
    return ListView.separated(
      separatorBuilder: (context, i) => Divider(
            color: Colors.black,
          ),
      padding: EdgeInsets.all(15.0),
      itemCount: installedAppLabels.length,
      itemBuilder: (context, i) {
        //find installedAppLabels and match its package with the blacklisted
        //packages
        final blacklisted =
            (blackList.contains(_capitalizeString(installedAppLabels[i])));
        return new ListTile(
          title: Text(
            _capitalizeString(installedAppLabels[i]),
            style: TextStyle(fontWeight: FontWeight.w800),
          ),
          trailing: Icon(blacklisted ? Icons.cancel : Icons.check_box,
              color: (blacklisted ? Colors.red : Colors.green)),
          onTap: null,
        );
      },
    );
  }
}
