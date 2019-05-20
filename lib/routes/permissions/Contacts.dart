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
  Iterable<Contact> _contactIterable;
  dynamic contactInfo;


  @override
  void initState(){
    super.initState();
    getContacts();
  }


  getContacts() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    if(permission != PermissionStatus.granted) {
      Map<PermissionGroup,
          PermissionStatus> requestContacts = await PermissionHandler()
          .requestPermissions([PermissionGroup.contacts]);
    }
    await ContactsService.getContacts().then((contacts) => _contactIterable = contacts);
  }

  fixContactInfo() async{
    List <String> contactInfo = [];
    String GN;
    String FN;
    String Email;
    for (var contact in _contactIterable) {
      if (contact.givenName != null) {
        GN = contact?.givenName ?? "";
        FN = contact?.familyName ?? "";
        contactInfo.add(GN + " " + FN);
      }
    }
    return contactInfo;
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
            child: template.scrollListWithHeader(null, "Are these guys your friends?", null, contactInfo),
          ),
          new Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.person_pin, color: Colors.white),
              iconSize: 100.0,
              onPressed: null,
              tooltip: 'get freaking contacts',
            ),
          ),
         new Container(
           child: template.otherPermissionBox(null, null, widget.whoHasContacts),
         ),
        ],
      ),
    );
  }
}