import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';


class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  getContacts() async {
    var contacts = await ContactsService.getContacts();
    return contacts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text('Contacts', textAlign: TextAlign.center, style: new TextStyle(fontSize: 30.0)),
        backgroundColor: Colors.transparent,
      ),
      body: IconButton(
        icon: Icon(Icons.person_pin, color: Colors.white),
        iconSize: 300.0,
        onPressed: () { print("==============================================");
        getContacts();
        },
        tooltip: 'get freaking contacts',
      ),
    );
  }
}
