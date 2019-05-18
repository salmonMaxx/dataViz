import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';

import '../PermissionTemplate.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

var template = new PermissionTemplate();

class _ContactsState extends State<Contacts> {
  getContacts() async {
    var contacts = await ContactsService.getContacts();
    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        title: const Text('CONTACTS'),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            child: IconButton(
              icon: Icon(Icons.person_pin, color: Colors.white),
              iconSize: 300.0,
              onPressed: () {
                print("==============================================");
                getContacts();
              },
              tooltip: 'get freaking contacts',
            ),
          ),
        ],
      ),
    );
  }
}
