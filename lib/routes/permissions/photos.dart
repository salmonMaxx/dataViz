import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'photo_list.dart';

class PhotoPage extends StatefulWidget {
  final AssetPathEntity pathEntity;
  final List<AssetEntity> photos;

  const PhotoPage({Key key, this.pathEntity, this.photos}) : super(key: key);

  @override
  PhotoPageState createState() => PhotoPageState();
}

class PhotoPageState extends State<PhotoPage> {
  partyPicFinder1(int theTime) {
    List<AssetEntity> thePartyPicList = [];

    for (int i = 0; i < widget.photos.length; i++) {
      AssetEntity item = widget.photos[i];
      AssetEntity theItem = widget.photos[i];
      String dateTime = "${item.createDateTime}";
      String theHourString = dateTime.substring(11, 13);
      int theHour = int.parse(theHourString);

      if (theHour == theTime) {
        //print("===========================!!!");
        //print(entity.id);
        thePartyPicList.add(theItem);
      }
    }
    return (thePartyPicList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
        //title: const Text('VIDEO & IMAGE'),
        title: Text(widget.pathEntity.name),
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(left: 30.0, right: 30, top:10, bottom:10),
            height: 80,
            child: Text(
              "Uh-oh what is this, photos from your nightly adventures...\n scroll down",
              style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 25),
            ),
          ),
          new Scrollbar(
          child: Container(
            height: 400,
            //child: PhotoList(photos: widget.photos),
            child: PhotoList(photos: partyPicFinder1(13)),
          ),
          ),
          new Container(
            margin: EdgeInsets.only(left: 5.0, right: 5, top:10, bottom:10),
            height: 80,
            child: Text(
              "We will not use your pictures, we promise! However, other apps with this permission would easily reach this as well",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.indigo[900],
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
