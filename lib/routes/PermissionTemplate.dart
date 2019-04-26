import 'package:flutter/material.dart';

class PermissionTemplate extends StatefulWidget {
  @override
  _PermissionTemplateState createState() => _PermissionTemplateState();
}

class _PermissionTemplateState extends State<PermissionTemplate>{


 @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(
       title: Text('Permission Template'),
     ),
     body: ListView(
       shrinkWrap: true,
       children: <Widget>[
         Container(
           color: Colors.blueAccent,
           margin: EdgeInsets.all(8),

         ),
         Row(
          children: <Widget>[
            Expanded(child: Text('test')),
            Expanded(child: Text('Test2')),
            Expanded(child: Text('Test 3')),
          ],
         ),
         Row(
           children: <Widget>[
             Expanded(child: Text('test')),
             Expanded(child: Text('Test2')),
             Expanded(child: Text('Test 3')),
           ],
         )
       ],
     )

   );

  }}