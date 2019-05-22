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
  List<String> contactInfo;


  @override
  void initState(){
    super.initState();
    _getContacts().then((list) => setState(() {
      contactInfo = list;
    }));
  }

  Future<List<String>> _getContacts() async {
    PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.contacts);
    if(permission != PermissionStatus.granted) {
      Map<PermissionGroup,
          PermissionStatus> requestContacts = await PermissionHandler()
          .requestPermissions([PermissionGroup.contacts]);
    }
    Iterable<Contact> listToFix = await ContactsService.getContacts();
    return _fixContactInfo(listToFix);
  }

  Future<List<String>> _fixContactInfo(Iterable<Contact> contactIterable) async{
    List <String> contactInfo = [];
    String givenName;
    String firstName;
    String email;
    for (var contact in contactIterable) {
      if (contact.givenName != null) {
        givenName = contact?.givenName ?? "";
        firstName = contact?.familyName ?? "";
        contactInfo.add(givenName + " " + firstName);
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
            child: template.scrollListWithHeader(
                null, "Are these guys your friends?", null, contactInfo),
          ),
          new Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.person_pin, color: Colors.white),
              iconSize: 100.0,
              onPressed: (){
              },
              tooltip: 'get freaking contacts',
            ),
          ),
          new Container(
            child: template.otherPermissionBox(
                null, null, widget.whoHasContacts),
          ),
        ],
      ),
    );
  }
}