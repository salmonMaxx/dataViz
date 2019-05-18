import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

import '../PermissionTemplate.dart';

class Contacts extends StatefulWidget {
  Contacts(this.whoHasContacts);
  final List<String> whoHasContacts;
  @override
  _ContactsState createState() => _ContactsState();
}

var template = new PermissionTemplate();

class _ContactsState extends State<Contacts> {
  PermissionStatus contactPermissionStatus;

  getContacts() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    if(permission != PermissionStatus.granted || permission != PermissionStatus.unknown) {
      Map<PermissionGroup,
          PermissionStatus> requestContacts = await PermissionHandler()
          .requestPermissions([PermissionGroup.contacts]);
    }
    Iterable<Contact> contacts = await ContactsService.getContacts();
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

