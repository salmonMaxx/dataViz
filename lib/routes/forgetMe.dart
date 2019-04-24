import 'package:flutter/material.dart';


class ForgetMe extends StatefulWidget{
  @override
  _ForgetMeState createState()=>_ForgetMeState();
}

class _ForgetMeState extends State<ForgetMe>{
  deleteFromDB(){
    print ('Now you are forgotten');
  }
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: AppBar(
        title: Text('Forget Me'),
        actions: <Widget>[
          IconButton(
        icon: Icon(Icons.done_outline),
            tooltip: 'Press to be forgotten',
            onPressed: deleteFromDB(),
        )

        ],
      ),
      body:
          ListView(
            shrinkWrap: true,
              children: <Widget>[

        Container(
          height: 220,
          width: 110,
            decoration: BoxDecoration(color: Color(20)),

        )
        ]
          )
    );
  }
}