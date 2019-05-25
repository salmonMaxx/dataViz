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
  String infoHeader = 'Who cares about your contacts?';
  String infoText = '\nSharing your contact list may seem quite harmless at first sight. After all most numbers are online already? There are several problems with this. First, the contact list could include sensitive data (pin codes, passwords, hidden addresses) that often are about other people that have not given their consent. Furthermore, the contact list is often combined with other data such as the GPS making it very easy to track where you are and who you talk to.';


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
        //email = contact?.emails ?? "";
        contactInfo.add('$givenName $firstName');
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
                null, "Are these your friends?", null, contactInfo),
          ),
          new Container(
            alignment: Alignment.center,
            child: IconButton(
              icon: Icon(Icons.person_pin, color: Colors.white),
              iconSize: 100.0,
              onPressed: (){
              },
              tooltip: 'Get contacts',
            ),
          ),
          new Container(
            child: template.otherPermissionBox(
                null, null, widget.whoHasContacts),
          ),
          new Container(
            child: template.textBoxWithPic(null, "assets/people.jpg", infoHeader, 20, infoText, 14, null),
          )
        ],
      ),
    );
  }
}