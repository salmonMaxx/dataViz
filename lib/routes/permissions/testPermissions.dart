import 'package:flutter/material.dart';
import '../PermissionTemplate.dart';


// Example of how to extend and use the PermissionTemplate

class testPermissions extends StatefulWidget {
  @override
  _testPermissionsState createState() => _testPermissionsState();
}

class _testPermissionsState extends State<testPermissions> {

  //assets
  String flowerDir = 'assets/blomma_test.jpg';

  PermissionTemplateChild template = new PermissionTemplateChild();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: <Widget>[
            template.textBoxWithPic(flowerDir, "hejsan", "emma borde fängslas!!!!", 150),
          ],
      ),
    );
  }
}

class PermissionTemplateChild extends PermissionTemplate{
  PermissionTemplateChild();

  @override
  textBoxWithPic(String myImage, String myHeader, String myText, double myHeightPic) {
    return OutlineButton(
      padding: EdgeInsets.all(0.0),
      child: super.textBoxWithPic(myImage, myHeader, myText, myHeightPic),
      onPressed: () {
        print("i dun clicked it");
      },
    );
  }
}
